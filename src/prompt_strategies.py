"""
Prompt Strategies for Text-to-SQL generation.

This module provides three different prompting strategies:
1. Base (Initial) - Simple direct prompt
2. CoT (Chain-of-Thought) - Step-by-step reasoning
3. Few-Shot - Includes example (question, SQL) pairs
"""

import json
import random
from typing import List, Dict, Tuple, Optional

# Default few-shot examples (diverse difficulty levels)
DEFAULT_FEW_SHOT_EXAMPLES = [
    {
        "question": "How many clubs are there?",
        "sql": "SELECT count(*) FROM club"
    },
    {
        "question": "What is the name of the player with the highest earnings?",
        "sql": "SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1"
    },
    {
        "question": "Show names of players and names of clubs they are in.",
        "sql": "SELECT T2.Name, T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID"
    },
    {
        "question": "Show names of clubs in descending order of average earnings of players belonging.",
        "sql": "SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T1.Club_ID ORDER BY avg(T2.Earnings) DESC"
    },
    {
        "question": "List the name of clubs that do not have players.",
        "sql": "SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)"
    }
]


def load_few_shot_examples(filepath: str = "gold_with_difficulty.json", 
                           count: int = 5, 
                           seed: int = 42) -> List[Dict]:
    """
    Load few-shot examples from gold data file.
    Selects diverse examples across difficulty levels.
    """
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            data = json.load(f)
        
        # Group by difficulty
        by_difficulty = {}
        for item in data:
            diff = item.get('difficulty', 'unknown')
            if diff not in by_difficulty:
                by_difficulty[diff] = []
            by_difficulty[diff].append(item)
        
        # Select balanced samples
        random.seed(seed)
        examples = []
        difficulties = ['easy', 'medium', 'hard', 'extra']
        
        for diff in difficulties:
            if diff in by_difficulty and len(examples) < count:
                sample = random.choice(by_difficulty[diff])
                examples.append({
                    "question": sample['question'],
                    "sql": sample['sql']
                })
        
        # Fill remaining if needed
        while len(examples) < count and data:
            sample = random.choice(data)
            examples.append({
                "question": sample['question'],
                "sql": sample['sql']
            })
        
        return examples[:count]
    
    except Exception as e:
        print(f"⚠️ Could not load few-shot examples: {e}. Using defaults.")
        return DEFAULT_FEW_SHOT_EXAMPLES[:count]


class PromptStrategies:
    """Generate prompts using different strategies."""
    
    def __init__(self, few_shot_examples: Optional[List[Dict]] = None):
        self.few_shot_examples = few_shot_examples or DEFAULT_FEW_SHOT_EXAMPLES
    
    def base_prompt(self, query: str, schema: str) -> str:
        """
        Base (Initial) Strategy: Direct, simple prompt.
        """
        return f"""You are an expert SQL generator. Output only the SQL statement without any explanation or markdown formatting.

Database Schema:
{schema}

Task: Convert the following natural language query into an executable SQLite SQL statement.
Query: {query}

Requirements:
- Generate valid SQLite syntax
- Use proper JOIN conditions based on foreign keys
- Return only the SQL statement
"""

    def cot_prompt(self, query: str, schema: str) -> str:
        """
        Chain-of-Thought Strategy: Step-by-step reasoning before generating SQL.
        """
        return f"""You are an expert SQL generator. Think step by step before generating the SQL.

Database Schema:
{schema}

Task: Convert the following natural language query into an executable SQLite SQL statement.
Query: {query}

Think through this step by step:
1. Identify the tables needed based on the query
2. Determine the columns to SELECT
3. Identify any JOIN conditions needed
4. Determine WHERE/GROUP BY/ORDER BY clauses
5. Generate the final SQL

After your reasoning, output ONLY the final SQL statement on the last line, with no explanation or markdown.
"""

    def few_shot_prompt(self, query: str, schema: str) -> str:
        """
        Few-Shot Strategy: Include examples before the actual query.
        """
        examples_text = "\n\n".join([
            f"Question: {ex['question']}\nSQL: {ex['sql']}"
            for ex in self.few_shot_examples
        ])
        
        return f"""You are an expert SQL generator. Learn from the examples below and generate SQL for the new query.

Database Schema:
{schema}

Examples:
{examples_text}

Now generate SQL for this query. Output only the SQL statement without any explanation or markdown formatting.
Query: {query}

SQL:"""

    def get_all_prompts(self, query: str, schema: str) -> Dict[str, str]:
        """
        Generate prompts using all three strategies.
        
        Returns:
            Dict with keys 'base', 'cot', 'few_shot' mapping to prompt strings
        """
        return {
            'base': self.base_prompt(query, schema),
            'cot': self.cot_prompt(query, schema),
            'few_shot': self.few_shot_prompt(query, schema)
        }


# Convenience function for quick access
def get_prompts(query: str, schema: str, 
                few_shot_examples: Optional[List[Dict]] = None) -> Dict[str, str]:
    """
    Generate all three strategy prompts for a query.
    
    Args:
        query: Natural language question
        schema: Database schema as string
        few_shot_examples: Optional custom examples
    
    Returns:
        Dict with 'base', 'cot', 'few_shot' prompts
    """
    strategies = PromptStrategies(few_shot_examples)
    return strategies.get_all_prompts(query, schema)


if __name__ == "__main__":
    # Test the module
    test_query = "How many students are enrolled in each course?"
    test_schema = """
    {
        "tables": ["students", "courses", "enrollments"],
        "columns": [
            ["students", "id"], ["students", "name"],
            ["courses", "id"], ["courses", "title"],
            ["enrollments", "student_id"], ["enrollments", "course_id"]
        ]
    }
    """
    
    prompts = get_prompts(test_query, test_schema)
    
    print("=" * 50)
    print("BASE PROMPT:")
    print("=" * 50)
    print(prompts['base'][:500] + "...")
    
    print("\n" + "=" * 50)
    print("COT PROMPT:")
    print("=" * 50)
    print(prompts['cot'][:500] + "...")
    
    print("\n" + "=" * 50)
    print("FEW-SHOT PROMPT:")
    print("=" * 50)
    print(prompts['few_shot'][:800] + "...")
