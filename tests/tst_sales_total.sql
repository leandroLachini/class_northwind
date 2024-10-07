/*  
    Este teste garante que as vendas de 2012 estão
    corretas com o valor auditado da contabilidade:
    R$ 226298.5
*/

with
    sales_2022 as (
        select sum(GROSS_VALUE) as GROSS_VALUE
        from {{ ref("int_sales_metrics") }}
        where DATE_ORDER between '2012-01-01' and '2012-12-31'
    ) -- R$ 226298.5

select GROSS_VALUE
from sales_2022
where GROSS_VALUE not between 226298.45 and 226298.55