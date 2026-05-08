
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select done
from "postgres"."public_pipedrive_analytics"."stg_activity"
where done is null



  
  
      
    ) dbt_internal_test