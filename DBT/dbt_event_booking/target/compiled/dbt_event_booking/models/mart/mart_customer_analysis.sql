SELECT 
    EXTRACT(YEAR FROM last_order_date) AS year,
    COUNT(CASE
            WHEN customer_status = 'Churned Customer' THEN customer_id
        END) AS churned_customers,
    COUNT(CASE
            WHEN customer_status = 'Active Customer' THEN customer_id
        END) AS active_customers,
    COUNT(CASE
            WHEN customer_status = 'New Customer' THEN customer_id
        END) AS new_customers
FROM
    EVENT_BOOKING.intermediate.int_customer_status
GROUP BY
    year
ORDER BY
    year DESC