{{
    config(
        materialized = 'table'
    )
}}

-- note: in a BigQuery environment this model would be partitioned by valid_to
-- and clustered by user_id for query performance. omitted here as Postgres
-- does not support these configs natively through dbt.

with source as (
    select * from {{ ref('snap_users') }}
)

select
    id                                                           as user_id,
    user_name,
    email,
    modified,
    dbt_scd_id,
    dbt_valid_from,
    dbt_valid_to,
    case when dbt_valid_to is null then true else false end      as is_current                                           
from source