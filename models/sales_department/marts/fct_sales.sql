with
    int_sales as (
        select *
        from {{ ref('int_sales_metrics') }}
    )

    , dim_product as (
        select *
        from {{ ref('dim_product') }}
    )

    , dim_employee as (
        select *
        from {{ ref('dim_employee') }}
    )

    , dim_customer as (
        select *
        from {{ ref('dim_customer') }}
    )

select *
from int_sales
