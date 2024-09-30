with
    supplier as (
        select *
        from {{ ref('stg_erp__supplier') }}
    )

    , joined as (
        select
        *
        from supplier
    )

select *
from joined
