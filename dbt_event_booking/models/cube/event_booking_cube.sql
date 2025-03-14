SELECT
    *
FROM
    {{ ref('mart_cross_sell_analysis') }}
    INNER JOIN {{ ref('mart_products_analysis') }}
    HAVING 