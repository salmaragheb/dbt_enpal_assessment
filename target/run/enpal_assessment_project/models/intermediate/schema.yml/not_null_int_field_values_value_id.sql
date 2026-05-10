
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select value_id
from "postgres"."public_pipedrive_analytics"."int_field_values"
where value_id is null



  
  
      
    ) dbt_internal_test