select  id as payment_id,
        orderid as order_id,
        status,
        amount/100 as payment_amount
from raw.stripe.payment