
Exercise Goals

Use join, left join, and right join statements on our Join Example DB
Integrate aggregate functions and clauses into our queries with JOIN statements

Join Example Database
1.  Use the join_example_db. Select all the records from both the users and roles tables.

    SELECT *
    FROM users
    JOIN roles;

2.  Use join, left join, and right join to combine results from the users and roles tables 
    as we did in the lesson. Before you run each query, guess the expected number of results.

    SELECT *
    FROM users
    JOIN roles;

    -- 

    SELECT *
    FROM users
    LEFT JOIN roles ON roles.id = users.role_id;

    SELECT *
    FROM users
    RIGHT JOIN roles ON roles.id = users.role_id;


3.  Although not explicitly covered in the lesson, aggregate functions like count can be 
    used with join queries. Use count and the appropriate join type to get a list of roles 
    along with the number of users that has the role. Hint: You will also need to 
    use group by in the query.

    SELECT roles.name, count(users.role_id) AS role_count
    FROM roles
    LEFT JOIN users ON users.role_id = roles.id
    GROUP BY roles.name;


Employees Database
1.  Use the employees database.

    USE employees;

2.  Using the example in the Associative Table Joins section as a guide, write a query that 
    shows each department along with the name of the current manager for that department.

    SELECT dept_name AS "Department Name", CONCAT(first_name, " ", last_name) AS "Department Manager"
    FROM departments
    JOIN dept_manager USING(dept_no)
    JOIN employees ON employees.emp_no = dept_manager.emp_no
    WHERE to_date LIKE '9999%'
    ORDER BY dept_name;

3.  Find the name of all departments currently managed by women.

    SELECT dept_name AS "Department Name", CONCAT(first_name, " ", last_name) AS "Department Manager"
    FROM departments
    JOIN dept_manager USING(dept_no)
    JOIN employees ON employees.emp_no = dept_manager.emp_no
    WHERE to_date LIKE '9999%'
    AND employees.gender IN ('F')
    ORDER BY dept_name;

4.  Find the current titles of employees currently working in the Customer Service department.

    SELECT titles.title AS 'Title', COUNT(titles.title) AS 'Count'
    FROM departments
    JOIN dept_emp USING(dept_no)
    JOIN titles USING(emp_no)
    WHERE departments.dept_no IN ('d009')
    AND titles.to_date LIKE '9999%'
    AND dept_emp.to_date LIKE '9999%'
    GROUP BY Title;

5.  Find the current salary of all current managers.

    SELECT departments.dept_name AS 'Department Name',
	CONCAT(employees.first_name, " ", employees.last_name) AS 'Name',
	salaries.salary AS 'Salary'
    FROM departments
    JOIN dept_manager USING(dept_no)
    JOIN employees USING(emp_no)
    JOIN salaries USING(emp_no)
    WHERE dept_manager.to_date LIKE '9999%'
    AND salaries.to_date LIKE '9999%'
    ORDER BY departments.dept_name;

6.  Find the number of current employees in each department.

    SELECT dept_no, dept_name, COUNT(dept_emp.emp_no) AS num_employees
    FROM departments
    JOIN dept_emp USING(dept_no)
    WHERE dept_emp.to_date LIKE '9999%'
    GROUP BY dept_no;

7.  Which department has the highest average salary? Hint: Use current not historic information.

    SELECT dept_name, AVG(salary) AS average_salary
    FROM departments
    JOIN dept_emp USING(dept_no)
    JOIN salaries USING(emp_no)
    WHERE dept_emp.to_date LIKE '9999%'
    AND salaries.to_date LIKE '9999%'
    GROUP BY dept_name
    ORDER BY average_salary DESC
    LIMIT 1;

8.  Who is the highest paid employee in the Marketing department?

    SELECT first_name, last_name
    FROM departments
    JOIN dept_emp USING(dept_no)
    JOIN employees USING(emp_no)
    JOIN salaries USING(emp_no)
    WHERE dept_no IN ('d001')
    ORDER BY salary DESC
    LIMIT 1;

9.  Which current department manager has the highest salary?

    SELECT first_name, last_name, salary, dept_name
    FROM departments
    JOIN dept_manager USING(dept_no)
    JOIN employees USING(emp_no)
    JOIN salaries USING(emp_no)
    WHERE dept_no IN ('d001')
    AND dept_manager.to_date LIKE '9999%'
    AND salaries.to_date LIKE '9999%'

10. Bonus Find the names of all current employees, their department name, and their current 
    managers name.

11. Bonus Who is the highest paid employee within each department.   

