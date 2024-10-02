with
    int_date_union as (
        select *
        from {{ ref('int_date_union') }}
    )

select *
from int_date_union
