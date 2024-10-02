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

    , dim_supplier as (
        select *
        from {{ ref('dim_supplier') }}
    )

    , dim_shipper as (
        select *
        from {{ ref('dim_shipper') }}
    )

    , dim_date as (
        select *
        from {{ ref('dim_date') }}
    )

select *
from int_sales
