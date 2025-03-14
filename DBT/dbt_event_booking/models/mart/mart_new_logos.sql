SELECT
    EXTRACT(YEAR FROM fiscal_year) AS year,
    new_customers
FROM
    {{ ref('int_new_customers_in_each_fiscal_year') }}