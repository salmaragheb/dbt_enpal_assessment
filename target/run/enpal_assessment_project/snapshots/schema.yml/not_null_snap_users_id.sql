
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select id
from "postgres"."public"."snap_users"
where id is null



  
  
      
    ) dbt_internal_test