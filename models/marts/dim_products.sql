select
    product_id,
    product_name,
    category,
    unit_price,
    product_cost

from {{ ref('stg_products') }}