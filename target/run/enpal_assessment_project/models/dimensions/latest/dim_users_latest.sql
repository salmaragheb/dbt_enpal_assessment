
  create view "postgres"."public_pipedrive_analytics"."dim_users_latest__dbt_tmp"
    
    
  as (
    

select
    user_id,
    user_name,
    email,
    modified
from "postgres"."public_pipedrive_analytics"."dim_users"
where is_current = true
  );