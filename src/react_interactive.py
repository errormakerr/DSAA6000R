import os
import re
import json
import sqlite3
import matplotlib.pyplot as plt
from openai import OpenAI
import numpy as np
import pandas as pd
from typing import Dict, List, Tuple
from datetime import datetime
import random

# ================== 基础配置 ==================
DB_DICT = "data\\test_database"
SCHEMAS_PATH = "data\\test_tables.json"
TEST_DATAS_PATH = "data\\few_test.json"

PRED_SQL_PATH = "eval_data\\react_pred.sql"
TOKEN_STATS_PATH = "evaldata\\token_statistics.json"

client = OpenAI(
    base_url="",  # 填入你的 API 地址
    api_key=""     # 填入你的 API Key
)

# ================== Token 统计类 ==================
class TokenTracker:
    """追踪和统计 Token 使用情况"""
    
    def __init__(self):
        self.total_prompt_tokens = 0
        self.total_completion_tokens = 0
        self.total_tokens = 0
        self.sample_stats = []
        self.current_sample = None
    
    def start_sample(self, sample_id: str, question: str, db_id: str):
        """开始追踪新样例"""
        self.current_sample = {
            "sample_id": sample_id,
            "question": question,
            "db_id": db_id,
            "prompt_tokens": 0,
            "completion_tokens": 0,
            "total_tokens": 0,
            "steps": [],
            "success": False,
            "final_sql": None
        }
    
    def add_step(self, step_num: int, action: str, prompt_tokens: int, 
                 completion_tokens: int, total_tokens: int):
        """添加单步的 token 消耗"""
        if self.current_sample is None:
            return
        
        step_info = {
            "step": step_num,
            "action": action,
            "prompt_tokens": prompt_tokens,
            "completion_tokens": completion_tokens,
            "total_tokens": total_tokens
        }
        
        self.current_sample["steps"].append(step_info)
        self.current_sample["prompt_tokens"] += prompt_tokens
        self.current_sample["completion_tokens"] += completion_tokens
        self.current_sample["total_tokens"] += total_tokens
    
    def end_sample(self, success: bool, final_sql: str = None):
        """结束当前样例的追踪"""
        if self.current_sample is None:
            return
        
        self.current_sample["success"] = success
        self.current_sample["final_sql"] = final_sql
        
        # 更新总计
        self.total_prompt_tokens += self.current_sample["prompt_tokens"]
        self.total_completion_tokens += self.current_sample["completion_tokens"]
        self.total_tokens += self.current_sample["total_tokens"]
        
        # 保存样例统计
        self.sample_stats.append(self.current_sample)
        self.current_sample = None
    
    def get_summary(self) -> Dict:
        """获取统计摘要"""
        if not self.sample_stats:
            return {}
        
        successful_samples = [s for s in self.sample_stats if s["success"]]
        failed_samples = [s for s in self.sample_stats if not s["success"]]
        
        return {
            "total_samples": len(self.sample_stats),
            "successful_samples": len(successful_samples),
            "failed_samples": len(failed_samples),
            "total_tokens": self.total_tokens,
            "total_prompt_tokens": self.total_prompt_tokens,
            "total_completion_tokens": self.total_completion_tokens,
            "avg_tokens_per_sample": self.total_tokens / len(self.sample_stats) if self.sample_stats else 0,
            "avg_tokens_success": sum(s["total_tokens"] for s in successful_samples) / len(successful_samples) if successful_samples else 0,
            "avg_tokens_failed": sum(s["total_tokens"] for s in failed_samples) / len(failed_samples) if failed_samples else 0,
            "max_tokens_sample": max(self.sample_stats, key=lambda x: x["total_tokens"]) if self.sample_stats else None,
            "min_tokens_sample": min(self.sample_stats, key=lambda x: x["total_tokens"]) if self.sample_stats else None,
        }
    
    def save_statistics(self, filepath: str):
        """保存统计信息到 JSON 文件"""
        stats = {
            "timestamp": datetime.now().isoformat(),
            "summary": self.get_summary(),
            "samples": self.sample_stats
        }
        
        with open(filepath, 'w', encoding='utf-8') as f:
            json.dump(stats, f, indent=2, ensure_ascii=False)
        
        print(f"\n📊 Token statistics saved to: {filepath}")
    
    def print_summary(self):
        """打印统计摘要"""
        summary = self.get_summary()
        
        print(f"\n{'='*80}")
        print(f"TOKEN USAGE SUMMARY")
        print(f"{'='*80}")
        print(f"Total Samples: {summary['total_samples']}")
        print(f"  ✅ Successful: {summary['successful_samples']}")
        print(f"  ❌ Failed: {summary['failed_samples']}")
        print(f"\nToken Usage:")
        print(f"  Total Tokens: {summary['total_tokens']:,}")
        print(f"  Prompt Tokens: {summary['total_prompt_tokens']:,}")
        print(f"  Completion Tokens: {summary['total_completion_tokens']:,}")
        print(f"\nAverages:")
        print(f"  Avg per Sample: {summary['avg_tokens_per_sample']:.2f}")
        print(f"  Avg for Success: {summary['avg_tokens_success']:.2f}")
        print(f"  Avg for Failed: {summary['avg_tokens_failed']:.2f}")
        
        if summary['max_tokens_sample']:
            print(f"\nMax Token Usage:")
            max_sample = summary['max_tokens_sample']
            print(f"  Sample: {max_sample['sample_id']}")
            print(f"  Tokens: {max_sample['total_tokens']:,}")
            print(f"  Question: {max_sample['question'][:80]}...")
        
        if summary['min_tokens_sample']:
            print(f"\nMin Token Usage:")
            min_sample = summary['min_tokens_sample']
            print(f"  Sample: {min_sample['sample_id']}")
            print(f"  Tokens: {min_sample['total_tokens']:,}")
            print(f"  Question: {min_sample['question'][:80]}...")
        
        print(f"{'='*80}\n")

# 创建全局 token tracker
token_tracker = TokenTracker()

# ================== SQL 执行 ==================
def run_sql(query: str, DB_PATH: str):
    """执行 SQL 查询并返回结果"""
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    try:
        cursor.execute(query)
        result = cursor.fetchall()
        col_names = [desc[0] for desc in cursor.description] if cursor.description else []
        return {"columns": col_names, "rows": result}
    except Exception as e:
        return {"error": str(e)}
    finally:
        conn.close()

# ================== NL → SQL (带 Token 统计) ==================
def nl_to_sql(query: str, schema: str, step_num: int) -> str:
    """使用 LLM 将自然语言转为 SQL,并统计 token"""
    prompt = f"""You are an expert SQL generator. Output only the SQL statement without any explanation or markdown formatting.

Database Schema:
{schema}

Task: Convert the following natural language query into an executable SQLite SQL statement.
Query: {query}

Requirements:
- Generate valid SQLite syntax
- Use proper JOIN conditions based on foreign keys
- Return only the SQL statement
"""
    
    try:
        response = client.chat.completions.create(
            model="gpt-4o",
            messages=[{"role": "user", "content": prompt}],
            temperature=0.2,
        )
        
        # 提取 token 使用信息
        usage = response.usage
        token_tracker.add_step(
            step_num=step_num,
            action="GenerateSQL",
            prompt_tokens=usage.prompt_tokens,
            completion_tokens=usage.completion_tokens,
            total_tokens=usage.total_tokens
        )
        
        sql = response.choices[0].message.content.strip()
        sql = re.sub(r"^```sql\s*|```$", "", sql, flags=re.IGNORECASE | re.MULTILINE).strip()
        return sql
    except Exception as e:
        print(f"Error in nl_to_sql: {e}")
        return ""

# ================== ReAct 输出解析 ==================
def parse_react_output(text: str):
    """解析 ReAct Agent 的输出"""
    thought_match = re.search(r"Thought:\s*(.*?)(?=\n|$)", text, re.DOTALL)
    action_match = re.search(r'Action:\s*([A-Za-z_]+)\["(.*?)"\]', text, re.DOTALL)
    final_match = re.search(r'Final Answer\["(.*?)"\]', text, re.DOTALL)

    thought = thought_match.group(1).strip() if thought_match else ""
    action = action_match.groups() if action_match else None
    final = final_match.group(1).strip() if final_match else None
    
    return {"thought": thought, "action": action, "final": final, "raw": text}

# ================== ReAct Agent (带 Token 统计) ==================
def react_agent(task: str, schema: dict, db_path: str, max_steps: int = 6):
    """ReAct Agent 主循环,带 token 统计"""
    history = f"User Query: {task}\n\n"
    step = 0

    while step < max_steps:
        step += 1
        print(f"\n{'='*50}")
        print(f"Step {step}/{max_steps}")
        print(f"{'='*50}")
        
        prompt = f"""{history}You are a ReAct agent that converts natural language to SQL queries.

Database Schema:
{schema}

Follow this exact format:
Thought: <one concise reasoning step>
Action: <ActionName>["argument"]

Available Actions:
1. GenerateSQL["natural language description"]
   - Input: User's task in plain natural language
   - Example: GenerateSQL["show total population per country"]
   - DO NOT put SQL here, only natural language

2. RunSQL["SQL query"]
   - Input: An executable SQLite SELECT query
   - Example: RunSQL["SELECT country, SUM(population) FROM city GROUP BY country;"]

3. Final Answer["SQL query"]
   - Use this when you have successfully generated and tested the SQL
   - Return the final working SQL statement
   - Example: Final Answer["SELECT country, SUM(population) FROM city GROUP BY country;"]

Rules:
- Use the Observation from your previous Action to guide next steps
- First generate SQL, then test it, then provide final answer
- If SQL has errors, regenerate and test again
- Respond with exactly ONE Thought and ONE Action per step
- Keep thoughts concise (one sentence)

Now continue:
"""
        
        try:
            response = client.chat.completions.create(
                model="gpt-4o",
                messages=[{"role": "user", "content": prompt}],
                temperature=0.2,
            )
            
            # 统计 token 使用
            usage = response.usage
            output = response.choices[0].message.content.strip()
            
            print(f"\nAgent Output:\n{output}")
            print(f"💰 Tokens: {usage.total_tokens} (prompt: {usage.prompt_tokens}, completion: {usage.completion_tokens})")
            
        except Exception as e:
            print(f"Error calling LLM: {e}")
            return None

        parsed = parse_react_output(output)
        
        # 处理 Final Answer
        if parsed["final"]:
            # 记录这一步的 token
            token_tracker.add_step(
                step_num=step,
                action="FinalAnswer",
                prompt_tokens=usage.prompt_tokens,
                completion_tokens=usage.completion_tokens,
                total_tokens=usage.total_tokens
            )
            
            final_sql = parsed["final"].strip()
            final_sql = re.sub(r"^```sql\s*|```$", "", final_sql, flags=re.IGNORECASE | re.MULTILINE).strip()
            print(f"\n✅ Final Answer: {final_sql}")
            return final_sql
        
        # 处理 Action
        if parsed["action"]:
            name, arg = parsed["action"]
            
            if name == "GenerateSQL":
                print(f"\n🔄 Generating SQL for: {arg}")
                
                # 记录 ReAct 步骤的 token
                token_tracker.add_step(
                    step_num=step,
                    action="ReActStep",
                    prompt_tokens=usage.prompt_tokens,
                    completion_tokens=usage.completion_tokens,
                    total_tokens=usage.total_tokens
                )
                
                # GenerateSQL 会在内部记录自己的 token
                sql = nl_to_sql(arg, schema, step)
                if sql:
                    obs = f"SQL generated: {sql}"
                    print(f"Observation: {obs}")
                else:
                    obs = "Failed to generate SQL"
                    print(f"⚠️ {obs}")
                history += f"{output}\nObservation: {obs}\n\n"

            elif name == "RunSQL":
                print(f"\n🔄 Executing SQL: {arg}")
                
                # 记录 ReAct 步骤的 token
                token_tracker.add_step(
                    step_num=step,
                    action="RunSQL",
                    prompt_tokens=usage.prompt_tokens,
                    completion_tokens=usage.completion_tokens,
                    total_tokens=usage.total_tokens
                )
                
                result = run_sql(arg, db_path)
                
                if "error" in result:
                    obs = f"SQL Error: {result['error']}"
                    print(f"❌ {obs}")
                else:
                    df = pd.DataFrame(result["rows"], columns=result["columns"])
                    row_count = len(df)
                    preview = df.head(10)
                    obs = f"SQL executed successfully. Returned {row_count} rows.\nPreview:\n{preview.to_string()}"
                    print(f"✅ {obs}")
                    
                history += f"{output}\nObservation: {obs}\n\n"

            else:
                # 记录未知 action 的 token
                token_tracker.add_step(
                    step_num=step,
                    action=f"Unknown_{name}",
                    prompt_tokens=usage.prompt_tokens,
                    completion_tokens=usage.completion_tokens,
                    total_tokens=usage.total_tokens
                )
                
                obs = f"Unknown Action: {name}"
                print(f"⚠️ {obs}")
                history += f"{output}\nObservation: {obs}\n\n"
        else:
            # 记录无效 action 的 token
            token_tracker.add_step(
                step_num=step,
                action="InvalidAction",
                prompt_tokens=usage.prompt_tokens,
                completion_tokens=usage.completion_tokens,
                total_tokens=usage.total_tokens
            )
            
            obs = "No valid action detected. Please follow the format."
            print(f"⚠️ {obs}")
            history += f"{output}\nObservation: {obs}\n\n"
    
    print(f"\n❌ Max steps ({max_steps}) reached without final answer")
    return None

# ================== Token 可视化报告 ==================
def generate_token_report(tracker: TokenTracker):
    """生成 token 使用的可视化报告"""
    if not tracker.sample_stats:
        return
    
    # 创建图表
    fig, axes = plt.subplots(2, 2, figsize=(15, 10))
    fig.suptitle('Token Usage Analysis', fontsize=16, fontweight='bold')
    
    # 1. 每个样例的 token 使用
    ax1 = axes[0, 0]
    sample_ids = [s['sample_id'] for s in tracker.sample_stats]
    token_counts = [s['total_tokens'] for s in tracker.sample_stats]
    colors = ['green' if s['success'] else 'red' for s in tracker.sample_stats]
    
    ax1.bar(range(len(sample_ids)), token_counts, color=colors, alpha=0.6)
    ax1.set_xlabel('Sample Index')
    ax1.set_ylabel('Total Tokens')
    ax1.set_title('Token Usage per Sample')
    ax1.grid(True, alpha=0.3)
    
    # 2. 成功 vs 失败的 token 分布
    ax2 = axes[0, 1]
    success_tokens = [s['total_tokens'] for s in tracker.sample_stats if s['success']]
    failed_tokens = [s['total_tokens'] for s in tracker.sample_stats if not s['success']]
    
    ax2.boxplot([success_tokens, failed_tokens], labels=['Success', 'Failed'])
    ax2.set_ylabel('Total Tokens')
    ax2.set_title('Token Distribution: Success vs Failed')
    ax2.grid(True, alpha=0.3)
    
    # 3. Prompt vs Completion tokens
    ax3 = axes[1, 0]
    prompt_tokens = [s['prompt_tokens'] for s in tracker.sample_stats]
    completion_tokens = [s['completion_tokens'] for s in tracker.sample_stats]
    
    x = np.arange(len(tracker.sample_stats))
    width = 0.35
    ax3.bar(x - width/2, prompt_tokens, width, label='Prompt', alpha=0.8)
    ax3.bar(x + width/2, completion_tokens, width, label='Completion', alpha=0.8)
    ax3.set_xlabel('Sample Index')
    ax3.set_ylabel('Tokens')
    ax3.set_title('Prompt vs Completion Tokens')
    ax3.legend()
    ax3.grid(True, alpha=0.3)
    
    # 4. 统计摘要文本
    ax4 = axes[1, 1]
    ax4.axis('off')
    summary = tracker.get_summary()
    
    summary_text = f"""
    SUMMARY STATISTICS
    
    Total Samples: {summary['total_samples']}
    Successful: {summary['successful_samples']}
    Failed: {summary['failed_samples']}
    
    Total Tokens: {summary['total_tokens']:,}
    Prompt Tokens: {summary['total_prompt_tokens']:,}
    Completion Tokens: {summary['total_completion_tokens']:,}
    
    Avg Tokens/Sample: {summary['avg_tokens_per_sample']:.2f}
    Avg for Success: {summary['avg_tokens_success']:.2f}
    Avg for Failed: {summary['avg_tokens_failed']:.2f}
    """
    
    ax4.text(0.1, 0.5, summary_text, fontsize=12, family='monospace',
             verticalalignment='center')
    
    plt.tight_layout()
    plt.savefig('eval_data/token_usage_report.png', dpi=300, bbox_inches='tight')
    print(f"📊 Token usage visualization saved to: token_usage_report.png")
    plt.close()

# ================== 主程序 ==================
if __name__ == "__main__":
    # 清空或创建输出文件
    with open(PRED_SQL_PATH, "w", encoding="utf-8") as f:
        f.write("")
    
    # 加载数据
    with open(TEST_DATAS_PATH, 'r', encoding='utf-8') as f:
        datas = json.load(f)
        print(f"✅ Loaded {len(datas)} test samples.")
    
    with open(SCHEMAS_PATH, 'r', encoding='utf-8') as f:
        schemas = json.load(f)
        print(f"✅ Loaded {len(schemas)} database schemas.\n")
    
    # 创建 schema 索引
    schema_dict = {schema['db_id']: schema for schema in schemas}
    
    success_count = 0
    fail_count = 0
    
    # 处理每个测试样例
    for idx, data in enumerate(datas, 1):
        print(f"\n{'#'*80}")
        print(f"Processing {idx}/{len(datas)}: {data['db_id']}")
        print(f"{'#'*80}")
        
        db_id = data['db_id']
        question = data['question']
        
        # 开始追踪当前样例
        token_tracker.start_sample(
            sample_id=f"sample_{idx}",
            question=question,
            db_id=db_id
        )
        
        # 检查 schema 是否存在
        if db_id not in schema_dict:
            print(f"⚠️ Warning: Schema for {db_id} not found. Skipping...")
            token_tracker.end_sample(success=False)
            fail_count += 1
            continue
        
        # 构建数据库路径
        database_path = os.path.join(DB_DICT, db_id, f"{db_id}.sqlite")
        if not os.path.exists(database_path):
            print(f"⚠️ Warning: Database file not found: {database_path}. Skipping...")
            token_tracker.end_sample(success=False)
            fail_count += 1
            continue
        
        # 准备 schema
        raw_schema = schema_dict[db_id]
        schema = json.dumps({
            'db_id': raw_schema['db_id'],
            'table_names': raw_schema['table_names_original'],
            'column_names': raw_schema['column_names_original'],
            'foreign_keys': raw_schema.get('foreign_keys', []),
            'primary_keys': raw_schema.get('primary_keys', [])
        }, indent=2)
        
        print(f"\n📝 Question: {question}")
        
        # 运行 ReAct Agent
        pred_sql = react_agent(question, schema, database_path, max_steps=6)
        
        # 结束追踪并保存结果
        if pred_sql:
            token_tracker.end_sample(success=True, final_sql=pred_sql)
            with open(PRED_SQL_PATH, "a", encoding="utf-8") as f:
                f.write(f"{pred_sql}\t{db_id}\n")
            success_count += 1
            print(f"✅ Success! SQL saved.")
        else:
            token_tracker.end_sample(success=False)
            with open(PRED_SQL_PATH, "a", encoding="utf-8") as f:
                f.write(f"FAILED\t{db_id}\n")
            fail_count += 1
            print(f"❌ Failed to generate SQL.")
        
        # 显示当前样例的 token 使用
        current_stats = token_tracker.sample_stats[-1]
        print(f"\n📊 Token usage for this sample: {current_stats['total_tokens']:,}")
    
    # 输出最终统计
    print(f"\n{'='*80}")
    print(f"Processing Complete!")
    print(f"{'='*80}")
    print(f"✅ Success: {success_count}/{len(datas)}")
    print(f"❌ Failed: {fail_count}/{len(datas)}")
    print(f"📁 Results saved to: {PRED_SQL_PATH}")
    
    # 打印和保存 token 统计
    token_tracker.print_summary()
    token_tracker.save_statistics(TOKEN_STATS_PATH)
    
    # 生成 token 使用的可视化报告
    generate_token_report(token_tracker)


