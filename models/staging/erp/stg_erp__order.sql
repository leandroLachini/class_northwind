with
    source_order as (
        select 
        cast(id as int) PK_ORDER
        , cast(employeeid as int) as FK_EMPLOYEEID
        , cast(customerid as string) as FK_CUSTOMERID
        , cast(shipvia as int) as FK_SHIPVIA
        , cast(id as int) NUMBER_ORDER
        , cast(orderdate as date) as DATE_ORDER
        , cast(shippeddate as date) as DATE_SHIP
        , cast(requireddate as date) as DATE_REQUIRED
        , cast(freight as numeric) as VALUE_SHIP
        , cast(shipname as string) as SHIPNAME
        , cast(shipcity as string) as SHIPCITY
        , cast(shipregion as string) as SHIPREGION
        , cast(shipcountry as string) as SHIPCOUNTRY
        from {{ source('erp_northwind', '_ORDER_') }}
    )

select *
from source_order
