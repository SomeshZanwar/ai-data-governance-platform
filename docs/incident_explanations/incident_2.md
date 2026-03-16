# Incident 2 Explanation

INCIDENT 2

Rule Failed: unique_pull_request
Severity: critical

Explanation:
This governance rule detected a data quality issue.

The rule SQL indicates a constraint violation in the dataset.

Possible causes:
- upstream ingestion failure
- incomplete dimension loads
- delayed pipeline dependencies
- duplicate or missing keys

Recommended action:
1. inspect the affected dataset
2. validate upstream pipelines
3. reload the affected tables if necessary
