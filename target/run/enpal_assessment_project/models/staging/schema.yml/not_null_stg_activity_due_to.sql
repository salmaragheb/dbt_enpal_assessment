
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select due_to
from "postgres"."public_pipedrive_analytics"."stg_activity"
where due_to is null



  
  
      
    ) dbt_internal_test