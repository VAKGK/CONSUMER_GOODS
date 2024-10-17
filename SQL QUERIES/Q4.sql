WITH CTE1 AS
(SELECT p.segment,COUNT(DISTINCT s.product_code) AS Product_count_2020 FROM fact_sales_monthly s
JOIN dim_product p ON s.product_code  = p.product_code
WHERE fiscal_year=2020
GROUP BY p.segment),
CTE2 AS
(SELECT p.segment,COUNT(DISTINCT s.product_code) AS Product_count_2021 FROM fact_sales_monthly s
JOIN dim_product p ON s.product_code  = p.product_code
WHERE fiscal_year=2021
GROUP BY p.segment)
SELECT 
cte1.segment,
cte1.product_count_2020,
cte2.Product_count_2021,
cte2.product_count_2021-cte1.product_count_2020 as Difference
FROM cte1 
JOIN cte2 
ON  cte1.segment = cte2.segment
ORDER BY segment ASC;