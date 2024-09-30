with
    customer as (
        select *
        from {{ ref('stg_erp__customer') }}
    )

    , joined as (
        select
        *
        from customer
    )

select *
from joined
