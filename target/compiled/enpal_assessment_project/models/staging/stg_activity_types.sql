

select
    id          as activity_type_id,
    name        as activity_type_name,
    type        as activity_type_key,
    active      as is_active
from "postgres"."public"."activity_types"