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
    field_values.value_label  as resolved_value,
    users.user_name
from source
-- single dynamic join resolving all option-based fields (stage, lost reason, etc.)
-- automatically captures any new field options added in pipedrive without model changes
left join {{ ref('int_field_values') }} field_values
    on source.changed_field_key = field_values.field_key
    and source.new_value::text = field_values.value_id
left join {{ ref('dim_users_latest') }} users
    on source.changed_field_key = 'user_id'
    and source.new_value::text = users.user_id::text