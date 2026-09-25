select
    cast(customer_id as integer) as customer_id,
    trim(first_name) as first_name,
    trim(last_name) as last_name,
    lower(email) as email,
    upper(country) as country,
    cast(created_at as timestamp) as created_at

from {{ ref('customers') }}