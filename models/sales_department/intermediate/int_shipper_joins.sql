with
    shipper as (
        select *
        from {{ ref('stg_erp__shipper') }}
    )

    , joined as (
        select
        *
        from shipper
    )

select *
from joined
