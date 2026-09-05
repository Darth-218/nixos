**Role:** Data Pipeline & Security Knowledge Base Extractor.
**Task:** Analyze the `corpus` and extract details for **Section 3 (Data/Context)** and **Section 4 (Cybersecurity Frameworks)**.

**Strict Output Format (JSON):**
```json
{
  "data_pipeline": {
    "retrieval_strategy": "Sliding Window",
    "data_schema": "OCSF JSON",
    "schema_properties": ["timestamp", "source_ip", "event_type"],
    "short_term_memory": "Session buffer",
    "long_term_memory": "MITRE Vector DB"
  },
  "cybersecurity": {
    "mitre_mapping": "Embedding retrieval",
    "hypothesis_source": "User input & CVE alerts",
    "ioc_regex": {
      "ip": "\\d{1,3}\\.\\d{1,3}...",
      "hash": "[a-fA-F0-9]{32}",
      "domain": "[a-zA-Z0-9.-]+\\.(com|net|org)"
    }
  }
}
```
