
  
    

        create or replace transient table dbt.dbt_orders.orders
         as
        (SELECT
    s_id,
    total_quantity
FROM 
    dbt.dbt_orders.orders
        );
      
  