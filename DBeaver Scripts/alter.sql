alter table sp.employees add column age int;

alter table sp.employees drop column age;


alter table sp.employees alter column department set default 'Suman';


alter table sp.employees alter column department set default 'Unassgined';

alter table sp.employees drop column id;

alter table sp.employees add column id serial primary key;