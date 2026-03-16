# AI Data Governance Platform

An end-to-end data governance system built using PostgreSQL, dbt, Python, and Power BI.

The project demonstrates how analytics teams can monitor dataset quality, detect incidents, and explain failures using AI.

## Features

- GitHub Archive ingestion pipeline
- dbt analytics modeling layer
- governance metadata schema
- automated data quality rule engine
- dataset health scoring
- incident detection
- AI incident explanation assistant
- governance monitoring dashboard

## Architecture

See:

docs/architecture_diagram.png

## Tech Stack

Python  
PostgreSQL  
dbt  
Power BI  
OpenAI API  

## Governance Components

dataset_registry  
rule_catalog  
rule_runs  
dataset_health_scores  
incidents  

## Example Rule

Ensuring commit SHA uniqueness:

SELECT commit_sha
FROM mart_mart.fact_commits
GROUP BY commit_sha
HAVING COUNT(*) > 1

## Dashboard

The Power BI dashboard monitors:

- dataset health
- rule failures
- governance incidents
- dataset reliability metrics