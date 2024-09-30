with
    int_sales as (
        select *
        from {{ ref('int_sales_metrics') }}
    )

    , dim_produtos as (
        select *
        from {{ ref('dim_product') }}
    )

    , dim_funcionarios as (
        select *
        from {{ ref('dim_employee') }}
    )

select *
from int_sales
