with orders as (

    select * from {{ref('stg_orders')}}

),

payments as (

    select * from {{ref('stg_payments')}}

),

final as (

    select o.order_id, o.customer_id,
        sum(p.payment_amount) as order_full_amount,
        max(o.order_date) as most_recent_order_date,
        min(o.order_date) as first_order_date,
        count(o.order_id) as num_payment_methods

    from orders o
        left join payments p
            using (order_id)
        where p.status='success'
    group by o.order_id, o.customer_id
    order by o.order_id, o.customer_id
)

select * from final