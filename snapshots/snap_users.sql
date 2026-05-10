{% snapshot snap_users %}

    {{
        config(
            unique_key = 'id',
            strategy = 'check',
            check_cols = ['user_name', 'email'],
            hard_deletes = 'invalidate'
        )
    }}

        select
            id,
            name as user_name,
            email,
            modified
        from {{ source('postgres_public', 'users') }}


{% endsnapshot %}