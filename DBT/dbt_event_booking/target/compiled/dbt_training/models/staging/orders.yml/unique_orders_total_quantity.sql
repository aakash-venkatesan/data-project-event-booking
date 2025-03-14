
    
    

select
    total_quantity as unique_field,
    count(*) as n_records

from dbt.dbt_orders.orders
where total_quantity is not null
group by total_quantity
having count(*) > 1


