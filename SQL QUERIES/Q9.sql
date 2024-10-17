WITH CTE1 AS(
SELECT c.channel,round((sum(gross_Price*sold_quantity)/1000000),2) AS Gross_sales_mln
FROM fact_sales_monthly s
JOIN dim_customer c
ON s.customer_code = c.customer_code
JOIN fact_gross_price g ON s.product_code=g.product_code
 GROUP BY channel)
SELECT CHANNEL ,CONCAT(Gross_sales_mln,'M') AS Gross_sales_mln,
CONCAT(ROUND(gross_sales_mln*100/total,2),'%') AS Percentage
FROM
(
(SELECT SUM(Gross_sales_mln) AS total FROM cte1) A,
(SELECT * FROM cte1) B
)
ORDER BY percentage DESC 

