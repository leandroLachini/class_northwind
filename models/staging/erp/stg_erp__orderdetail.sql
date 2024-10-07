/* Conexão com a fonte pedidos detalhados categoria northwind */ 

with
    source_orderdetail as (
        select 
        *
        from {{ source('erp_northwind', 'ORDERDETAIL') }}
    )

/* Renomeando colunas da tabela e categorizando os dados */

    , remane_table as (
        select 
        md5(orderid || productid) as SK_ORDERDETAIL
        , cast(orderid as int) as FK_ORDERID
        , cast(productid as int) as FK_PRODUCTID
        , cast(discount as numeric(18,2)) as DISCOUNT_PERCENT
        , cast(unitprice as numeric(18,2)) as SALES_UNITPRICE
        , cast(quantity as int) as SALES_QUANTITY
        from source_orderdetail
    )

select *
from remane_table
