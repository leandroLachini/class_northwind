with
    we_order as (
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
        , we_order.PK_ORDER
        , we_order.FK_EMPLOYEEID
        , we_order.FK_CUSTOMERID
        , we_order.FK_SHIPVIA
        , we_order.DATE_ORDER
        , we_order.DATE_SHIP
        , we_order.DATE_REQUIRED
        , orderdetail.DISCOUNT_PERCENT
        , orderdetail.SALES_UNITPRICE
        , orderdetail.SALES_QUANTITY
        , we_order.VALUE_SHIP
        , we_order.NUMBER_ORDER
        , we_order.SHIPNAME
        , we_order.SHIPCITY
        , we_order.SHIPREGION
        , we_order.SHIPCOUNTRY
        from orderdetail
        left join we_order on we_order.PK_ORDER = orderdetail.FK_ORDERID
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
