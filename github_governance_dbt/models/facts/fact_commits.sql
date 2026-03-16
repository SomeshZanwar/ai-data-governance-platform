{{ config(materialized='table', schema='mart') }}

select
    payload->>'head'       as commit_sha,
    repo_id                as repository_id,
    actor_id               as author_id,
    created_at             as commit_timestamp
from {{ ref('stg_github_events') }}
where event_type = 'PushEvent'
and payload->>'head' is not null