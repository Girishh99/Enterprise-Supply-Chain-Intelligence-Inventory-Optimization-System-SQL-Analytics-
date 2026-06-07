-- Warehouse Performance Ranking
SELECT 
	W.warehouse_id, 
	W.warehouse_name,
	COUNT(O.order_id) AS Order_count
FROM warehouses W JOIN orders O ON W.warehouse_id = O.warehouse_id
GROUP BY W.warehouse_id, W.warehouse_name
ORDER BY Order_count DESC;


-- Regional Performance
SELECT
	W.region,
	COUNT(O.order_id) AS Order_Count
FROM warehouses W JOIN orders O ON W.warehouse_id = O.warehouse_id
GROUP BY W.region
ORDER BY 2 DESC