# Governance Rule Dictionary

This document defines the data quality rules used in the governance platform.

## Rule 1: unique_commit_sha

Ensures every commit SHA is unique.

SQL:

SELECT commit_sha
FROM mart_mart.fact_commits
GROUP BY commit_sha
HAVING COUNT(*) > 1

Severity: Critical

---

## Rule 2: commit_sha_not_null

Ensures commit SHA values are not null.

SQL:

SELECT *
FROM mart_mart.fact_commits
WHERE commit_sha IS NULL

Severity: Critical

---

## Rule 3: commit_repo_fk

Ensures commits reference a valid repository.

SQL:

SELECT repository_id
FROM mart_mart.fact_commits
WHERE repository_id NOT IN
(
SELECT repository_id FROM mart_mart.dim_repository
)

Severity: High

---

## Rule 4: unique_pull_request

Ensures pull request IDs are unique.

SQL:

SELECT pull_request_id
FROM mart_mart.fact_pull_requests
GROUP BY pull_request_id
HAVING COUNT(*) > 1

Severity: Critical

---

## Rule 5: unique_issue

Ensures issue IDs are unique.

SQL:

SELECT issue_id
FROM mart_mart.fact_issues
GROUP BY issue_id
HAVING COUNT(*) > 1

Severity: Critical