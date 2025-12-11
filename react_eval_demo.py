import os
import json
import sqlite3
import re
from collections import defaultdict
from openai import OpenAI
import subprocess
import pandas as pd  

client = OpenAI(base_url="https://www.chatgtp.cn/v1",
                api_key="sk-z38TPP3SlXtHNj3tsnf8rSEHS0xqKCQxglXHSUHlQzutV6rB")


# 文件路径
DB_PATH = "spider-master/spider_data/test_database"
SCHEMA_PATH = "spider-master/spider_data/test_tables.json"
TEST_PATH = "./spider/spider_data/test.json"
GOLD_PATH = "./spider/spider_data/test_gold.sql"
PRED_PATH = "./spider/result/test_pred" # 新增保存预测SQL的路径
RESULT_PATH = "./result"  # 保存评估结果的文件路径

# 筛选所有以.sqlite结尾的文件
sqlite_files = []
for filename in os.listdir(DB_PATH):
    if re.match(r".*\.sqlite$", filename, re.IGNORECASE):
        sqlite_files.append(os.path.join(DB_PATH, filename))
# 打印找到的SQLite文件
print(f"找到{len(sqlite_files)}个SQLite数据库文件：")


# ================== 执行 SQL 查询==================
def run_sql(query: str):
    conn = sqlite3.connect(sqlite_files)
    cursor = conn.cursor()
    try:
        cursor.execute(query)
        result = cursor.fetchall()
        col_names = [desc[0] for desc in cursor.description]
        return {"columns": col_names, "rows": result}
    except Exception as e:
        return {"error": str(e)}
    finally:
        conn.close()

# ==================读取 Schema 信息==================
def load_schema(db_id):
    """加载指定数据库的Schema信息"""
    with open(SCHEMA_PATH, "r") as f:
        schema_data = json.load(f)
        
    # 找到指定db_id的schema
    db_schema = None
    for item in schema_data:
        if item["db_id"] == db_id:
            db_schema = item
            break
            
    if not db_schema:
        raise ValueError(f"未找到数据库 {db_id} 的schema信息")
        
    # 构建表结构信息
    schema = {}
    schema["table_names"] = db_schema["table_names"]
    schema["columns"] = {}
    
    # 获取列信息
    for i, table in enumerate(db_schema["table_names"]):
        columns = []
        for col_id, col in enumerate(db_schema["column_names_original"]):
            if col[0] == i:  # 该列属于当前表
                columns.append(col[1])
        schema["columns"][table] = columns
        
    return schema

# ==================将自然语言转为 SQL==================
def nl_to_sql(question: str, schema: dict) -> str:
    
    all_tables = ", ".join(schema["table_names"])
    table_columns = []
    for table, cols in schema["columns"].items():
        table_columns.append(f"{table}: {', '.join(cols)}")
    table_columns_str = "\n  ".join(table_columns)
    
    # 将query改为了question
    prompt = f"""
    You are an expert SQL generator，Output only SQL.
    Given the table schema:
    Table: {all_tables}
    Columns: {cols}

    Convert the natural language question into an executable SQLite SQL statement.
    Question: {table_columns_str}
    """
 
    response = client.chat.completions.create(
            model="gpt-3.5-turbo",
            messages=[{"role": "user", "content": prompt}],
            temperature=0.2,
        )
    sql = response.choices[0].message.content.strip()
    sql = re.sub(r"^```sql|```$", "", sql, flags=re.IGNORECASE).strip()
    return sql

# ==================提取 Token 消耗数据==================
class TokenAverageTracker:
    def __init__(self):
        self.total_tokens = 0  # 累计总Token（输入+输出）
        self.call_count = 0    # 累计调用次数

    def add_call(self, response):
        """添加一次调用的Token数据，更新累计值并返回当前平均值"""
        # 提取本次总Token（从响应中获取）
        current_total = response.usage.total_tokens
        
        # 更新累计值
        self.total_tokens += current_total
        self.call_count += 1
        
        # 计算平均值（避免除零）
        average = self.total_tokens / self.call_count if self.call_count > 0 else 0
        
        # 可按需打印当前平均值（可选）
        print(f"累计调用次数：{self.call_count}，平均每次Token消耗：{round(average, 2)}")
        
        return round(average, 2)  # 返回保留两位小数的平均值
    
def parse_react_output(text: str):
    thought_match = re.search(r"Thought:\s*(.*)", text)
    action_match = re.search(r'Action:\s*([A-Za-z_]+)\["(.*?)"\]', text)
    final_match = re.search(r'Final Answer\["(.*?)"\]', text)

    thought = thought_match.group(1).strip() if thought_match else ""
    action = action_match.groups() if action_match else None
    final = final_match.group(1).strip() if final_match else None
    return {"thought": thought, "action": action, "final": final, "raw": text}

def react_agent(task: str, schema: dict, verbose=True):
    """ReAct Agent 主循环"""
    history = f"user query: {task}\n"  # 记录交互历史
    obs = "" # 记录每次动作的观察结果
    max_steps = 6 # 最大循环步数，防止无限循环
    step = 0

    while step < max_steps:
        step += 1
        prompt = f"""{history}
                        You are a ReAct agent that follows the format below exactly.
                        Format:
                        Thought: <one reasoning step>
                        Action: <ActionName>["argument"]
                        Action choice:
- GenerateSQL["user natural language"]  
  -> Put here the user's task in plain natural language that should be converted to SQL (NOT SQL).  
  Example (correct): GenerateSQL["show total population per country"]  
  Example (incorrect): GenerateSQL["SELECT country, SUM(pop) FROM city GROUP BY country;"]
- RunSQL["SQL query"]  
  -> An executable SQLite SELECT query. Example: RunSQL["SELECT country, SUM(population) AS tot FROM city GROUP BY country;"]
- Visualize["pie"/"bar"/"line"]  
  -> Visualize the most recent SQL result saved by the system.
- Final Answer["..."]  
  -> Finish and produce the final textual response. Only use Final Answer after you have used the tools and have an Observation containing the final analysis or chart path.
                        Rules:
                        - Use the last Observation as the result of your previous Action.
                        - Continue reasoning from there.
                        - Respond with exactly one Thought（in one concise sentence） and one Action.
                        - If you have the final answer, use Final Answer["..."] as the Action.
                        Think step by step.
                        """
        
        response = client.chat.completions.create(
            model="gpt-3.5-turbo",
            messages=[{"role": "user", "content": prompt}],
            temperature=0.2,
        )

        avg = tracker.add_call(response)

        output = response.choices[0].message.content.strip() # 模型输出的原始文本
        parsed = parse_react_output(output) # 解析出思考、动作、最终答案

        #if verbose:
            #print(f"\n--- Step {step} Output ---\n{output}")

        if parsed["action"]:
            name, arg = parsed["action"]

            if name == "GenerateSQL":
                sql = nl_to_sql(arg, schema)
                last_sql = sql  # 更新最后生成的SQL
                obs = f"SQL generated: {sql}"
                history += f"{output}\nObservation: {obs}\n"

            elif name == "RunSQL":
                last_sql = arg  # 更新最后执行的SQL
                result = run_sql(arg)
                if "error" in result:
                    obs = f"Error: {result['error']}"
                else:
                    df = pd.DataFrame(result["rows"], columns=result["columns"]).head(10)
                    df.to_csv("temp_result.csv", index=False)
                    obs = f"SQL executed, got {len(df)} rows. Saved to temp_result.csv"
                    print(obs)
                history += f"{output}\nObservation: {obs}\n"

        elif parsed["final"]:
            # 在返回之前保存最后的SQL
            if last_sql:
                os.makedirs(os.path.dirname(PRED_PATH), exist_ok=True)
                with open(PRED_PATH, 'w') as f:
                    f.write(last_sql)
                print(f"\nSaved final SQL to {PRED_PATH}")
            print(f"\n✅ Final Answer: {parsed['final']}")
            return history
            break

        else:
            obs = "No valid action detected."
        #history += output + "\n"

# ==================评估精确度==================
def evaluate_sql(avg_token=None):
    # 设置文件路径
    gold_file=GOLD_PATH
    pred_file=PRED_PATH
    db_dir=DB_PATH
    table_file=SCHEMA_PATH

    # 确保结果目录存在
    os.makedirs(os.path.dirname(RESULT_PATH), exist_ok=True)

    # 切换到spider目录并运行评估
    cmd = [
        'python', 'evaluation.py',
        '--gold', gold_file,
        '--pred', pred_file,
        '--db', db_dir,
        '--table', table_file,
        '--etype', 'match'  # 评估exact match和partial match
    ]

    print("执行命令:", ' '.join(cmd))
    print("=" * 80)

    # 运行评估
    with open(RESULT_PATH, 'w', encoding='utf-8') as f:
        result = subprocess.run(
            cmd,
            cwd='/Users/hyn/PycharmProjects/ReAct/spider',
            stdout=f,  # 标准输出重定向到文件
            stderr=subprocess.STDOUT,  # 标准错误也重定向到文件（可选，根据需要）
            text=True  # 以文本模式处理输出
        )
    
    # 如果有平均Token数据，追加到结果文件
    if avg_token is not None:
        with open(RESULT_PATH, 'a', encoding='utf-8') as f:  # 'a'表示追加模式
            f.write("\n" + "=" * 50 + "\n")
            f.write(f"平均每次调用的Token消耗: {avg_token}\n")

    print(f"评估结果已保存到: {RESULT_PATH}")
    return result

# ==================主程序入口==================

if __name__ == "__main__":
    global tracker
    tracker = TokenAverageTracker()

    # 获取最终的平均Token消耗（总Token/调用次数）
    final_avg_token = tracker.total_tokens / tracker.call_count if tracker.call_count > 0 else 0
    final_avg_token = round(final_avg_token, 2)  # 保留两位小数
    
    # 执行评估并传入平均Token
    evaluate_sql(avg_token=final_avg_token)