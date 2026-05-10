
      insert into "postgres"."public_pipedrive_analytics"."fct_deal_changes" ("deal_id", "change_time", "changed_field_key", "new_value", "resolved_value", "user_name")
    (
        select "deal_id", "change_time", "changed_field_key", "new_value", "resolved_value", "user_name"
        from "fct_deal_changes__dbt_tmp101221262675"
    )


  