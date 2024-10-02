with
    enterprise_order as (
        select *
        from {{ ref('stg_erp__order') }}
    )

    , union_date_order as (
        select
            DATE_ORDER as DATELINE
        from enterprise_order
        union
        select
            DATE_SHIP as DATELINE
        from enterprise_order
        union
        select
            DATE_REQUIRED as DATELINE
        from enterprise_order
    )

    , remane_table as (
        select
        DATELINE
        , cast(MONTH(DATELINE) as varchar) as MONTH_DATELINE
        , cast(YEAR(DATELINE) as varchar) as YEAR_DATELINE
        , MONTH_DATELINE || '-' || YEAR_DATELINE as MONTH_YEAR_DATELINE
        from union_date_order
        where DATELINE IS NOT NULL
        order by DATELINE
    )

   select *
from remane_table
