SELECT  
    DISTINCT *
FROM
    {{ ref('stg_customers') }}
    inner join
    {{ ref('stg_countries') }}
    using (customer_id)
    inner join
    {{ ref('stg_transactions') }}
    using (customer_id)    
    inner join
    {{ ref('stg_products') }}
    using (product_id)