--Customer Segmentation (RFM Analysis)

WITH rfm AS (
	SELECT O.customer_id, C.customer_name,
		MAX(order_date) AS Recent_Order,
		COUNT(O.order_id) AS Order_Frequency,
		SUM(OD.quantity * OD.unit_price) AS Total_Revenue
	FROM order_details OD JOIN orders O ON OD.order_id = O.order_id
	JOIN customers C ON O.customer_id = C.customer_id
	GROUP BY O.customer_id, C.customer_name
)

SELECT *,
	CASE
		WHEN (Order_Frequency > 5) OR (Total_Revenue >= 100000) THEN 'HIGH'
		WHEN (Order_Frequency BETWEEN 5 AND 2) OR (Total_Revenue >= 20000) THEN 'MEDIUM'
		ELSE 'LOW'
	END AS Customer_Segment
FROM rfm
