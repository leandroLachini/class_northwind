with
    enterprise_order as (
        select *
        from {{ ref('stg_erp__order') }}
    )

    , orderdetail as (
        select *
        from {{ ref('stg_erp__orderdetail') }}
    )

    , joined as (
        select
        orderdetail.SK_ORDERDETAIL
        , orderdetail.FK_ORDERID
        , orderdetail.FK_PRODUCTID
        , enterprise_order.PK_ORDER
        , enterprise_order.FK_EMPLOYEEID
        , enterprise_order.FK_CUSTOMERID
        , enterprise_order.FK_SHIPVIA
        , enterprise_order.DATE_ORDER
        , enterprise_order.DATE_SHIP
        , enterprise_order.DATE_REQUIRED
        , orderdetail.DISCOUNT_PERCENT
        , orderdetail.SALES_UNITPRICE
        , orderdetail.SALES_QUANTITY
        , enterprise_order.VALUE_SHIP
        , enterprise_order.NUMBER_ORDER
        , enterprise_order.SHIPNAME
        , enterprise_order.SHIPCITY
        , enterprise_order.SHIPREGION
        , enterprise_order.SHIPCOUNTRY
        from orderdetail
        left join enterprise_order on enterprise_order.PK_ORDER = orderdetail.FK_ORDERID
    )

    , metrics as (
        select 
            *
            , SALES_QUANTITY * SALES_UNITPRICE as GROSS_VALUE
            , SALES_QUANTITY * SALES_UNITPRICE
                * (1 - DISCOUNT_PERCENT) as NET_VALUE
            , VALUE_SHIP / (count(*) over(partition by NUMBER_ORDER)) as PRORATED_SHIPPING
            , case
                when DISCOUNT_PERCENT > 0 then true
                else false
            end as HAS_DISCOUNT
        from joined
    )

    ,final_table as (
        select
            SK_ORDERDETAIL
            , FK_ORDERID
            , FK_PRODUCTID
            , PK_ORDER
            , FK_EMPLOYEEID
            , FK_CUSTOMERID
            , FK_SHIPVIA
            , DATE_ORDER
            , DATE_SHIP
            , DATE_REQUIRED
            , DISCOUNT_PERCENT       
            , SALES_UNITPRICE
            , SALES_QUANTITY
            , VALUE_SHIP
            , GROSS_VALUE
            , NET_VALUE
            , cast(PRORATED_SHIPPING as numeric(18,2)) as PRORATED_SHIPPING
            , NUMBER_ORDER
            , SHIPNAME
            , SHIPCITY
            , SHIPREGION
            , SHIPCOUNTRY
            , HAS_DISCOUNT
        from metrics
    )

select *
from final_table
