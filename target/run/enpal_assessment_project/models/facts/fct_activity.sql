
      insert into "postgres"."public_pipedrive_analytics"."fct_activity" ("activity_id", "deal_id", "assigned_to_user", "activity_type_id", "activity_type_name", "activity_type_key", "activity_type_active", "done", "due_to")
    (
        select "activity_id", "deal_id", "assigned_to_user", "activity_type_id", "activity_type_name", "activity_type_key", "activity_type_active", "done", "due_to"
        from "fct_activity__dbt_tmp181520719656"
    )


  