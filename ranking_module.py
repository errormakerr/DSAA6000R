"""
Ranking Module for Text-to-SQL candidate selection.

This module provides:
1. SQL-to-NL back-translation using OpenAI
2. Similarity ranking using BGE-Reranker (Cross-Encoder)
"""

import re
from typing import List, Dict, Tuple, Optional
from openai import OpenAI

# Import sentence-transformers for BGE reranker
try:
    from sentence_transformers import CrossEncoder
    RERANKER_AVAILABLE = True
except ImportError:
    RERANKER_AVAILABLE = False
    print("⚠️ sentence-transformers not installed. Run: pip install sentence-transformers")


# ================== Configuration ==================
BGE_RERANKER_MODEL = "BAAI/bge-reranker-v2-m3"

# OpenAI client (will use same config as react_interactive.py)
client = OpenAI(
    base_url="https://vip.yi-zhan.top/v1",
    api_key="sk-PhWga2qw2g8QgLq0F7A49c3039F8430aB80f5f0bA46d65Fb"
)

# Global reranker instance (lazy loaded)
_reranker: Optional[CrossEncoder] = None


def get_reranker() -> Optional[CrossEncoder]:
    """Lazy load the BGE reranker model."""
    global _reranker
    if _reranker is None and RERANKER_AVAILABLE:
        print(f"🔄 Loading BGE Reranker: {BGE_RERANKER_MODEL}...")
        _reranker = CrossEncoder(BGE_RERANKER_MODEL)
        print("✅ BGE Reranker loaded successfully.")
    return _reranker


# ================== SQL to Natural Language ==================
def sql_to_nl(sql: str, schema: str = "") -> str:
    """
    Convert SQL query to natural language description using OpenAI.
    
    Args:
        sql: The SQL query to translate
        schema: Optional database schema for context
    
    Returns:
        Natural language description of what the SQL does
    """
    schema_context = f"\nDatabase Schema:\n{schema}\n" if schema else ""
    
    prompt = f"""You are an expert at explaining SQL queries in plain English.
{schema_context}
Convert the following SQL query into a clear, concise natural language description.
Describe what the query does, not how it does it.
Output only the natural language description, nothing else.

SQL: {sql}

Natural Language Description:"""

    try:
        response = client.chat.completions.create(
            model="gpt-4o",
            messages=[{"role": "user", "content": prompt}],
            temperature=0.2,
            max_tokens=200
        )
        
        nl_description = response.choices[0].message.content.strip()
        return nl_description
    
    except Exception as e:
        print(f"❌ Error in sql_to_nl: {e}")
        return sql  # Fallback to original SQL if translation fails


def batch_sql_to_nl(sql_candidates: List[str], schema: str = "") -> List[str]:
    """
    Convert multiple SQL candidates to natural language.
    
    Args:
        sql_candidates: List of SQL queries
        schema: Database schema for context
    
    Returns:
        List of natural language descriptions
    """
    return [sql_to_nl(sql, schema) for sql in sql_candidates]


# ================== Similarity Ranking ==================
def rank_candidates(
    original_query: str,
    nl_candidates: List[str],
    sql_candidates: List[str]
) -> Tuple[str, List[Tuple[str, float]]]:
    """
    Rank SQL candidates based on semantic similarity between
    original query and back-translated NL descriptions.
    
    Uses BGE-Reranker (Cross-Encoder) for scoring.
    
    Args:
        original_query: The user's original natural language question
        nl_candidates: Back-translated NL descriptions of SQL candidates
        sql_candidates: The original SQL candidates (same order as nl_candidates)
    
    Returns:
        Tuple of (best_sql, ranked_list)
        - best_sql: The SQL with highest similarity score
        - ranked_list: List of (sql, score) tuples sorted by score descending
    """
    if len(nl_candidates) != len(sql_candidates):
        raise ValueError("nl_candidates and sql_candidates must have same length")
    
    if not nl_candidates:
        raise ValueError("No candidates to rank")
    
    reranker = get_reranker()
    
    if reranker is None:
        # Fallback: return first candidate if reranker not available
        print("⚠️ Reranker not available. Returning first candidate.")
        return sql_candidates[0], [(sql, 0.0) for sql in sql_candidates]
    
    # Construct pairs: (original_query, nl_candidate)
    pairs = [(original_query, nl) for nl in nl_candidates]
    
    # Get similarity scores using cross-encoder
    print(f"🔍 Ranking {len(pairs)} candidates with BGE Reranker...")
    scores = reranker.predict(pairs)
    
    # Combine with SQL candidates and sort
    ranked = list(zip(sql_candidates, nl_candidates, scores))
    ranked.sort(key=lambda x: x[2], reverse=True)
    
    # Log results
    print("📊 Ranking Results:")
    for i, (sql, nl, score) in enumerate(ranked):
        sql_preview = sql[:60] + "..." if len(sql) > 60 else sql
        print(f"   {i+1}. Score: {score:.4f} | {sql_preview}")
    
    best_sql = ranked[0][0]
    ranked_list = [(sql, float(score)) for sql, nl, score in ranked]
    
    return best_sql, ranked_list


def select_best_sql(
    original_query: str,
    sql_candidates: List[str],
    schema: str = ""
) -> Tuple[str, Dict]:
    """
    Full pipeline: Back-translate SQL candidates and select the best one.
    
    Args:
        original_query: User's natural language question
        sql_candidates: List of generated SQL candidates
        schema: Database schema for context
    
    Returns:
        Tuple of (best_sql, metadata)
        - best_sql: The selected SQL query
        - metadata: Dict with nl_translations, scores, etc.
    """
    print(f"\n{'='*50}")
    print("🎯 Smart SQL Selection Pipeline")
    print(f"{'='*50}")
    print(f"Original Query: {original_query}")
    print(f"Candidates: {len(sql_candidates)}")
    
    # Step 1: Back-translate all candidates
    print("\n📝 Step 1: Back-translating SQL to NL...")
    nl_translations = batch_sql_to_nl(sql_candidates, schema)
    
    for i, (sql, nl) in enumerate(zip(sql_candidates, nl_translations)):
        strategy = ['Base', 'CoT', 'Few-Shot'][i] if i < 3 else f'Candidate {i+1}'
        print(f"   [{strategy}] {nl[:80]}...")
    
    # Step 2: Rank by similarity
    print("\n📊 Step 2: Ranking by similarity...")
    best_sql, ranked_list = rank_candidates(original_query, nl_translations, sql_candidates)
    
    # Prepare metadata
    metadata = {
        "original_query": original_query,
        "candidates": [
            {
                "sql": sql,
                "nl_translation": nl,
                "score": score
            }
            for (sql, score), nl in zip(ranked_list, nl_translations)
        ],
        "best_sql": best_sql,
        "best_score": ranked_list[0][1] if ranked_list else 0.0
    }
    
    print(f"\n✅ Selected SQL (score: {metadata['best_score']:.4f}):")
    print(f"   {best_sql}")
    
    return best_sql, metadata


# ================== Testing ==================
if __name__ == "__main__":
    # Test SQL-to-NL
    test_sql = "SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1"
    print("Testing SQL-to-NL:")
    print(f"SQL: {test_sql}")
    nl = sql_to_nl(test_sql)
    print(f"NL: {nl}")
    
    print("\n" + "="*50)
    
    # Test ranking (if reranker available)
    if RERANKER_AVAILABLE:
        test_query = "Who is the highest paid player?"
        test_candidates = [
            "SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1",
            "SELECT * FROM player WHERE Earnings > 1000000",
            "SELECT MAX(Earnings) FROM player"
        ]
        
        print("\nTesting Full Pipeline:")
        best, meta = select_best_sql(test_query, test_candidates)
        print(f"\nFinal Selection: {best}")
    else:
        print("\n⚠️ Skipping ranking test - install sentence-transformers first")
