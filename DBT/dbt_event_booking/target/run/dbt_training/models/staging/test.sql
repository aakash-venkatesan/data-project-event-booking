
  
    

        create or replace transient table dbt.dbt_orders.test
         as
        (SELECT
    storeid as s_id,
    productid as p_id
FROM 
    dbt.dbt_orders.orders
        );
      
  