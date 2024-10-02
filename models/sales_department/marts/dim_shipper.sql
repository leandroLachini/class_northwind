with
    int_shipper as (
        select *
        from {{ ref('int_shipper_joins') }}
    )

select *
from int_shipper
