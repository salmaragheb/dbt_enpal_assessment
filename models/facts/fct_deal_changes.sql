{{
    config(
        materialized = 'incremental',
        incremental_strategy = 'append'
    )
}}

-- append strategy chosen because deal changes are immutable events.
-- once a change is recorded in pipedrive it is never updated.
-- note: in a BigQuery environment this model would be partitioned by change_time
-- and clustered by deal_id for query performance. omitted here as Postgres
-- does not support these configs natively through dbt.

with source as (
    select * from {{ ref('stg_deal_changes') }}

    {% if is_incremental() %}
        where change_time >= (select max(change_time) from {{ this }})
    {% endif %}
)

select
    source.deal_id,
    source.change_time,
    source.changed_field_key,
    source.new_value,
    stages.stage_name,
    lost_reasons.lost_reason_label,
    users.user_name
from source
left join {{ ref('stg_stages') }} stages
    on source.changed_field_key = 'stage_id'
    and source.new_value::text = stages.stage_id::text
left join {{ ref('int_lost_reasons') }} lost_reasons
    on source.changed_field_key = 'lost_reason'
    and source.new_value::text = lost_reasons.lost_reason_id::text
left join {{ ref('dim_users_latest') }} users
    on source.changed_field_key = 'user_id'
    and source.new_value::text = users.user_id::text