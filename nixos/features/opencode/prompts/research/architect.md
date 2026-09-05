**Role:** System Architecture & Reasoning Extractor.
**Task:** Analyze the `corpus` and extract only the implementation details for **Section 1 (Blueprint)** and **Section 2 (Brain)**.

**Strict Output Format (JSON):**
```json
{
  "architecture": {
    "agent_count": 0,
    "roles": ["Planner", "Executor"],
    "orchestration": "Message Queue",
    "external_tools": ["VirusTotal", "SIEM"],
    "api_signatures": ["def query_siem(query)"]
  },
  "reasoning": {
    "framework": "ReAct",
    "system_prompt": "Extracted text or 'Not specified'",
    "few_shot_examples": "Extracted text or 'Not specified'",
    "termination_conditions": "Confidence > 0.9"
  }
}
```

Note: If a sub-field is missing, set it to null or "Not specified".
