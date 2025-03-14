
  
    

        create or replace transient table EVENT_BOOKING.mart.mart_cross_sell_analysis
         as
        (SELECT 
    *
FROM 
    EVENT_BOOKING.intermediate.int_customer_cross_sell
WHERE
    current_cross_sell > 0
        );
      
  