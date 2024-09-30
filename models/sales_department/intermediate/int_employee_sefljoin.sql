with
    employees as (
        select *
        from {{ ref('stg_erp__employees') }}
    )

    , joined as (
        select
            employees.PK_EMPLOYEE
            , employees.DATE_EMPLOYEE_BIRTHDATE
            , employees.DATE_EMPLOYEE_HIREDATE
            , employees.FULLNAME_EMPLOYEE
            , employees.EMPLOYEE_POSITION
            , manager.FULLNAME_EMPLOYEE as MANAGER_NAME
            , employees.CITY_EMPLOYEE
            , employees.REGION_EMPLOYEE
            , employees.COUNTRY_EMPLOYEE
        from employees
        left join employees as manager
        on employees.FK_MANAGER = manager.PK_EMPLOYEE
    )

select *
from joined
