with
    int_employee as (
        select *
        from {{ ref('int_employee_sefljoin') }}
    )

select *
from int_employee
