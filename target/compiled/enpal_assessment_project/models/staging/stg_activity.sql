

select
    activity_id,
    type as activity_type_key,
    assigned_to_user,
    deal_id,
    done,
    due_to
from "postgres"."public"."activity"