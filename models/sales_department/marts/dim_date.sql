with
    int_dateline as (
        select *
        from {{ ref('int_date_union') }}
    )

select *
from int_dateline
