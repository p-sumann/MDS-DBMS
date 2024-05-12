--q1
select
    e.ename as employee_name,
    d.dname as dependent_name
from
    employee e,
    dependents d
where
    e.ssn = d.ssn
;

--q2
select
    e.ename as employee_name,
    d.dname as dependent_name
from
    employee e,
    dependents d
where
    e.ssn = d.ssn
order by
    dependent_name;

-- q3
select
    e.ename as employee_name,
    p.pname as project_name
from
    employee e
inner join works_on w on
    w.essn = e.ssn
inner join project p on
    p.pnumber = w.pno;
    
--q4

select
    e.ename as employee_name,
    p.amount as pf_amount
from
    employee e
inner join pf p on
    e.ssn = p.ssn
where
    e.salary > p.amount;

--    q5
select
    o.oname,
    p.pname as project_name
from
    office o
left join project p on
    o.onumber = p.pnumber;

select
    o.oname,
    p.pname as project_name
from
    office o
right join project p on
    o.onumber = p.pnumber;

-- q6

select
    e.ename as employee_name,
    p.amount as pf_amount
from
    employee e
cross join pf p;

-- q7

select
    e.ssn, e.ename, 
from
    employee e
join pf p on
    e.ssn = p.ssn;

-- q8
select
    count(*) as number,
    marital_status
from
    employee
group by
    marital_status;

-- q9
select
    count(*) as number,
    marital_status
from
    employee
group by
    marital_status
having
    marital_status = 'Single'
    or marital_status = 'Married';
    
--q10

select
    p.pname,
    p.plocation
from
    project p
where
    p.onumber in (
    select
        o.onumber
    from
        office o
    where
        o.country in ('Nepal', 'India'));
        
    