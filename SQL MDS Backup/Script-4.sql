UPDATE
	sp.employees
SET
	firstname = 'Gita'
WHERE
	id = 3;

UPDATE
	sp.employees
SET
	last_name = 'Babe'
WHERE
	id = 3;

SELECT
	*
FROM
	sp.employees e;