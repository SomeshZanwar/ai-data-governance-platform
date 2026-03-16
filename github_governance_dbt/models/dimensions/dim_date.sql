{{ config(materialized='table', schema='mart') }}

select distinct
    date(created_at)                         as date,
    extract(year  from created_at)           as year,
    extract(month from created_at)           as month,
    extract(day   from created_at)           as day,
    extract(dow   from created_at)           as day_of_week
from {{ ref('stg_github_events') }}
where created_at is not null