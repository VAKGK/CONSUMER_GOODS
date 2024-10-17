SELECT CONCAT(MONTHNAME(S.date), ' (', YEAR(S.date), ')') AS 'Month', S.fiscal_year,
       ROUND(SUM(G.gross_price*S.sold_quantity), 2) AS Gross_sales_Amount
       
FROM fact_sales_monthly S 
JOIN dim_customer C 
ON S.customer_code = C.customer_code
JOIN fact_gross_price G ON S.product_code = G.product_code
WHERE C.customer = 'Atliq Exclusive'
GROUP BY  Month, S.fiscal_year 
ORDER BY S.fiscal_year ;