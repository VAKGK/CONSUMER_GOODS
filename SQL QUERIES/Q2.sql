WITH Unique_product_2020  AS 
(SELECT COUNT(DISTINCT(product_code)) AS unique_products_2020
FROM fact_sales_monthly
WHERE fiscal_year=2020),
Unique_product_2021 AS 
(SELECT COUNT(DISTINCT(product_code)) AS unique_products_2021
FROM fact_sales_monthly
WHERE fiscal_year=2021)
SELECT Unique_product_2020.Unique_products_2020,
       Unique_product_2021.Unique_products_2021,
ROUND(((Unique_products_2021-Unique_products_2020)/Unique_products_2020)*100,2) AS Percentage_chg
FROM
Unique_product_2020,
Unique_product_2021;
