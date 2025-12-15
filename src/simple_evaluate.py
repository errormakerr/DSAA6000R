#!/usr/bin/env python3
import os
import subprocess
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

# 当前脚本所在目录：DSAA_6000R/src
SRC_DIR = os.path.dirname(os.path.abspath(__file__))

# 项目根目录：DSAA_6000R
ROOT_DIR = os.path.dirname(SRC_DIR)

# 评估脚本：用 src 目录下的 evaluation.py
EVAL_SCRIPT = os.path.join(SRC_DIR, "evaluation.py")

# 数据路径（都在项目根目录下）
GOLD_PATH = os.path.join(ROOT_DIR, "data", "test_gold.sql")
PRED_PATH = os.path.join(ROOT_DIR, "eval_data", "react_pred.sql")
DB_PATH = os.path.join(ROOT_DIR, "data", "test_database")
SCHEMA_PATH = os.path.join(ROOT_DIR, "data", "test_tables.json")


def evaluate_sql():
    cmd = [
        "python",
        EVAL_SCRIPT,
        "--gold",
        GOLD_PATH,
        "--pred",
        PRED_PATH,
        "--db",
        DB_PATH,
        "--table",
        SCHEMA_PATH,
        "--etype",
        "match",  # 评估 exact match 和 partial match
    ]

    print("执行命令:", " ".join(cmd))
    print("=" * 80)

    # 工作目录设为项目根目录，这样 evaluation.py 里若用相对路径，也能找到 data/ 等
    result = subprocess.run(
        cmd,
        cwd=ROOT_DIR,
        capture_output=True,  # 捕获输出，方便调试；如果想直接打印可设为 False
        text=True,
    )

    print("【STDOUT】")
    print(result.stdout)
    if result.stderr:
        print("【STDERR】")
        print(result.stderr)

    return result


if __name__ == "__main__":
    evaluate_sql()
