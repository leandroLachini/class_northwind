/*  
    Conexão com a fonte clientes northwind
*/

with
    source_customer as (
        select 
        *
        from {{ source('erp_northwind', 'CUSTOMER') }}
    )

/* Renomeando colunas da tabela e categorizando os dados */

    , remane_table as (
        select
        cast(ID as varchar) as PK_CUSTOMER
        , CAST(COMPANYNAME as varchar) as COMPANYNAME_CUSTOMER
        , CAST(CONTACTNAME as varchar) as CONTACTNAME_CUSTOMER
        , CAST(CONTACTTITLE as varchar) as CONTACTTITLE_CUSTOMER
        , CAST(ADDRESS as varchar) as ADDRESS_CUSTOMER
        , CAST(CITY as varchar) as CITY_CUSTOMER 
        , CAST(REGION as varchar) as REGION_CUSTOMER
        , CAST(POSTALCODE as varchar) as POSTALCODE_CUSTOMER
        , CAST(COUNTRY as varchar) as COUNTRY_CUSTOMER
        , CAST(PHONE as varchar) as PHONE_CUSTOMER
        , CAST(FAX as varchar) as FAX_CUSTOMER
        from source_customer
    )

select *
from remane_table
