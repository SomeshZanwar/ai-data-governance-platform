{{ config(materialized='table', schema='mart') }}

select distinct
    actor_id     as user_id,
    actor_login
from {{ ref('stg_github_events') }}
where actor_id is not null