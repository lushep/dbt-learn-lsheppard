--config applied to whole project? do in yaml file...
/*
+materializations are build strategies:
jaffle_shop:
    marts:
        +materialized: (this is a config key, not a folder)
*/
--config applied to one model? do in model sql file...
-- EG: {{ config(materialized='table', tags=['nightly', 'daily'], enabled=True) }}

-- use the ref function for dependencies - like order of

{{ config(materialized='table', tags=['nightly', 'daily'], enabled=True) }}

select
    id as order_id,
    user_id as customer_id,
    order_date,
    status
from {{ course('jaffle_shop','orders')}}