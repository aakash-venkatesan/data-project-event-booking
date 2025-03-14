SELECT
    DISTINCT customer_id,
    customer_name,
    total_transactions,
    total_revenue,
    top_customers,
    country
FROM
    {{ ref('int_rank_customers_on_revenue') }}
    INNER JOIN
    {{ ref('int_countries') }}
    USING (customer_id)
