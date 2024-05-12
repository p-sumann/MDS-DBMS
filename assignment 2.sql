

--FOR office table
INSERT INTO Office (Onumber, Oname, Country) VALUES (1, 'Suman_Office_33', 'Nepal');

INSERT INTO Office (Onumber, Oname, Country)
VALUES
  (2, 'Suman_Ncell_33', 'Nepal'),
  (3, 'Prabhat Ale', 'USA'),
  (4, 'Anish Thapaliya', 'India'),
  (5, 'Gaurav Pandey', 'Japan');
 
-- for employee table
 
INSERT INTO employee (SSN, Ename, Gender, Bdate, Address, SALARY, Ono, Years_of_experience)
VALUES (2, 'Suman Paudel', 'M', '1997-10-22', 'Kathmanu, Nepal', 30000.00, 1, 3);
  
  
 INSERT INTO employee (SSN, Ename, Gender, Bdate, Address, SALARY, Ono, Years_of_experience)
VALUES
  (1, 'Rekha Thapa', 'F', '1992-03-22', 'Kathmandu, Nepal', 55000.00, 2, 5),
  (2, 'KP Oli', 'M', '1978-11-08', 'Bhaktapur, Nepal', 72000.00, 3, 2),
  (3, 'Puspa Kamal Dahal Pracanda', 'M', '1990-09-01', 'Lalitpur, Nepal', 48000.00, 4, 3),
  (4, 'Rabi Lamichane', 'M', '1983-04-30', 'Chitwan, Nepal', 60000.00, 4, 7);


-- insert project
INSERT INTO Project (Pnumber, Pname, Plocation, Onumber)
VALUES (66, 'Suman_ProjMDS', 'Kathmandu', 1);

 INSERT INTO Project (Pnumber, Pname, Plocation, Onumber)
 VALUES 
  (2, 'Project Kathmandu', 'Kathmandu', 2),
  (3, 'Project Butwal', 'Butwal', 3),
  (4, 'Project India', 'Delhi', 4),
  (5, 'Project Dhangadi', 'Dhangadi', 5);

-- insert workson
INSERT INTO Works_on (ESSN, Pno)
VALUES (33, 66);
 
 INSERT INTO Works_on (ESSN, Pno)
VALUES
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5);
 
 
-- insert dependents
 
INSERT INTO Dependents (Did, Dname, Dage, SSN, Drelation)
VALUES (1, 'Demo', 13, 2, 'Mother');
 
INSERT INTO Dependents (Did, Dname, Dage, SSN, Drelation)
VALUES (2, 'Krishna Prasad Jaishi', 13, 33, 'Father'),
    (3, 'Silu Poudel', 12, 33, 'Sister'),
    (4, 'Sujita Sharma', 9, 33, 'Cousin Sister'),
    (5, 'Prabin Adhikari', 14, 33, 'Cousin Brother');
   
drop TABLE if exists pf;   
create table PF(
PFID int primary key,
SSN int,
PFCategoryName varchar(40),
Amount numeric,
Start_date date,
Remarks text,
constraint fk_pf foreign key(SSN) references Employee(SSN)

);


ALTER table employee  add column marital_status varchar(20);

update employee set marital_status = 'Single' WHERE ssn = 33;
update employee set marital_status = 'Married' WHERE ssn = 1;
update employee set marital_status = 'Married' WHERE ssn = 2;
update employee set marital_status = 'Married' WHERE ssn = 3;
update employee set marital_status = 'Divorced' WHERE ssn = 4;


INSERT INTO pf (PFID, SSN, PFCategoryName, Amount, Start_date, Remarks) VALUES
(1, 33, 'Retirement', 1000.00, '2022-01-01', 'Regular contribution'),
(2, 1, 'Medical', 3000.00, '2022-02-15', 'Health insurance'),
(3, 2, 'Education', 1500.00, '2022-03-01', 'Child education fund'),
(4, 3, 'Retirement', 1600.00, '2022-04-01', 'Additional contribution'),
(5, 4, 'Housing', 40000.00, '2022-05-01', NULL),
(6, 33, 'Retirement', 5500.00, '2022-06-01', 'Regular contribution'),
(7, 1, 'Medical', 200.00, '2022-07-01', 'Dental insurance'),
(8, 2, 'Education', 800.00, '2022-08-01', 'Child tuition'),
(9, 3, 'Retirement', 3000.00, '2022-09-01', 'Additional contribution'),
(10, 4, 'Housing', 4500.00, '2022-10-01', NULL);

SELECT * from employee ;

SELECT * from employee where salary > 30000 order by ename desc;

SELECT * from project order by pname;

SELECT * from employee WHERE salary > 30000 and years_of_experience < 3;

SELECT ename, address, salary from employee WHERE salary > 30000 OR  years_of_experience < 3;

select * from dependents;

select dname, dage from dependents where dage between 5 and 60;

select * from office WHERE oname like '%Nt%';

select onumber from office where onumber in (1,2,3);

select * from pf WHERE remarks is null;

SELECT pfcategoryname, amount, start_date, remarks from pf where remarks is not null;

select * from pf limit 5;

SELECT pfcategoryname from pf where amount != 3000;


SELECT e.eployees from employee e inner join workson w on e.ssn = w.essn inner JOIN project p on p.number = w.pno;

                                          ^
select e.ename from employee e inner join works_on w on e.ssn = w.essn inner JOIN project p on p.pnumber = w.pno where p.pnumber=2;
    