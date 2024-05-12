SELECT
	product_id,
	product_name,
	product_category_id
FROM
	product
WHERE
	product_category_id = 1
LIMIT 1;

SELECT
	customer_purchases.product_id,
	customer_purchases.vendor_id,
	customer_purchases.market_date,
	customer_purchases.customer_id,
	customer_purchases.quantity,
	customer_purchases.cost_to_customer_per_qty,
	customer_purchases.transaction_time,
	quantity * cost_to_customer_per_qty price
FROM
	customer_purchases
WHERE
	customer_id = 4
ORDER BY market_date, vendor_id, product_id
LIMIT 5;

SELECT
	customer_purchases.product_id,
	customer_purchases.vendor_id,
	customer_purchases.market_date,
	customer_purchases.customer_id,
	customer_purchases.quantity,
	customer_purchases.cost_to_customer_per_qty,
	quantity * cost_to_customer_per_qty price
FROM
	customer_purchases
WHERE
	customer_id = 4
	OR customer_id = 3
ORDER BY
	market_date,
	customer_id,
	vendor_id,
	product_id
LIMIT 10;

SELECT
	market_date,
	customer_id,
	vendor_id,
	product_id,
	quantity,
	quantity * cost_to_customer_per_qty AS price
FROM
	farmers_market.customer_purchases
WHERE
	customer_id = 3
	AND customer_id = 4
ORDER BY
	market_date,
	customer_id,
	vendor_id,
	product_id
	
	
	
SELECT
	market_date,
	customer_id,
	vendor_id,
	product_id,
	quantity,
	quantity * cost_to_customer_per_qty price
FROM 
	customer_purchases
WHERE 
	customer_id > 3
	AND customer_id <= 5
ORDER BY
	1,
	2,
	3,
	4
	
	
SELECT
	product_id,
	product_name
FROM 
	product
WHERE 
	(product_id = 10
	OR product_id > 3)
	AND (product_id < 8)
	
SELECT
	customer_id,
	customer_first_name,
	customer_last_name
FROM
	customer
WHERE
	customer_first_name = 'Carlos'
	OR customer_last_name = 'Diaz'

	
SELECT
	*
FROM
	vendor_booth_assignments
WHERE
	vendor_id = 9
	AND market_date <= '2019-04-09'
ORDER BY
	market_date;

SELECT
	*
FROM
	vendor_booth_assignments
WHERE
	vendor_id = 7
	AND (market_date BETWEEN '2019-04-02' AND '2019-04-16')
ORDER BY
	market_date;


SELECT
	customer_id,
	customer_first_name,
	customer_last_name
FROM
	customer
WHERE 
	customer_last_name IN ('Diaz', 'Edwards', 'Wilson')
ORDER BY
	customer_last_name, customer_first_name;


SELECT
	customer_id,
	customer_first_name,
	customer_last_name
FROM
	customer
WHERE
	customer_first_name LIKE 'Jer%';

SELECT
	product_id,
	product_name,
	product_size
FROM 
	product
WHERE
	product_size IS NULL;


SELECT
	product_id,
	product_name,
	product_size
FROM 
	product
WHERE
	product_size IS NULL
	OR TRIM(product_size) = '';
	

SELECT 
 market_date,
 transaction_time,
 customer_id, 
 vendor_id, 
 quantity
FROM farmers_market.customer_purchases
WHERE 
 customer_id = 1
 AND vendor_id = 7
 AND quantity < 0
 

 
SELECT
	market_date,
	market_rain_flag
FROM 
	market_date_info
WHERE
	market_rain_flag = 0;
	

SELECT
	market_date,
	customer_id,
	vendor_id,
	quantity * cost_to_customer_per_qty price
FROM 
	customer_purchases cp
WHERE 
	market_date IN (
	SELECT
		market_date
	FROM
		market_date_info
	WHERE
		market_rain_flag <> 0)
LIMIT 5;