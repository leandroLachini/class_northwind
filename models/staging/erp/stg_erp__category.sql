with
    source_category as (
        select 
        cast(ID as int) as PK_CATEGORY
        , cast(CATEGORYNAME as varchar) as NAME_CATEGORY
        , cast(DESCRIPTION as varchar) as DESCRIPTION_CATEGORY
        from {{ source('erp_northwind', 'CATEGORY') }}
    )

select *
from source_category
