
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select changed_field_key
from "postgres"."public_pipedrive_analytics"."stg_deal_changes"
where changed_field_key is null



  
  
      
    ) dbt_internal_test