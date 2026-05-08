

with source as (
    select field_value_options
    from "postgres"."public_pipedrive_analytics"."stg_fields"
    where field_key = 'lost_reason'
),

parsed as (
    -- unnests the JSON array into one row per lost reason option.
    -- jsonb_array_elements expands the array elements, ->> extracts the value as text.
    select
        (elem->>'id')::int      as lost_reason_id,
        elem->>'label'          as lost_reason_label
    from source,
    jsonb_array_elements(field_value_options::jsonb) as elem
)

select * from parsed