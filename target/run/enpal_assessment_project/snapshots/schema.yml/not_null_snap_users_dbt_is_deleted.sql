
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select dbt_is_deleted
from "postgres"."public"."snap_users"
where dbt_is_deleted is null



  
  
      
    ) dbt_internal_test