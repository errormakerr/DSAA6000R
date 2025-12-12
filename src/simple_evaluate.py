#!/usr/bin/env python3
import nltk
def _ensure_nltk_resources():
    try:
        nltk.data.find('tokenizers/punkt')
    except LookupError:
        nltk.download('punkt', quiet=True)
    try:
        nltk.data.find('tokenizers/punkt_tab/english')
    except LookupError:
        try:
            nltk.download('punkt_tab', quiet=True)
        except Exception:
            pass

_ensure_nltk_resources()

""" 
简化的评估例子 - 直接运行
"""
import subprocess
import os

# 设置文件路径
GOLD_PATH = 'data\\test_gold.sql'
PRED_PATH = 'eval_data\\react_pred.sql'
DB_PATH = 'data\\test_database'
SCHEMA_PATH = 'data\\test_tables.json'

def evaluate_sql():
    # 设置文件路径
    gold_file=GOLD_PATH
    pred_file=PRED_PATH
    db_dir=DB_PATH
    table_file=SCHEMA_PATH

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
    result = subprocess.run(
        cmd,
        cwd='spider-master',
        capture_output=False,
        text=True
    )

    return result

if __name__ == '__main__':
    evaluate_sql()