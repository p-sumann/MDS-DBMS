SELECT
	vendor_id,
	vendor_name,
	vendor_type,
	CASE
		WHEN 
			LOWER(vendor_type) LIKE '%fresh%'
		THEN 'Fresh'
		ELSE 'OTHER'
	END AS vendor_type_condensed
FROM 
	vendor;
	


SELECT 
	market_date,
	market_day,
	CASE
		WHEN (market_day IN ('Saturday', 'Sunday'))
			THEN 1
		ELSE 0
	END AS weekend_flag
FROM
	market_date_info;
	






SELECT
	customer_id,
	product_id,
	quantity,
	cost_to_customer_per_qty,
	quantity * cost_to_customer_per_qty AS price,
	CASE
		WHEN quantity * cost_to_customer_per_qty > 30
			THEN 1
		ELSE 0
	END AS price_over_50
FROM
	customer_purchases;













