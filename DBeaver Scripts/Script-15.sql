select max(salary) from employees;
select max(salary) as salary from employees where salary < (select max(salary) from employees) ;  
select salary from employees order by 1 desc limit 1 offset 1;


with third_highest as (select row_number() over(order by salary desc) third, salary from employees)
select salary from third_highest where third = 2;

select min(salary) from (select distinct salary from employees order by 1 desc );

select salary from (select salary, dense_rank() over (order by salary desc) ranking from employees) where ranking = 3;