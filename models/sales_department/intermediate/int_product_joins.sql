with
    product as (
        select *
        from {{ ref('stg_erp__product') }}
    )

    , category as (
        select *
        from {{ ref('stg_erp__category') }}
    )

    , supplier as (
        select *
        from {{ ref('stg_erp__supplier') }}
    )

    , joined as (
        select
        product.PK_PRODUCT
        , product.PRODUCT_NAME
        , product.PRODUCT_QUANTITYPERUNIT
        , product.PRODUCT_UNITPRICE        
        , product.PRODUCT_UNITSINSTOCK
        , product.PRODUCT_UNITSONORDER
        , product.PRODUCT_REORDERLEVEL
        , product.PRODUCT_DISCONTINUED
        , product.PRODUCT_IS_DISCONTINUED
        , category.NAME_CATEGORY
        , category.DESCRIPTION_CATEGORY
        , supplier.NAME_SUPPLIER
        , supplier.CITY_SUPPLIER
        , supplier.COUNTRY_SUPPLIER
        from product
        left join category on category.PK_CATEGORY = product.FK_SUPPLIERID
        left join supplier on supplier.PK_SUPPLIER = product.FK_SUPPLIERID
    )

select *
from joined
