-- Stockout Risk Analysis (Demand-based simulation)
WITH demand AS (
	SELECT
		product_id,
		SUM(quantity) AS Total_Demand
	FROM order_details
	GROUP BY product_id
)

SELECT product_id, Total_Demand,
	CASE
		WHEN Total_Demand > 50 THEN 'High Risk'
		WHEN Total_Demand BETWEEN 5 AND 10 THEN 'Medium Risk'
		ELSE 'Low Risk'
	END AS Stockout_Risk
FROM demand;


--Products at Risk of Stockout (Copmaring with quantity in stock)
SELECT P.product_id, P.product_name,
	stock_quantity, Reorder_level,
	CASE
		WHEN stock_quantity < Reorder_level THEN 'Reorder Stock'
		ELSE 'Sufficient'
	END AS Stock_status
FROM products P JOIN stocks S ON P.product_id = S.product_id


