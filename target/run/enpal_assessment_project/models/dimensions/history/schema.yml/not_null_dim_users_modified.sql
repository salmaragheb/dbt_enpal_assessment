
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select modified
from "postgres"."public_pipedrive_analytics"."dim_users"
where modified is null



  
  
      
    ) dbt_internal_test