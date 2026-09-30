select
    order_id,
    customer_id,
    order_date,
    status as order_status,
    revenue,
    cost,
    gross_profit,
    item_count
    
from {{ ref('int_orders_enriched') }}