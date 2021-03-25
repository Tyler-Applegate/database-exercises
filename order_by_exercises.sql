ORDER BY Exercises

1.  Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.
        
        USE employees;

2. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. 
   In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name 
   of the last person in the table?
        
        SELECT first_name, last_name
        FROM employees
        WHERE first_name 
	        IN ('Irena', 'Vidya', 'Maya')
	        ORDER BY first_name; 
                - 709 Records
                - 1st Row Irena Reutenauer
                - Last Row Vidya Simmen

3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. 
   In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the 
   last person in the table?

        SELECT first_name, last_name
        FROM employees
        WHERE first_name 
	        IN ('Irena', 'Vidya', 'Maya')
	        ORDER BY first_name, last_name;
                - 709 Records
                - 1st Row Irena Acton
                - Last Row Vidya Zweizig 

4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. 
   In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the 
   last person in the table?

    SELECT first_name, last_name
    FROM employees
    WHERE first_name 
	    IN ('Irena', 'Vidya', 'Maya')
	    ORDER BY last_name, first_name;
            - 709 Records
            - 1st Row Irena Acton
            - Last Row Maya Zyda

5. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. 
   Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last 
   employee number with their first and last name.

        SELECT first_name, last_name, emp_no
        FROM employees
        WHERE last_name LIKE 'E%'
	        AND last_name LIKE '%e'
	        ORDER BY emp_no;
                - 899 Records
                - 1st row Ramzi Erde 10021
                - Last row Tadahiro Erde 499648

6. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the 
   newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, 
   and the name of the oldest emmployee.

        SELECT *
        FROM employees
        WHERE last_name LIKE 'E%'
	        AND last_name LIKE '%e'
	        ORDER BY hire_date DESC;
                - 899 Records
                - Newest Hire Teihi Eldridge
                - Oldest Hire Sergi Erde

7. Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is 
   the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, 
   and the name of the youngest emmployee who was hired first.

        SELECT *
        FROM employees
        WHERE hire_date LIKE '199%'
	        AND birth_date LIKE '%12-25'
	        ORDER BY birth_date, hire_date DESC;
                - 362 Records
                - Khun Bernini
                - Douadi Pettis

