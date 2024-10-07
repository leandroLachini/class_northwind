/* Conexão com a fonte fornecedor northwind */

with
    source_supplier as (
        select *
        from {{ source('erp_northwind', 'supplier') }}
    )

/* Renomeando colunas da tabela e categorizando os dados */

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
