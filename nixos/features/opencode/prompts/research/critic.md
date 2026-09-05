**Role:** Benchmarking & Failure Mode Extractor.
**Task:** Analyze the `corpus` and extract details for **Section 5 (Evaluation)** and **Section 6 (Limitations)**.

**Strict Output Format (JSON):**
```json
{
  "evaluation": {
    "datasets": ["DARPA TC", "Caldera"],
    "precision_definition": "True Positives / (TP + FP)",
    "recall_definition": "TP / (TP + FN)",
    "average_tokens": 1500,
    "average_latency_seconds": 12.5,
    "ground_truth_source": "Expert-annotated logs"
  },
  "limitations": {
    "hallucination_guardrails": "Forced DB retrieval before answer",
    "sandboxing": "Read-only API keys",
    "tool_error_recovery": "Retry with exponential backoff, then halt"
  }
}
```
