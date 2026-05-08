{{
    config(
        materialized = 'view'
    )
}}

select
    deal_id,
    change_time,
    changed_field_key,
    new_value
from {{ source('postgres_public', 'deal_changes') }}