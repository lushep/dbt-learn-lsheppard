with orders as (

    select * from {{ref('stg_orders')}}

),

payments as (

    select  order_id,
            sum(payment_amount) as order_full_amount
    from {{ref('stg_payments')}}
    group by order_id

),

final as (

    select  o.*,
            p.order_full_amount
    from orders o
        left join payments p
        on o.order_id = p.order_id
)

select * from final