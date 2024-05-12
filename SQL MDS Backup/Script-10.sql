CREATE TABLE sp.product 
(product_name varchar,
product_id serial PRIMARY KEY);

CREATE TABLE sp.order_details (
	order_id serial PRIMARY KEY,
	product_id int,
	qty int
	
)

INSERT INTO sp.product VALUES ('Car'), ('Bike') ;
INSERT INTO sp.product VALUES ('Car'), ('Bike') ;
INSERT INTO sp.product VALUES ('Plane',6);

INSERT INTO sp.order_details VALUES (1,3), (5,5) ;
INSERT INTO sp.order_details VALUES (6,6,7) ;

 
SELECT * FROM product ;
SELECT * FROM order_details ;

SELECT product_name, product_id
FROM product WHERE product_id NOT IN (SELECT DISTINCT product_id FROM order_details)

SELECT * FROM product 
SELECT * FROM order_details 

SELECT DISTINCT product_id FROM order_details
SELECT * FROM product 