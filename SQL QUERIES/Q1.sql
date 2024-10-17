SELECT market FROM dim_customer
WHERE  customer = "atliq exclusive" AND region ="apac"
GROUP BY market
ORDER BY  market ASC;
