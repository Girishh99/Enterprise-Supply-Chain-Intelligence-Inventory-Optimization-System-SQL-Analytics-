-- Total Revenue
SELECT 
	SUM(quantity * unit_price) AS Total_Revenue 
FROM order_details;

-- Monthly Revenue trends
SELECT 
	DATENAME(month, O.order_date) AS Month,
	SUM(OD.quantity * OD.unit_price) AS Monthly_Revenue
FROM orders O JOIN order_details OD ON O.order_id = OD.order_id
GROUP BY DATENAME(Month, O.order_date);

-- Top Products by revenue
SELECT
	P.product_name AS Product,
	SUM(OD.quantity * OD.unit_price) AS Revenue
FROM products P JOIN order_details OD ON P.product_id = OD.product_id
GROUP BY product_name
ORDER BY 2 DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;