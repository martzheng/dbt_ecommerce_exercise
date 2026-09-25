select
    cast(payment_id as integer) as payment_id,
    cast(order_id as integer) as order_id,
    lower(trim(payment_method)) as payment_method,
    cast(amount as decimal(8,2)) as amount,
    cast(payment_date as date) as payment_date
from {{ ref('payments') }}