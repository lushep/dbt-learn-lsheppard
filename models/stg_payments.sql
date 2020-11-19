select  id as payment_id,
        orderid as order_id,
        status,
        paymentmethod as payment_method,
        amount/100 as payment_amount
from {{ source('stripe', 'payment') }}