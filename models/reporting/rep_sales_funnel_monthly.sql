{{
    config(
        materialized = 'table'
    )
}}

with stage_funnel as (
    select
        date_trunc('month', change_time)::date      as activity_month,
        resolved_value                               as kpi_name,
        case new_value
            when '1' then 'Step 1'
            when '2' then 'Step 2'
            when '3' then 'Step 3'
            when '4' then 'Step 4'
            when '5' then 'Step 5'
            when '6' then 'Step 6'
            when '7' then 'Step 7'
            when '8' then 'Step 8'
            when '9' then 'Step 9'
        end                                          as funnel_step,
        count(distinct deal_id)                      as deals_count
    from {{ ref('fct_deal_changes') }}
    where changed_field_key = 'stage_id'
    group by 1, 2, 3
),

activity_funnel as (
    select
        date_trunc('month', due_to)::date            as activity_month,
        activity_type_name                           as kpi_name,
        case activity_type_key
            when 'meeting' then 'Step 2.1'
            when 'sc_2'    then 'Step 3.1'
        end                                          as funnel_step,
        count(distinct deal_id)                      as deals_count
    from {{ ref('fct_activity') }}
    where activity_type_key in ('meeting', 'sc_2')
    and done = true
    and activity_type_active = 'True'
    group by 1, 2, 3
),

unioned as (
    select * from stage_funnel
    union all
    select * from activity_funnel
)

select * from unioned
order by activity_month, funnel_step