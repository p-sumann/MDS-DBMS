create table sp.employees (
	id numeric primary key,
	firstname varchar not null,
	last_name varchar not null,
	email varchar,
	hire_date date default current_date,
	department varchar default 'Unassigned' 
	
);

select * from sp.employees;
