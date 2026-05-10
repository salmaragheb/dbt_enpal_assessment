{{
    config(
        materialized = 'incremental',
        incremental_strategy = 'append'
    )
}}

-- append strategy chosen because activities can be updated after creation.
-- each version is treated as a new event record rather than an update to existing data.
-- note: in a BigQuery environment this model would be partitioned by due_to
-- and clustered by deal_id for query performance. omitted here as Postgres
-- does not support these configs natively through dbt.

with source as (
    select
        activity.activity_id,
        activity.deal_id,
        activity.assigned_to_user,
        activity_types.activity_type_id,
        activity_types.activity_type_name,
        activity_types.activity_type_key,
        activity_types.activity_type_active,
        activity.done::boolean,
        activity.due_to
    from {{ ref('stg_activity') }} activity
    -- simple lookup join; if logic were more complex an intermediate model would be introduced first
    left join {{ ref('stg_activity_types') }} activity_types
        on activity.activity_type_key = activity_types.activity_type_key
)

select * from source

{% if is_incremental() %}
    where due_to > (select max(due_to) from {{ this }})
{% endif %}

