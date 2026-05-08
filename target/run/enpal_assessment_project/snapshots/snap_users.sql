
      update "postgres"."public"."snap_users"
    set dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
    from "snap_users__dbt_tmp153517584737" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_scd_id::text = "postgres"."public"."snap_users".dbt_scd_id::text
      and DBT_INTERNAL_SOURCE.dbt_change_type::text in ('update'::text, 'delete'::text)
      
        and "postgres"."public"."snap_users".dbt_valid_to is null;
      


    insert into "postgres"."public"."snap_users" ("id", "user_name", "email", "modified", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
    select DBT_INTERNAL_SOURCE."id",DBT_INTERNAL_SOURCE."user_name",DBT_INTERNAL_SOURCE."email",DBT_INTERNAL_SOURCE."modified",DBT_INTERNAL_SOURCE."dbt_updated_at",DBT_INTERNAL_SOURCE."dbt_valid_from",DBT_INTERNAL_SOURCE."dbt_valid_to",DBT_INTERNAL_SOURCE."dbt_scd_id"
    from "snap_users__dbt_tmp153517584737" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_change_type::text = 'insert'::text;

  