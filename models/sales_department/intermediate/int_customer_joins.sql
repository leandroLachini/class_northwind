/* Conexao com a staging clientes */

with
    customer as (
        select *
        from {{ ref('stg_erp__customer') }}
    )

/* Fazendo os joins para popular tabela com dados relevantes */

    , joined as (
        select
        *
        from customer
    )

select *
from joined
