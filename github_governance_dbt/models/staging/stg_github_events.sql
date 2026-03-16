{{ config(materialized='view', schema='staging') }}

select
    event_id,
    event_type,
    actor_id,
    actor_login,
    repo_id,
    repo_name,
    created_at,
    payload
from raw.github_events