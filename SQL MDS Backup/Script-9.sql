SELECT current_setting('timezone') ;

SELECT '2023-01-01'::timestamptz;
SELECT '2023-01-01'::timestamp;

CREATE TABLE demo (
	tz timestamptz,
	ntz timestamp
);

INSERT
	INTO 
	demo(tz,
	ntz)
VALUES('2023-01-01 15:30:00 -0700', 
		   '2023-01-01 15:30:00');
		   
SELECT * FROM demo;


