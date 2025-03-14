
  
    

        create or replace transient table RETAIL_DB.staging.stg_pp_products
         as
        (SELECT 
    product_id,
    product_name,
    category,
    sub_category,
    brand,
    price,
    cost,
    stock_quantity,
    reorder_level,
    supplier_id
FROM 
    RETAIL_DB.STAGING.PRODUCTS
        );
      
  