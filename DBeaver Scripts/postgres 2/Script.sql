WITH ratio_emp AS (
	SELECT dept_id, sum(salary) ratio FROM emp GROUP BY dept_id 
)
SELECT emp.emp_id, salary/ratio_emp.ratio salary_ratio, emp.emp_name, emp.dept_id FROM emp
INNER JOIN ratio_emp ON emp.dept_id = ratio_emp.dept_id;

WITH DeptTotal AS (
    SELECT 
        dept_id,
        SUM(salary) AS dept_salary_ratio
    FROM 
        emp
    GROUP BY 
        dept_id
)
SELECT 
    emp.emp_id,
    emp.emp_name,
    emp.salary / dt.dept_salary_ratio AS salary_ratio
FROM 
    emp
INNER JOIN DeptTotal dt ON emp.dept_id = dt.dept_id;