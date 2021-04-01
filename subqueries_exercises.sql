Subqueries Exercises

1.  Find all the current employees with the same hire date as employee 
    101010 using a sub-query.

    SELECT*
    FROM employees
    WHERE hire_date = (
	    SELECT hire_date
	    FROM employees
	    WHERE emp_no = 101010
    );

        -- 69 Records

2.  Find all the titles ever held by all current employees with the 
    first name Aamod.

    SELECT DISTINCT title
    FROM titles
    WHERE to_date>curdate()
        AND emp_no IN (
	    SELECT emp_no
	    FROM employees
	    WHERE first_name = 'Aamod');

3.  How many people in the employees table are no longer working for the 
    company? Give the answer in a comment in your code.

    SELECT COUNT(*) AS 'Count'
    FROM employees
    WHERE emp_no IN (
	    SELECT emp_no
	    FROM dept_emp
	    WHERE to_date<curdate());
            -- 85108	

4.  Find all the current department managers that are female. List their 
    names in a comment in your code.

    SELECT CONCAT(first_name,' ',last_name)
    FROM employees
    WHERE gender = 'F' AND emp_no IN (
	    SELECT emp_no
	    FROM dept_manager
	    WHERE to_date>curdate());

            -- 4 Records
            -- Isamu Legleitner
            -- Karsten Sigstam
            -- Leon DasSarma
            -- Hilary Kambil

5.  Find all the employees who currently have a higher salary than the 
    companies overall, historical average salary.

    SELECT *
    FROM employees
    WHERE emp_no IN(
	    SELECT emp_no
	    FROM salaries
	    WHERE to_date>curdate() 
	    AND salary>(
		    SELECT AVG(salary)
		    FROM salaries)
		);
        -- 154543 Records

6.  How many current salaries are within 1 standard deviation of the 
    current highest salary? (Hint: you can use a built in function to 
    calculate the standard deviation.) What percentage of all salaries 
    is this?

    SELECT COUNT(salary)
    FROM salaries
    WHERE to_date>curdate() 
        AND salary>(
	    SELECT (max(salary)-std(salary))
	    FROM salaries
    );
        - 83 Records
    
    SELECT(SELECT COUNT(salary)
    FROM salaries
    WHERE to_date>curdate() 
    AND salary>(
	    SELECT (max(salary)-std(salary))
	    FROM salaries
	    WHERE to_date>curdate()
    ))
    /
    (SELECT COUNT(salary)
    FROM salaries
    WHERE to_date>curdate() 
    ) AS '%';	

        -0.0003%

BONUS

1.  Find all the department names that currently have female managers.

2.  Find the first and last name of the employee with the highest salary.

3.  Find the department name that the employee with the highest salary works in.