-- 1
CREATE OR REPLACE PROCEDURE GetEmployee()
LANGUAGE plpgsql
AS $$
DECLARE
    emp_record RECORD;
BEGIN
    FOR emp_record IN (SELECT e.ename, e.bdate, e.address FROM Employee e)
    LOOP
        RAISE NOTICE 'Employee Name: %, Employee Bdate: %, Employee Address: %',
                     emp_record.ename, emp_record.bdate,
                     emp_record.address;
    END LOOP;
END;
$$;

CREATE OR REPLACE FUNCTION Get_Employee()
RETURNS TABLE (
    Ename VARCHAR(100),
    Bdate DATE,
    Address VARCHAR(100)
)
AS $$
BEGIN
    RETURN QUERY
    SELECT e.Ename,e.Bdate, e.Address
    FROM Employee e;
END;
$$
 LANGUAGE plpgsql;
-- 2
call GetEmployee()
-- 3
CREATE OR REPLACE FUNCTION getPfCategoryName(IN amt NUMERIC)
RETURNS TABLE (
    pfcategoryname VARCHAR(100),
    amount NUMERIC,
    start_date DATE
)
AS $$
BEGIN
    RETURN QUERY
    select p.pfcategoryname, p.amount, p.start_date
    FROM pf p where p.amount > amt;
END;
$$
 LANGUAGE plpgsql;
 
select * from getPfCategoryName(1000);
CALL getPfCategoryName(3000);


-- 4
CREATE OR REPLACE FUNCTION get_pf_records(input_amount numeric, OUT total integer)
AS $$
BEGIN
    SELECT COUNT(*) INTO total
    FROM pf
    WHERE amount = input_amount;
END;
$$
 LANGUAGE plpgsql;
-- 5
 select * from get_pf_records(3000);
-- 6
CREATE OR REPLACE FUNCTION employee_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    RAISE NOTICE 
    'Inserting a new employee with details: SSN: %, Ename: %, Ono: %',
    NEW.SSN, NEW.Ename, NEW.Ono;
    RETURN NEW;
END;
$$
 LANGUAGE plpgsql;

CREATE TRIGGER employee_before_insert_trigger
BEFORE INSERT ON employee
FOR EACH ROW
EXECUTE PROCEDURE employee_before_insert();

INSERT INTO employee (SSN, Ename, Gender, Bdate, Address, SALARY, Ono, Years_of_experience)
VALUES (10, 'Suman Paudel Lab 5', 'M', '1990-01-01', 'Sunwal-6, Lumbini', 50000.00, 1, 5);

INSERT INTO employee (SSN, Ename, Gender, Bdate, Address, SALARY, Ono, Years_of_experience)
VALUES (11, 'John Cena', 'M', '1960-01-01', 'Texas, USA', 10000.00, 3, 20);


-- 7

CREATE OR REPLACE FUNCTION pf_after_delete()
RETURNS TRIGGER AS $$
BEGIN
    RAISE NOTICE 'It is deleted';
    RETURN OLD;
END;
$$
 LANGUAGE plpgsql;

CREATE TRIGGER pf_after_delete_trigger
AFTER DELETE ON pf
FOR EACH ROW
EXECUTE PROCEDURE pf_after_delete();


DELETE FROM pf WHERE PFID = 10;



