/* Conexão com a fonte transportador northwind */

with
    source_shipper as (
        select 
        *
        from {{ source('erp_northwind', 'SHIPPER') }}
    )

/* Renomeando colunas da tabela e categorizando os dados */

    , remane_table as (
        select
        cast(ID as int) as PK_SHIPPER
        , cast(COMPANYNAME as varchar) as COMPANYNAME_SHIPPER
        , cast(PHONE as varchar) as PHONE_SHIPPER
        from source_shipper
    )

select *
from remane_table
