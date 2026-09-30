with customers as (

    select *
    from {{ ref('stg_customers') }}

),

customer_orders as (

    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as latest_order_date,
        count(*) as total_orders,
        sum(revenue) as lifetime_revenue

    from {{ ref('fct_orders') }}

    group by customer_id

)

select
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.country,
    c.created_at,
    o.first_order_date,
    o.latest_order_date,
    coalesce(o.total_orders, 0) as total_orders,
    coalesce(o.lifetime_revenue, 0) as lifetime_revenue

from customers c

left join customer_orders o
    on c.customer_id = o.customer_id