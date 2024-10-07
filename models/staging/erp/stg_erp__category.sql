/*  
    Conexão com a fonte categoria northwind
*/

with
    source_category as (
        select 
        *
        from {{ source('erp_northwind', 'CATEGORY') }}
    )

/* Renomeando colunas da tabela e categorizando os dados */

    , remane_table as (
        select 
        cast(ID as int) as PK_CATEGORY
        , cast(CATEGORYNAME as varchar) as NAME_CATEGORY
        , cast(DESCRIPTION as varchar) as DESCRIPTION_CATEGORY
        from source_category
    )

select *
from remane_table
