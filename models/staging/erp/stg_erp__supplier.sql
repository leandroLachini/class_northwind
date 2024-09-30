with
    source_supplier as (
        select *
        from {{ source('erp_northwind', 'supplier') }}
    )

    , remane_table as (
        select
            cast(ID as int) as PK_SUPPLIER
            , cast(COMPANYNAME as varchar) as NAME_SUPPLIER
            , cast(CITY as varchar) as CITY_SUPPLIER
            , cast(COUNTRY as varchar) as COUNTRY_SUPPLIER
        from source_supplier
    )

select *
from remane_table
