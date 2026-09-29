with order_items as (

    select *
    from {{ ref('stg_order_items') }}

),

products as (

    select *
    from {{ ref('stg_products') }}

)

select
    oi.order_item_id,
    oi.order_id,
    oi.product_id,
    p.product_name,
    p.category,
    oi.quantity,
    oi.unit_price,
    p.product_cost,

    oi.quantity * oi.unit_price as gross_revenue,

    oi.quantity * p.product_cost as total_product_cost,

    (oi.quantity * oi.unit_price)
        - (oi.quantity * p.product_cost) as gross_profit

from order_items oi

left join products p
    on oi.product_id = p.product_id