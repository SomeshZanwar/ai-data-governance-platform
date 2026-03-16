{{ config(materialized='table', schema='mart') }}

select distinct
    repo_id      as repository_id,
    repo_name
from {{ ref('stg_github_events') }}
where repo_id is not null