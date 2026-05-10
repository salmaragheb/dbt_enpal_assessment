
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select field_key
from "postgres"."public_pipedrive_analytics"."int_field_values"
where field_key is null



  
  
      
    ) dbt_internal_test