
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    activity_type_key as unique_field,
    count(*) as n_records

from "postgres"."public_pipedrive_analytics"."stg_activity_types"
where activity_type_key is not null
group by activity_type_key
having count(*) > 1



  
  
      
    ) dbt_internal_test