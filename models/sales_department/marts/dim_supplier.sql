with
    int_supplier as (
        select *
        from {{ ref('int_supplier_joins') }}
    )

select *
from int_supplier
