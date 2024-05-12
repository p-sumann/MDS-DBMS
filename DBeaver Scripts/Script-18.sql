-- 1
CREATE TABLE Teacher (
    Id INT PRIMARY KEY,
    Tname VARCHAR(20)
);

CREATE TABLE Student (
    Id INT PRIMARY KEY,
    Sname VARCHAR(20)
);

-- 2
INSERT INTO Teacher (Id, Tname) VALUES
    (1, 'Ram'),
    (2, 'Hari'),
    (3, 'Sita');

INSERT INTO Student (Id, Sname) VALUES
    (2, 'Hari'),
    (3, 'Sita'),
    (4, 'Gita');

-- 3
SELECT * FROM Teacher
UNION
SELECT * FROM Student;

4


SELECT * FROM Teacher
INTERSECT
SELECT * FROM Student;


5

SELECT DISTINCT t.Tname
FROM Teacher t
INNER JOIN Student s ON t.Tname = s.Sname;

6
SELECT Tname
FROM Teacher
WHERE Tname IN (SELECT Sname FROM Student);

7
SELECT t.Tname
FROM Teacher t
LEFT JOIN Student s ON t.Tname = s.Sname
WHERE s.Sname IS NULL;


8 SELECT COUNT(*) AS num_offices
FROM Office;


9 SELECT COUNT(DISTINCT Ename) AS distinct_names
FROM Employee;

10
SELECT SUM(Salary) AS total_salary
FROM Employee;

11
SELECT AVG(Salary) AS avg_salary
FROM Employee;

12
SELECT MAX(PFAmount) AS max_pf_amount
FROM PF;

13 SELECT MIN(PFAmount) AS min_pf_amount
FROM PF;

