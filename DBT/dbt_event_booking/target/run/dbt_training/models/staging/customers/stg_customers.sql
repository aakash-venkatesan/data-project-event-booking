
  
    

        create or replace transient table EVENT_BOOKING.staging.stg_customers
         as
        (SELECT 
    CAST(customer_id AS INT) AS customer_id,
    company,
    customername
FROM
    EVENT_BOOKING.RAW.CUSTOMERS
WHERE
    customer_id IS NOT NULL
    AND company IS NOT NULL
    AND customername IS NOT NULL
        );
      
  