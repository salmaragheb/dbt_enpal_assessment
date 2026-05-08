{{
    config(
        materialized = 'view'
    )
}}

select
    user_id,
    user_name,
    email,
    modified
from {{ ref('dim_users') }}
where is_current = true