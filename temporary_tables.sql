Temporary Tables

1.  Using the example from the lesson, re-create the employees_with_departments table.

USE florence20;

CREATE TEMPORARY TABLE employees_with_departments AS
	SELECT emp_no, first_name, last_name, dept_no, dept_name
	FROM employees.employees
	JOIN employees.dept_emp USING(emp_no)
	JOIN employees.departments USING(dept_no);


    A.  Add a column named full_name to this table. It should be a VARCHAR whose 
        length is the sum of the lengths of the first name and last name columns

    DESCRIBE employees_with_departments;
    ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);

    B.  Update the table so that full name column contains the correct data

    UPDATE employees_with_departments
    SET full_name = CONCAT(first_name,' ',last_name);

    C.  Remove the first_name and last_name columns from the table.

    ALTER TABLE employees_with_departments DROP COLUMN first_name;
    ALTER TABLE employees_with_departments DROP COLUMN last_name;

    D.  What is another way you could have ended up with this same table?

    CREATE TEMPORARY TABLE emp_w_dept AS
	SELECT emp_no, dept_no, dept_name, CONCAT(first_name,' ',last_name) AS full_name,
		FROM employees.employees
		JOIN employees.dept_emp USING(emp_no)
		JOIN employees.departments USING(dept_no);

2.  Create a temporary table based on the payment table from the sakila database.

    Write the SQL necessary to transform the amount column such that it is stored as an integer 
    representing the number of cents of the payment. For example, 1.99 should become 199.

    CREATE TEMPORARY TABLE saks AS 
	    SELECT *
	    FROM sakila.payment;

    ALTER TABLE saks MODIFY COLUMN amount DECIMAL(7,2);	

    UPDATE saks
    SET amount = amount*100;

    ALTER TABLE saks MODIFY COLUMN amount INT; 

3.  Find out how the current average pay in each department compares to the overall, historical 
    average pay. In order to make the comparison easier, you should use the Z-score for salaries. 
    In terms of salary, what is the best department right now to work for? The worst?

    use employees;

    SELECT AVG(salary) AS mean
    FROM salaries;
        -- Historical Average Salary = 63810.7448

    SELECT stddev(salary) AS stdev
    FROM salaries;
        -- Standard Deviation = 16904.82828800014
    
    SELECT dept_name, AVG(salary) AS dept_avg_salary
    FROM departments
    JOIN dept_emp USING(dept_no)
    JOIN salaries USING(emp_no)
    WHERE dept_emp.to_date>curdate()
    AND salaries.to_date>curdate()
    GROUP BY dept_name;
        -- dept_name	        dept_avg_salary
        -- Customer Service	    67285.2302
        -- Development	        67657.9196
        -- Finance	            78559.9370
        -- Human Resources	    63921.8998
        -- Marketing	        80058.8488
        -- Production	        67843.3020
        -- Quality Management	65441.9934
        -- Research	            67913.3750
        -- Sales	            88852.9695

    CREATE TEMPORARY TABLE current_info AS (
	    SELECT dept_name, AVG(salary) AS dept_avg_salary
	    FROM employees.departments
	    JOIN employees.dept_emp USING(dept_no)
	    JOIN employees.salaries USING(emp_no)
	    WHERE dept_emp.to_date>curdate()
	    AND salaries.to_date>curdate()
	    GROUP BY dept_name
    );

    ALTER TABLE dept_avg_salary ADD mean INT;

    UPDATE dept_avg_salary
    SET mean = 63810.7448;

    ALTER TABLE dept_avg ADD stdev INT;

    UPDATE dept_avg
    SET stdev = 16904.82828800014;

    ALTER TABLE dept_avg ADD z INT;

    UPDATE dept_avg
    SET z = (dept_avg_salary-mean) / stdev;









    




    