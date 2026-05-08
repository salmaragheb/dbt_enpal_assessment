
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select activity_type_key
from "postgres"."public_pipedrive_analytics"."fct_activity"
where activity_type_key is null



  
  
      
    ) dbt_internal_test