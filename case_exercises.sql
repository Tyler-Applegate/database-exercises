case exercises

Exercises
Exercise Goals

Use CASE statements or IF() function to explore information in the employees database

1.  Write a query that returns all employees (emp_no), their department number, their start date, 
    their end date, and a new column 'is_current_employee' that is a 1 if the employee is still 
    with the company and 0 if not.

    SELECT dept_emp.emp_no, dept_no, from_date AS current_role_start_date, to_date,
	    IF (to_date>curdate(), TRUE, FALSE) AS is_current_employee
        FROM dept_emp
	        JOIN (SELECT emp_no, max(to_date) AS max_date
	            FROM dept_emp
	            GROUP BY emp_no) AS current_dept
	            ON dept_emp.emp_no = current_dept.emp_no
	            AND dept_emp.to_date = current_dept.max_date;

                -- is_current_employee	emp_count
                --  0	                59900
                --  1	                240124



2.  Write a query that returns all employee names (previous and current), and a new column 
    'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their 
    last name.

    SELECT first_name, last_name, 
	    CASE
		    WHEN last_name <= 'H%' THEN 'A-H'
		    WHEN last_name <= 'Q%' THEN 'I-Q'
		    WHEN last_name >= 'R%' THEN 'R-Z'
		    ELSE 'Other'
		END AS alpha_group
	FROM employees;

3.  How many employees (current or previous) were born in each decade?

    SELECT 
	    CASE
	        WHEN birth_date LIKE '195%' THEN 'Fifties'
	        WHEN birth_date LIKE '196%' THEN 'Sixties'
	        ELSE 'Other'
	        END AS birth_decade,
	        count(*) AS decade_count
FROM employees
GROUP BY birth_decade
ORDER BY decade_count;

        -- Sixties	117138
        -- Fifties	182886



BONUS

1.  What is the current average salary for each of the following department groups: R&D, 
    Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

+-------------------+-----------------+
| dept_group        | avg_salary      |
+-------------------+-----------------+
| Customer Service  |                 |
| Finance & HR      |                 |
| Sales & Marketing |                 |
| Prod & QM         |                 |
| R&D               |                 |
+-------------------+-----------------+    

SELECT 
	CASE  
		WHEN dept_no IN ('d009') THEN 'Customer Service'
		WHEN dept_no IN ('d002', 'd003') THEN 'Finance & HR'
		WHEN dept_no IN ('d007', 'd001') THEN 'Sales & Marketing'
		WHEN dept_no IN ('d004', 'd006') THEN 'Prod & QM'
		WHEN dept_no IN ('d008', 'd005') THEN 'R&D'
		ELSE 'Other'
		END AS dept_group,
		AVG(salary)
FROM departments
JOIN dept_emp AS de USING(dept_no)
JOIN salaries AS s USING(emp_no)
WHERE s.to_date>curdate()
GROUP BY dept_group;

--  dept_group	        AVG(salary)
--  Customer Service	66971.3536
--  Finance & HR	    71111.6674
--  Prod & QM	        67315.3668
--  R&D	                67718.5563
--  Sales & Marketing	86379.3407