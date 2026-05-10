
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select value_label
from "postgres"."public_pipedrive_analytics"."int_field_values"
where value_label is null



  
  
      
    ) dbt_internal_test