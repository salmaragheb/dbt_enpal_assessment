{% snapshot snap_users %}

    {{
        config(
            unique_key = 'id',
            strategy = 'check',
            check_cols = ['user_name', 'email'],
            hard_deletes = 'invalidate'
        )
    }}

    with source as (
        select
            id,
            name as user_name,
            email,
            modified,
            -- guard against duplicate user IDs from source replication
            row_number() over (partition by id order by modified desc) as rn
        from {{ source('postgres_public', 'users') }}
    )

    select id, user_name, email, modified
    from source
    where rn = 1

{% endsnapshot %}