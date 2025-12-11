import os
import re
import json
import sqlite3
import pandas as pd
import numpy as np
from difflib import SequenceMatcher
import requests

# ================== 基础配置 ==================
DB_DICT = "/Users/hyn/PycharmProjects/ReAct/spider/spider_data/test_database"
SCHEMAS_PATH = "/Users/hyn/PycharmProjects/ReAct/spider/spider_data/test_tables.json"
TEST_DATAS_PATH = "/Users/hyn/PycharmProjects/ReAct/spider/spider_data/test.json"
PRED_SQL_PATH = "/Users/hyn/PycharmProjects/ReAct/result/react_pred_advance.sql"
COST_LOG_PATH = "/Users/hyn/PycharmProjects/ReAct/result/cost_log_advance.txt"

HKUST_URL = "https://aigc-api.hkust-gz.edu.cn/v1/chat/completions"
HKUST_API_KEY = "37b6a23e010b4a1da5cec77107e0386b04f7c1e7544e4fb49dcb69686618125b"

# ================== LLM 调用方法 ==================
def call_llm(prompt: str, model: str = "gpt-4", temperature: float = 0.2):
    """调用 HKUST-GZ LLM API"""
    headers = {
        "Content-Type": "application/json",
        "Authorization": f"Bearer {HKUST_API_KEY}"
    }
    data = {
        "model": model,
        "messages": [{"role": "user", "content": prompt}],
        "temperature": temperature
    }
    
    try:
        response = requests.post(HKUST_URL, headers=headers, data=json.dumps(data), timeout=60).json()
        
        # 检查错误
        if 'error' in response:
            print(f"❌ API Error: {response['error']}")
            return None, None
        
        content = response['choices'][0]['message']['content']
        usage = response.get('usage', None)
        return content, usage
        
    except Exception as e:
        print(f"❌ Error calling LLM: {e}")
        return None, None

# ================== Token Cost 追踪 ==================
# Token 价格
GPT4_INPUT_COST = 0.03 / 1000  
GPT4_OUTPUT_COST = 0.06 / 1000

# 全局变量
total_input_tokens = 0
total_output_tokens = 0
total_cost = 0.0
call_count = 0

def load_cost_log():
    """加载之前的成本记录"""
    global total_input_tokens, total_output_tokens, total_cost, call_count
    
    if os.path.exists(COST_LOG_PATH):
        with open(COST_LOG_PATH, 'r') as f:
            lines = f.readlines()
            if len(lines) >= 4:
                total_input_tokens = int(lines[0].strip())
                total_output_tokens = int(lines[1].strip())
                total_cost = float(lines[2].strip())
                call_count = int(lines[3].strip())
                print(f"✅ Loaded previous cost log:")
                print(f"   Previous Input Tokens: {total_input_tokens}")
                print(f"   Previous Output Tokens: {total_output_tokens}")
                print(f"   Previous Cost: ${total_cost:.6f}")
                print(f"   Previous API Calls: {call_count}\n")

def save_cost_log():
    """保存当前的成本记录"""
    with open(COST_LOG_PATH, 'w') as f:
        f.write(f"{total_input_tokens}\n")
        f.write(f"{total_output_tokens}\n")
        f.write(f"{total_cost}\n")
        f.write(f"{call_count}\n")

def update_token_cost(input_tokens: int, output_tokens: int, model: str = "gpt-4"):
    """更新token数和成本"""
    global total_input_tokens, total_output_tokens, total_cost, call_count
    
    input_cost = input_tokens * GPT4_INPUT_COST
    output_cost = output_tokens * GPT4_OUTPUT_COST
    
    total_input_tokens += input_tokens
    total_output_tokens += output_tokens
    total_cost += input_cost + output_cost
    call_count += 1
    
    return {
        "input_tokens": input_tokens,
        "output_tokens": output_tokens,
        "input_cost": input_cost,
        "output_cost": output_cost,
        "total_cost": input_cost + output_cost
    }

def print_cost_summary():
    """打印成本汇总"""
    print("\n" + "="*50)
    print("📊 Token & Cost Summary")
    print("="*50)
    print(f"Total API Calls: {call_count}")
    print(f"Total Input Tokens: {total_input_tokens}")
    print(f"Total Output Tokens: {total_output_tokens}")
    print(f"Total Tokens: {total_input_tokens + total_output_tokens}")
    print(f"Total Cost: ${total_cost:.6f}")
    print("="*50)

def reset_cost_counter():
    """重置成本计数器"""
    global total_input_tokens, total_output_tokens, total_cost, call_count
    total_input_tokens = 0
    total_output_tokens = 0
    total_cost = 0.0
    call_count = 0

# ================== SQL 执行 ==================
def run_sql(query: str, DB_PATH: str):
    """执行SQL查询"""
    conn = sqlite3.connect(DB_PATH)
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

# ================== NL → SQL ==================
def nl_to_sql(query: str, schema: str, prompt_type: str = "standard") -> str:
    """
    使用 LLM 将自然语言转为 SQL
    """
    if prompt_type == "standard":
        prompt = f"""
You are an expert SQL generator. Output only SQL.
Given the database schema:
Schema: {schema}

Convert the natural language query into an executable SQLite SQL statement.
Query: {query}

Output only the SQL statement:
"""
    
    elif prompt_type == "cot":
        prompt = f"""
You are an expert SQL generator. Let's think step by step.
Given the database schema:
Schema: {schema}

To convert the natural language query to SQL, first analyze:
1. What tables are needed?
2. What columns should be selected?
3. What conditions are needed?
4. What aggregations or joins are required?

Convert the natural language query into an executable SQLite SQL statement.
Query: {query}

Output only the SQL statement:
"""
    
    elif prompt_type == "few-shot":
        prompt = f"""
You are an expert SQL generator. Here are some examples:

Example 1:
Query: "How many students are in the database?"
SQL: SELECT COUNT(*) FROM students;

Example 2:
Query: "List all departments with their average salary"
SQL: SELECT department, AVG(salary) FROM employees GROUP BY department;

Example 3:
Query: "Find employees from the sales department earning more than 50000"
SQL: SELECT * FROM employees WHERE department='sales' AND salary > 50000;

Given the database schema:
Schema: {schema}

Convert the natural language query into an executable SQLite SQL statement.
Query: {query}

Output only the SQL statement:
"""
    
    content, usage = call_llm(prompt, model="gpt-4", temperature=0.2)
    
    if content is None:
        print(f"❌ Failed to generate SQL")
        return None
    
    # 追踪token使用
    if usage is not None:
        cost_info = update_token_cost(usage.get('prompt_tokens', 0), usage.get('completion_tokens', 0), "gpt-4")
        print(f"  └─ NL2SQL ({prompt_type}) Cost: ${cost_info['total_cost']:.6f} (input: {usage.get('prompt_tokens', 0)}, output: {usage.get('completion_tokens', 0)})")
    
    sql = content.strip()
    sql = re.sub(r"^```sql|```$", "", sql, flags=re.IGNORECASE).strip()
    return sql

# ================== SQL → NL (转换回自然语言) ==================
def sql_to_nl(sql: str, schema: str) -> str:
    """将SQL转换回自然语言"""
    prompt = f"""
Given the database schema:
Schema: {schema}

Convert this SQL statement into natural language that describes what this query does:
SQL: {sql}

Output only the natural language description:
"""
    
    content, usage = call_llm(prompt, model="gpt-4", temperature=0.2)
    
    if content is None:
        print(f"❌ Failed to convert SQL to NL")
        return ""
    
    # 追踪token使用
    if usage is not None:
        cost_info = update_token_cost(usage.get('prompt_tokens', 0), usage.get('completion_tokens', 0), "gpt-4")
    
    nl = content.strip()
    return nl

# ================== 相似度计算 ==================
def calculate_similarity(original_query: str, nl_description: str) -> float:
    """计算原始问题和SQL转换后的自然语言的相似度"""
    similarity = SequenceMatcher(None, original_query.lower(), nl_description.lower()).ratio()
    return similarity

# ================== 第一步的三个Prompt方法 ==================
def first_step_with_multiple_prompts(task: str, schema: str, db_path: str):
    """
    第一个step使用三种不同的prompt方法
    返回最佳SQL和对应的观察信息
    """
    print("\n🚀 First Step: Multi-Prompt Strategy")
    print("="*60)
    
    prompts = ["standard", "cot", "few-shot"]
    results = []
    
    # 生成三个SQL
    for prompt_type in prompts:
        print(f"\n📝 Generating SQL with {prompt_type} prompt...")
        sql = nl_to_sql(task, schema, prompt_type=prompt_type)
        
        if sql is None:
            print(f"   ❌ Failed to generate SQL")
            continue
            
        print(f"   Generated SQL: {sql[:100]}...")
        
        # 将SQL转换回自然语言
        print(f"   Converting SQL back to natural language...")
        nl = sql_to_nl(sql, schema)
        print(f"   NL Description: {nl[:100]}...")
        
        # 计算相似度
        similarity = calculate_similarity(task, nl)
        print(f"   Similarity Score: {similarity:.4f}")
        
        results.append({
            "prompt_type": prompt_type,
            "sql": sql,
            "nl": nl,
            "similarity": similarity
        })
    
    if not results:
        print("❌ No SQL generated successfully")
        return None, "", ""
    
    # 选择相似度最高的SQL
    best_result = max(results, key=lambda x: x['similarity'])
    print(f"\n✨ Best SQL selected from {best_result['prompt_type']} prompt")
    print(f"   Similarity Score: {best_result['similarity']:.4f}")
    print(f"   SQL: {best_result['sql']}")
    
    obs = f"Best SQL generated using {best_result['prompt_type']} prompt: {best_result['sql']}"
    history = f"user query: {task}\n"
    history += f"Thought: Generated SQL using multi-prompt strategy\n"
    history += f"Action: GenerateSQL[\"{task}\"]\n"
    history += f"Observation: {obs}\n"
    
    return best_result['sql'], history, obs

# ================== ReAct Agent ==================
def parse_react_output(text: str):
    """解析 ReAct 输出"""
    thought_match = re.search(r"Thought:\s*(.*?)(?=Action:|$)", text, re.DOTALL)
    action_match = re.search(r'Action:\s*([A-Za-z_]+)\["(.*?)"\]', text, re.DOTALL)
    final_match = re.search(r'Final Answer\["(.*?)"\]', text, re.DOTALL)

    thought = thought_match.group(1).strip() if thought_match else ""
    action = action_match.groups() if action_match else None
    final = final_match.group(1).strip() if final_match else None
    return {"thought": thought, "action": action, "final": final, "raw": text}

def react_agent(task: str, schema: str, db_path: str):
    """ReAct Agent 主循环"""
    step = 0
    step_costs = []

    # ========== 第一个Step：使用三个Prompt方法 ==========
    step += 1
    print(f"\n========== Step {step} ==========")
    step_cost = 0.0
    
    sql, history, obs = first_step_with_multiple_prompts(task, schema, db_path)
    
    if sql is None:
        print("❌ Failed at first step")
        return None
    
    # ========== 第二个及以后的Step：正常流程 ==========
    max_steps = 6
    
    while step < max_steps:
        step += 1
        step_cost = 0.0
        print(f"\n========== Step {step} ==========")
        
        prompt = f"""{history}
You are a ReAct agent that follows the format below exactly.
Format:
Thought: <one reasoning step>
Action: <ActionName>["argument"]

Action choice:
- GenerateSQL["user natural language"]  
  -> Put here the user's task in plain natural language that should be converted to SQL (NOT SQL).  
- RunSQL["SQL query"]  
  -> An executable SQLite SELECT query. Example: RunSQL["SELECT country, SUM(population) AS tot FROM city GROUP BY country;"]
- Final Answer["..."]  
  -> Finish and produce the final response. Only use Final Answer after you have used the tools.
  Example (correct): Final Answer["SELECT country, SUM(population) FROM city GROUP BY country;"]

Rules:
- Use the last Observation as the result of your previous Action.
- Continue reasoning from there.
- Respond with exactly one Thought(in one concise sentence) and one Action.
- If you have the final answer, use Final Answer["..."] as the Action.
"""
        
        try:
            content, usage = call_llm(prompt, model="gpt-4", temperature=0.2)
            
            if content is None:
                print(f"❌ Failed to get response from LLM")
                return None
            
            # 追踪token使用
            if usage is not None:
                cost_info = update_token_cost(usage.get('prompt_tokens', 0), usage.get('completion_tokens', 0), "gpt-4")
                step_cost += cost_info['total_cost']
                print(f"  └─ ReAct Step Cost: ${cost_info['total_cost']:.6f} (input: {usage.get('prompt_tokens', 0)}, output: {usage.get('completion_tokens', 0)})")

            output = content.strip()
            parsed = parse_react_output(output)
            
            if parsed["action"]:
                name, arg = parsed["action"]

                if name == "GenerateSQL":
                    sql = nl_to_sql(arg, schema, prompt_type="standard")
                    if sql:
                        obs = f"SQL generated: {sql}"
                    else:
                        obs = "Failed to generate SQL"
                    history += f"{output}\nObservation: {obs}\n"

                elif name == "RunSQL":
                    result = run_sql(arg, db_path)
                    if "error" in result:
                        obs = f"Error: {result['error']}"
                    else:
                        df = pd.DataFrame(result["rows"], columns=result["columns"]).head(10)
                        obs = f"SQL executed, got {len(df)} rows."
                        print(obs)
                    history += f"{output}\nObservation: {obs}\n"

                else:
                    obs = f"Unknown Action: {name}"

            elif parsed["final"]:
                step_costs.append(step_cost)
                print(f"\n✅ Final Answer: {parsed['final']}")
                print(f"Step {step} Total Cost: ${step_cost:.6f}")
                return parsed['final']

            else:
                obs = "No valid action detected."
            
            step_costs.append(step_cost)
            print(f"Step {step} Total Cost: ${step_cost:.6f}")
            
        except Exception as e:
            print(f"❌ Error in step {step}: {e}")
            return None

    return None

def count_existing_results(file_path: str) -> int:
    """统计已生成的结果数量"""
    if not os.path.exists(file_path):
        return 0
    with open(file_path, 'r', encoding='utf-8') as f:
        return len([line for line in f if line.strip()])

# ================== 程序入口 ==================
if __name__ == "__main__":

    with open(TEST_DATAS_PATH, 'r') as f:
        datas = json.load(f)
        print(f"Loaded {len(datas)} test samples.")
    with open(SCHEMAS_PATH, 'r') as f:
        schemas = json.load(f)
        print(f"Loaded {len(schemas)} database schemas.")
    
    # 加载之前的成本记录
    load_cost_log()
    
    # 检查已生成的结果数量
    existing_count = count_existing_results(PRED_SQL_PATH)
    print(f"Found {existing_count} existing results. Continuing from index {existing_count}...\n")
    
    for idx, data in enumerate(datas[existing_count:], start=existing_count):
        db_list = [schema['db_id'] for schema in schemas]
        if data['db_id'] not in db_list:
            print(f"Warning: Schema for {data['db_id']} not found.")
            continue
        
        database_path = os.path.join(DB_DICT, data['db_id'], f"{data['db_id']}.sqlite")
        raw_schema = next((schema for schema in schemas if schema['db_id'] == data['db_id']), None)
        schema = str({'column_names_original': raw_schema['column_names_original'], 
                     'table_names_original': raw_schema['table_names_original'], 
                     'db_id': raw_schema['db_id']})
        question = data['question']
        
        print(f"\n[{idx + 1}/{len(datas)}] 问题: {question}")
        pred_sql = react_agent(question, schema, database_path)
        
        if pred_sql:
            with open(PRED_SQL_PATH, "a", encoding="utf-8", newline="\n") as f:
                f.write(f"{pred_sql}\n")
            
            # 每处理一条就保存成本记录
            save_cost_log()

    print_cost_summary()