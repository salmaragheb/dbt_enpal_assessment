
    
    



select dbt_valid_from
from "postgres"."public_pipedrive_analytics"."dim_users"
where dbt_valid_from is null


