
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select is_active
from "postgres"."public_pipedrive_analytics"."stg_activity_types"
where is_active is null



  
  
      
    ) dbt_internal_test