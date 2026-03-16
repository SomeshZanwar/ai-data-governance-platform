# Governance Platform Architecture

This project implements a simplified data governance system inspired by modern data observability platforms.

## Architecture Overview

Data flows through multiple layers:

GitHub Archive Dataset  
↓  
Python Ingestion Pipeline  
↓  
PostgreSQL Raw Layer  
↓  
dbt Transformation Layer  
↓  
Analytics Layer (facts & dimensions)  
↓  
Governance Layer (rules, incidents, health scores)  
↓  
AI Explanation Layer  
↓  
Power BI Monitoring Dashboard

## Core Components

### Data Ingestion
Python scripts load GitHub Archive JSON events into PostgreSQL.

### Analytics Modeling
dbt transforms raw events into structured tables:

- fact_commits
- fact_pull_requests
- fact_issues
- dim_repository
- dim_user
- dim_date

### Governance Layer
Tracks datasets and rules:

- dataset_registry
- rule_catalog
- rule_runs
- dataset_health_scores
- incidents

### AI Layer
Provides automated explanations for governance failures.

### Monitoring
Power BI dashboard visualizes dataset health and incidents.