
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select activity_month
from "postgres"."public_pipedrive_analytics"."rep_sales_funnel_monthly"
where activity_month is null



  
  
      
    ) dbt_internal_test