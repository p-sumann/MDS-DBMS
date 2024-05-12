DROP DATABASE IF EXISTS suman_33_company;
CREATE DATABASE suman_33_company;
\c suman_33_company;


DROP TABLE IF EXISTS Office;
CREATE TABLE Office(
  Onumber INT PRIMARY KEY,
  Oname VARCHAR(100) NOT NULL,
  Country VARCHAR(50)
);

DROP TABLE IF EXISTS Employee;
CREATE TABLE employee (
  SSN INT PRIMARY KEY,
  Ename VARCHAR(100) NOT NULL,
  Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
  Bdate Date,
  Address VARCHAR(100),
  SALARY NUMERIC(10, 2) DEFAULT 0.00,
  Ono INT,
  Years_of_experience INT,
  FOREIGN KEY(Ono) REFERENCES Office(Onumber)
);



DROP TABLE IF EXISTS Project;
CREATE TABLE Project (
  Pnumber INT PRIMARY KEY,
  Pname VARCHAR(40) UNIQUE NOT NULL,
  Plocation VARCHAR(40),
  Onumber INT,
  CONSTRAINT fk_pro FOREIGN KEY (Onumber) REFERENCES Office(Onumber)
);

DROP TABLE IF EXISTS Works_on;
CREATE TABLE Works_on (
  ESSN INT,
  Pno INT,
  PRIMARY KEY (ESSN, Pno),
  FOREIGN KEY (ESSN) REFERENCES Employee(SSN) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (Pno) REFERENCES Project(Pnumber) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS Dependent;
CREATE TABLE Dependents (
  Did INT PRIMARY KEY,
  Dname VARCHAR(100),
  Dage INT,
  CONSTRAINT age_constraint CHECK (Dage < 16),
  SSN INT,
    FOREIGN KEY (SSN) REFERENCES Employee(SSN) ON UPDATE SET NULL ON DELETE SET NULL
);




ALTER TABLE dependents ADD COLUMN drelation CHAR(50);
ALTER TABLE dependents ALTER COLUMN drelation TYPE varchar(50);



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
VALUES (33, 'Suman Paudel', 'M', '1997-10-22', 'Kathmanu, Nepal', 30000.00, 1, 3);
  
  
 INSERT INTO employee (SSN, Ename, Gender, Bdate, Address, SALARY, Ono, Years_of_experience)
VALUES
  (1, 'Rekha Thapa', 'F', '1992-03-22', 'Kathmandu, Nepal', 55000.00, 2, 5),
  (2, 'KP Oli', 'M', '1978-11-08', 'Bhaktapur, Nepal', 72000.00, 3, 12),
  (3, 'Puspa Kamal Dahal Pracanda', 'M', '1990-09-01', 'Lalitpur, Nepal', 48000.00, 4, 3),
  (4, 'Rabi Lamichane', 'M', '1983-04-30', 'Chitwan, Nepal', 60000.00, 4, 7);


-- insert project
 INSERT INTO Project (Pnumber, Pname, Plocation, Onumber)
VALUES (66, 'Suman_ProjMDS', 'Kathmandu', 1);

 INSERT INTO Project (Pnumber, Pname, Plocation, Onumber)
 VALUES 
  (2, 'Project Kathmandu', 'Kathmandu', 2),
  (3, 'Project Butwal', 'Butwal', 3),
  (4, 'Project Chitwan', 'Chitwan', 4),
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
 
INSERT INTO Dependent (Did, Dname, Dage, SSN, Drelation)
VALUES (1, 'Pushpa Panta Jaisi', 13, 33, 'Mother');
 
INSERT INTO Dependent (Did, Dname, Dage, SSN, Drelation)
VALUES (2, 'Krishna Prasad Jaishi', 13, 33, 'Father'),
    (3, 'Silu Poudel', 12, 33, 'Sister'),
    (4, 'Sujita Sharma', 9, 33, 'Cousin Sister'),
    (5, 'Prabin Adhikari', 14, 33, 'Cousin Brother');
   
-- update command for office
   
UPDATE office SET oname = 'Suman_NTC_33' WHERE onam = 'Suman_Ncell_33';

DELETE FROM employee WHERE ssn = 1;
    
ALTER TABLE project RENAME plocation to Proj_location;
   
SELECT * FROM employee;
SELECT * FROM office;
SELECT * FROM project;
SELECT * FROM workson;
SELECT * FROM dependents;

DROP TABLE works_on;

ALTER TABLE dependent DROP CONSTRAINT age_constraint;

DROP DATABASE suman_33_company;