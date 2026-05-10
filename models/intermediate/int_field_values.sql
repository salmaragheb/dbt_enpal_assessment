{{
    config(
        materialized = 'view'
    )
}}

with source as (
    select field_key, field_value_options
    from {{ ref('stg_fields') }}
    where field_value_options is not null
),

parsed as (
    -- unnests all field option sets into one unified lookup table.
    -- any new field options added in pipedrive are automatically captured here.
    select
        field_key,
        (elem->>'id')::text     as value_id,
        elem->>'label'          as value_label
    from source,
    jsonb_array_elements(field_value_options::jsonb) as elem
)

select * from parsed