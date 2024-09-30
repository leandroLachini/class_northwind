with
    int_product as (
        select *
        from {{ ref('int_product_joins') }}
    )

select *
from int_product
