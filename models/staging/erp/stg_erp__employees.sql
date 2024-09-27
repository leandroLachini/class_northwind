with
    source_employees as (
        select *
        from {{ source('erp_northwind', 'employee') }}
    )

    , remane_table as (
        select
        cast(ID as int) as PK_EMPLOYEE
        , cast(REPORTSTO as varchar) as FK_MANAGER
        , cast(BIRTHDATE as date) as DATE_EMPLOYEE_BIRTHDATE
        , cast(HIREDATE as date) as DATE_EMPLOYEE_HIREDATE
        , FIRSTNAME || ' ' || LASTNAME as FULLNAME_EMPLOYEE
        , cast(TITLE as varchar) as EMPLOYEE_POSITION
        , cast(CITY as varchar) as CITY_EMPLOYEE
        , cast(REGION as varchar) as REGION_EMPLOYEE
        , cast(COUNTRY as varchar) as COUNTRY_EMPLOYEE
        --, cast(PHOTOPATH as varchar) as
        --, cast(TITLEOFCOURTESY as varchar) as
        --, cast(ADDRESS as varchar) as
        --, cast(POSTALCODE as varchar) as
        --, cast(HOMEPHONE as varchar) as
        --, cast(EXTENSION as varchar) as
        --, cast(PHOTO as varchar) as
        --, cast(NOTES as varchar) as
        from source_employees
    )

select *
from remane_table
