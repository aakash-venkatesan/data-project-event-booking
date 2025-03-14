
  
    

        create or replace transient table EVENT_BOOKING.mart.mart_new_logos
         as
        (SELECT
    EXTRACT(YEAR FROM fiscal_year) AS year,
    new_customers
FROM
    EVENT_BOOKING.intermediate.int_new_customers_in_each_fiscal_year
        );
      
  