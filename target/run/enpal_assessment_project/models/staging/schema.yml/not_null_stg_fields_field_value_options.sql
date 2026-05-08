
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select field_value_options
from "postgres"."public_pipedrive_analytics"."stg_fields"
where field_value_options is null



  
  
      
    ) dbt_internal_test