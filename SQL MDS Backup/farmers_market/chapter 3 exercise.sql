-- question number 1
SELECT
	customer_purchases.product_id,
	customer_purchases.vendor_id,
	customer_purchases.market_date,
	customer_purchases.customer_id,
	customer_purchases.quantity,
	customer_purchases.cost_to_customer_per_qty,
	customer_purchases.transaction_time
FROM
	customer_purchases
WHERE
	product_id = 4
	OR product_id = 9;
	
-- question number 2
-- USING AND
SELECT
	customer_purchases.product_id,
	customer_purchases.vendor_id,
	customer_purchases.market_date,
	customer_purchases.customer_id,
	customer_purchases.quantity,
	customer_purchases.cost_to_customer_per_qty,
	customer_purchases.transaction_time
FROM
	customer_purchases
WHERE 
	vendor_id >= 8
	AND vendor_id <= 10;
	
-- USING BETWEEN
SELECT
	customer_purchases.product_id,
	customer_purchases.vendor_id,
	customer_purchases.market_date,
	customer_purchases.customer_id,
	customer_purchases.quantity,
	customer_purchases.cost_to_customer_per_qty,
	customer_purchases.transaction_time
FROM
	customer_purchases
WHERE 
	vendor_id BETWEEN 8 AND 10;