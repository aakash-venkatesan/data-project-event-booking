WITH revenue_data AS (
    SELECT 
        CUSTOMER_ID,
        SUM(REVENUE) AS total_revenue,
        SUM(CASE WHEN REVENUE_TYPE = 1 THEN REVENUE ELSE 0 END) AS expansion_revenue,
        SUM(CASE WHEN REVENUE_TYPE = 0 THEN REVENUE ELSE 0 END) AS contraction_revenue
    FROM 
        EVENT_BOOKING.staging.stg_transactions
    GROUP BY 
        CUSTOMER_ID
)

SELECT 
    SUM(total_revenue) AS total_revenue,
    SUM(expansion_revenue) AS total_expansion_revenue,
    SUM(contraction_revenue) AS total_contraction_revenue,
    (SUM(total_revenue) - SUM(contraction_revenue)) / NULLIF(SUM(total_revenue), 0) AS net_nrr,
    SUM(expansion_revenue) / NULLIF(SUM(total_revenue), 0) AS gross_revenue_retention
FROM 
    revenue_data;