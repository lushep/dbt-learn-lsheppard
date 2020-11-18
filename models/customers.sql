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
            coalesce(co.lifetime_value, 0) as lifetime_value
        from customers c
            left join customer_orders co
                using (customer_id)

)

select * from final