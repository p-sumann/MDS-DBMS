SELECT
	customer_id,
	customer_first_name,
	customer_last_name,
	customer_zip
FROM 
	customer;
	

SELECT
	customer_id,
	customer_first_name,
	customer_last_name,
	customer_zip
FROM 
	customer
ORDER BY
	customer_last_name,
	customer_first_name
LIMIT 10;

SELECT
	customer_id,
	customer_first_name
FROM 
	customer
ORDER BY
	customer_first_name;

