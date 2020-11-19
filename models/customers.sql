with customers as (
    
    select * from {{ ref('stg_customers')}}

),

orders as (

    select * from {{ ref('orders')}}

),

customer_orders as (

    select customer_id,
            sum(order_full_amount) as lifetime_value
    from orders
    group by customer_id

),

final as (

    select c.*,
            coalesce(o.lifetime_value, 0) as lifetime_value
        from customers c
            left join customer_orders o
                on c.customer_id = o.customer_id

)

select * from final