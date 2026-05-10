{{
    config(
        materialized = 'view'
    )
}}

select
    id          as activity_type_id,
    name        as activity_type_name,
    type        as activity_type_key,
    active      as activity_type_active  
from {{ source('postgres_public', 'activity_types') }}