/* Conexão com a fonte produtos northwind */

with
    source_product as (
        select *
        from {{ source('erp_northwind', 'product') }}
    )

/* Renomeando colunas da tabela e categorizando os dados */

    , remane_table as (
        select
            cast(ID as int) as PK_PRODUCT
            , cast(SUPPLIERID as int) as FK_SUPPLIERID
            , cast(CATEGORYID as int) as FK_CATEGORYID
            , cast(PRODUCTNAME as varchar) as PRODUCT_NAME
            , cast(QUANTITYPERUNIT as varchar) as PRODUCT_QUANTITYPERUNIT
            , cast(UNITPRICE as numeric(18,2)) as PRODUCT_UNITPRICE
            , cast(UNITSINSTOCK as int) as PRODUCT_UNITSINSTOCK
            , cast(UNITSONORDER as int) as PRODUCT_UNITSONORDER
            , cast(REORDERLEVEL as int) as PRODUCT_REORDERLEVEL
            , cast(DISCONTINUED as int) as PRODUCT_DISCONTINUED
            , case
                when DISCONTINUED = '1' then true
                when DISCONTINUED = '0' then false
                else null
            end as PRODUCT_IS_DISCONTINUED 
        from source_product
    )

select *
from remane_table
