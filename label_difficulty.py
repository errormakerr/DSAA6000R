import json
import sys
import os
import traceback

# 添加 spider-master 目录到搜索路径
current_dir = os.path.dirname(os.path.abspath(__file__))
spider_dir = os.path.join(current_dir, 'spider-master')

if spider_dir not in sys.path:
    sys.path.insert(0, spider_dir)

print(f"📁 当前目录: {current_dir}")
print(f"📁 Spider目录: {spider_dir}")

# 导入所需模块
try:
    from process_sql import get_schema, Schema, get_sql
    from evaluation import Evaluator
    print("✅ 模块导入成功\n")
except ImportError as e:
    print(f"❌ 导入错误: {e}")
    sys.exit(1)

def convert_tables_json_to_schema(table_data):
    """将tables.json格式转换为Schema期望的格式（统一小写）"""
    schema = {}
    
    # 获取表名（转小写）
    table_names = [t.lower() for t in table_data['table_names_original']]
    
    # 遍历每个表，构建 schema
    for table_idx, table_name in enumerate(table_names):
        # 获取该表的所有列（转小写）
        columns = []
        for col_idx, (tbl_idx, col_name) in enumerate(table_data['column_names_original']):
            if tbl_idx == table_idx:
                # 🔧 关键：将列名转为小写
                columns.append(col_name.lower())
        
        schema[table_name] = columns
    
    return schema

def label_difficulty(gold_file, db_dir, tables_file, output_file):
    """为gold SQL标注难度"""
    
    # 初始化evaluator
    evaluator = Evaluator()
    
    # 读取gold文件
    with open(gold_file, 'r', encoding='utf-8') as f:
        gold_lines = f.readlines()
    
    # 读取tables信息
    with open(tables_file, 'r', encoding='utf-8') as f:
        tables_data = json.load(f)
    
    # 构建数据库名到schema的映射
    db_schemas = {}
    for table in tables_data:
        db_id = table['db_id']
        # 🔧 转换格式（统一小写）
        schema_dict = convert_tables_json_to_schema(table)
        db_schemas[db_id] = schema_dict
    
    print(f"📊 已加载 {len(db_schemas)} 个数据库的schema")
    
    # 🔍 调试：打印第一个schema的结构
    if db_schemas:
        first_db = list(db_schemas.keys())[0]
        print(f"\n🔍 示例数据库 '{first_db}' 的schema:")
        for table, cols in list(db_schemas[first_db].items())[:2]:
            print(f"   {table}: {cols[:3]}...")
    print()
    
    results = []
    success_count = 0
    error_count = 0
    schema_cache = {}  # 缓存已创建的Schema对象
    
    for idx, line in enumerate(gold_lines):
        parts = line.strip().split('\t')
        if len(parts) < 2:
            continue
        
        sql_str = parts[0].strip()
        db_name = parts[1].strip()
        
        if not sql_str or not db_name:
            continue
        
        try:
            # 获取或创建Schema对象
            if db_name not in schema_cache:
                if db_name in db_schemas:
                    # 使用tables.json中的schema
                    schema_cache[db_name] = Schema(db_schemas[db_name])
                else:
                    # 从数据库文件读取
                    db_path = os.path.join(db_dir, db_name, f"{db_name}.sqlite")
                    if not os.path.exists(db_path):
                        raise FileNotFoundError(f"Database not found: {db_path}")
                    schema_dict = get_schema(db_path)
                    schema_cache[db_name] = Schema(schema_dict)
            
            schema = schema_cache[db_name]
            
            # 解析SQL
            sql = get_sql(schema, sql_str)
            
            # 计算难度
            hardness = evaluator.eval_hardness(sql)
            
            # 保存结果
            results.append({
                'index': idx,
                'database': db_name,
                'sql': sql_str,
                'difficulty': hardness
            })
            
            success_count += 1
            
            # 每100条打印一次进度
            if (idx + 1) % 100 == 0:
                print(f"✅ [{idx+1}/{len(gold_lines)}] 成功: {success_count}, 失败: {error_count}")
            
        except Exception as e:
            error_count += 1
            
            # 详细错误信息（前5个错误）
            if error_count <= 5:
                print(f"\n❌ [{idx+1}] 错误详情:")
                print(f"   数据库: {db_name}")
                print(f"   SQL: {sql_str[:100]}...")
                print(f"   错误: {e}")
                
                # 🔍 打印该数据库的schema（帮助调试）
                if db_name in db_schemas:
                    print(f"   Schema keys: {list(db_schemas[db_name].keys())}")
                    for table, cols in list(db_schemas[db_name].items())[:1]:
                        print(f"   {table} 的列: {cols[:5]}...")
                
                if error_count <= 3:
                    print(f"   完整堆栈:")
                    traceback.print_exc()
                print()
            elif error_count == 6:
                print(f"⚠️  后续错误将只显示简要信息...\n")
            else:
                if error_count % 100 == 0:
                    print(f"⚠️  已处理 {idx+1} 条，失败 {error_count} 条")
            
            results.append({
                'index': idx,
                'database': db_name,
                'sql': sql_str,
                'difficulty': 'error',
                'error': str(e)
            })
    
    # 保存到文件
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(results, f, indent=2, ensure_ascii=False)
    
    # 统计
    stats = {}
    for r in results:
        diff = r['difficulty']
        stats[diff] = stats.get(diff, 0) + 1
    
    print("\n" + "="*50)
    print("难度统计:")
    print("="*50)
    total = len(results)
    for diff in ['easy', 'medium', 'hard', 'extra', 'error']:
        if diff in stats:
            count = stats[diff]
            percentage = (count / total) * 100
            print(f"{diff:10s}: {count:4d} ({percentage:5.1f}%)")
    print("="*50)
    print(f"总计: {total} (成功: {success_count}, 失败: {error_count})")
    
    return results

# if __name__ == "__main__":
#     import argparse
#     GOLD_PATH = 'D:/project/dsaa6000R/spider-master/spider_data/test_gold.sql'
#     DB_PATH = 'D:/project/dsaa6000R/spider-master/spider_data/test_database'
#     SCHEMA_PATH = 'D:/project/dsaa6000R/spider-master/spider_data/test_tables.json'
    
#     parser = argparse.ArgumentParser(description='为Spider数据集的gold SQL标注难度')
#     parser.add_argument('--gold', default=GOLD_PATH, help='gold SQL文件路径')
#     parser.add_argument('--db', default=DB_PATH, help='数据库目录')
#     parser.add_argument('--table', default=SCHEMA_PATH, help='tables.json文件路径')
#     parser.add_argument('--output', default='gold_with_difficulty.json', help='输出文件路径')
    
#     args = parser.parse_args()
    
#     # 检查文件是否存在
#     for path, name in [(args.gold, 'Gold文件'), (args.table, 'Tables文件'), (args.db, '数据库目录')]:
#         if not os.path.exists(path):
#             print(f"❌ 找不到{name}: {path}")
#             sys.exit(1)
    
#     print("="*50)
#     print("开始处理...")
#     print("="*50)
#     print(f"Gold文件: {args.gold}")
#     print(f"数据库目录: {args.db}")
#     print(f"Tables文件: {args.table}")
#     print(f"输出文件: {args.output}")
#     print("="*50 + "\n")
    
#     results = label_difficulty(args.gold, args.db, args.table, args.output)
    
#     print(f"\n✅ 完成! 结果已保存到: {args.output}")



