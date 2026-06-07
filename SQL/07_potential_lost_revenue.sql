WITH demand_tab AS (
	SELECT
		P.product_id, P.product_name, P.price,
		SUM(OD.quantity) AS Total_Demand
	FROM products P INNER JOIN order_details OD ON P.product_id = OD.product_id
	GROUP BY P.product_id, P.product_name, P.price
)

SELECT D.product_id, D.product_name, Total_Demand, S.stock_quantity,
	CASE
		WHEN D.Total_Demand > S.stock_quantity THEN (Total_Demand - Stock_quantity) * D.price
		ELSE 0
	END AS Potential_revenue_loss
FROM demand_tab D JOIN stocks S ON D.product_id = S.product_id
