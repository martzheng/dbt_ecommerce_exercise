select
    
    cast(product_id as integer) as product_id,
    trim(product_name) as product_name,
    lower(category) as category,
    cast(unit_price as decimal(6,2)) as unit_price,
    cast(product_cost as decimal(6,2)) as product_cost

from {{ ref('products') }}