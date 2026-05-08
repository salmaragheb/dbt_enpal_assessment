
      
  
    

  create  table "postgres"."public"."snap_users"
  
  
    as
  
  (
    
    

    select *,
        md5(coalesce(cast(id as varchar ), '')
         || '|' || coalesce(cast(now()::timestamp without time zone as varchar ), '')
        ) as dbt_scd_id,
        now()::timestamp without time zone as dbt_updated_at,
        now()::timestamp without time zone as dbt_valid_from,
        
  
  coalesce(nullif(now()::timestamp without time zone, now()::timestamp without time zone), null)
  as dbt_valid_to
from (
        

    

    with source as (
        select
            id,
            name as user_name,
            email,
            modified,
            -- guard against duplicate user IDs from source replication
            row_number() over (partition by id order by modified desc) as rn
        from "postgres"."public"."users"
    )

    select id, user_name, email, modified
    from source
    where rn = 1

    ) sbq



  );
  
  