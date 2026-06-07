--ABC Analysis
WITH rev_table AS (
	SELECT P.product_id, P.product_name,
		SUM(quantity*unit_price) AS Revenue
	FROM products P INNER JOIN order_details OD ON P.product_id = OD.product_id
	GROUP BY P.product_id, P.product_name
),
rev_rank AS (
	SELECT *,
		SUM(Revenue) OVER() AS Total_Revenue,
		SUM(Revenue) OVER(ORDER BY Revenue DESC) AS Running_Revenue
	FROM rev_table
)
SELECT *,
	CASE 
		WHEN Running_percent <= 80 THEN 'A'
		WHEN Running_percent <= 95 THEN 'B'
		ELSE 'C'
	END AS Product_Class
FROM (
	SELECT
		Product_ID, Product_Name,
		Revenue, ROUND(CAST(Running_Revenue AS FLOAT)/CAST(Total_Revenue AS FLOAT)*100,2) AS Running_percent
	FROM rev_rank
) AS tab