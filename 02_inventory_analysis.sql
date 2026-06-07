-- Inventory Value
SELECT P.product_id, P.product_name,
	SUM(S.stock_quantity * P.price) AS Inventory_value
FROM Stocks S JOIN products P ON S.product_id = P.product_id
GROUP BY P.product_id, P.product_name
ORDER BY 3

-- Most Ordered Products
SELECT
	P.product_id, P.product_name,
	SUM(OD.quantity) AS products_sold
FROM order_details OD JOIN products P ON OD.product_id = P.product_id
GROUP BY P.product_id, P.product_name
HAVING SUM(OD.quantity) >= 10
ORDER BY 3 DESC
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;


--Low Demand Products
SELECT
	P.product_id, P.product_name,
	SUM(OD.quantity) AS products_sold
FROM products P JOIN order_details OD ON P.product_id = OD.product_id
GROUP BY P.product_id, P.product_name
HAVING SUM(OD.quantity) < 10
ORDER BY 3 ASC;


--Category Performance
SELECT *,
	ROW_NUMBER() OVER(ORDER BY Revenue_by_Category DESC) AS Performance_Rank 
FROM (
	SELECT
		P.Category,
		SUM(quantity) AS Units_sold,
		SUM(OD.quantity * OD.unit_price) AS Revenue_by_Category
	FROM products p JOIN order_details OD ON P.product_id = OD.product_id
	GROUP BY P.category
) AS t