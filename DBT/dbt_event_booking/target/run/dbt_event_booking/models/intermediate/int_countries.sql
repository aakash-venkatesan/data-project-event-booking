
  
    

        create or replace transient table EVENT_BOOKING.intermediate.int_countries
         as
        (SELECT  
    *
FROM    
    EVENT_BOOKING.staging.stg_countries
        );
      
  