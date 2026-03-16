{{ config(materialized='table', schema='mart') }}

select
    (payload->'issue'->>'id')::bigint as issue_id,
    repo_id                           as repository_id,
    actor_id                          as author_id,
    created_at                        as created_timestamp,
    payload->'issue'->>'state'        as issue_state
from {{ ref('stg_github_events') }}
where event_type = 'IssuesEvent'