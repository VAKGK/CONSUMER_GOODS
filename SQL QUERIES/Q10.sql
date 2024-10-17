WITH CTE1 AS
(SELECT p.product,s.product_code,p.division,SUM(sold_quantity) AS Total_sold_quantity
FROM fact_sales_monthly s 
JOIN dim_product p 
ON s.product_code = p.product_code
JOIN fact_gross_price g ON s.product_code=g.product_code
WHERE g.fiscal_year=2021
GROUP BY p.division,p.product,s.product_code
),
cte2 AS
( SELECT division, product_code, product, Total_sold_quantity, RANK() OVER(PARTITION BY division ORDER BY Total_sold_Quantity DESC ) AS Rank_order FROM  cte1
)
SELECT cte1.division, cte1.product_code, cte1.product, cte2.Total_sold_quantity, cte2.Rank_Order
 FROM cte1 JOIN cte2
 ON cte1.product_code = cte2.product_code
WHERE cte2.Rank_Order IN (1,2,3)