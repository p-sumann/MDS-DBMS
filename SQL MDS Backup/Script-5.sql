DELETE
FROM
	sp.employees
WHERE
	id IN (1, 2, 4);
SELECT 
	*
FROM
	sp.employees e ;

INSERT
	INTO
	sp.employees (id,
	firstname,
	last_name,
	email) VALUES
(2, 'Jane', 'Smith', 'janesmith@example.com'),
(3, 'Bob', 'Johnson', 'bobjohnson@example.com'),
(4, 'Alice', 'Williams', 'alicewilliams@example.com');

DROP  TABLE employees ;

SELECT 
	*
FROM 
	sp.employees e ;
	
DELETE FROM sp.employees ;