{{ config(materialized='table', schema='mart') }}

select
    (payload->'pull_request'->>'id')::bigint as pull_request_id,
    repo_id                                  as repository_id,
    actor_id                                 as author_id,
    created_at                               as created_timestamp,
    payload->'pull_request'->>'state'        as pr_state
from {{ ref('stg_github_events') }}
where event_type = 'PullRequestEvent'