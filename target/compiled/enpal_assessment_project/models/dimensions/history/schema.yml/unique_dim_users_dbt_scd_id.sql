
    
    

select
    dbt_scd_id as unique_field,
    count(*) as n_records

from "postgres"."public_pipedrive_analytics"."dim_users"
where dbt_scd_id is not null
group by dbt_scd_id
having count(*) > 1


