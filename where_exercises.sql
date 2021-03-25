SQL Where Exercises 2021-03-25

1. Create a file named where_exercises.sql. Make sure to use the employees database.
use employees;

2. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. 
   Enter a comment with the number of records returned.
   
   SELECT *
   FROM employees
   WHERE first_name IN ('Irena', 'Vidya', 'Maya');
    - 709 Records


3. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, 
   but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?
   
   SELECT *
   FROM employees
   WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';
    - 709 Records

4. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. 
   Enter a comment with the number of records returned.

   SELECT *
   FROM employees
   WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya')
   AND gender = 'M';
    - 441 Records

5. Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees 
   whose last name starts with E.

   SELECT *
   FROM employees
   WHERE last_name LIKE 'E%';
    - 7330 Records

6. Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose 
   last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?
   SELECT *
   FROM employees
   WHERE last_name LIKE 'E%' OR last_name LIKE '%e';
    - 30723 Records

   SELECT *
   FROM employees
   WHERE last_name 
	   LIKE '%e'
	   AND last_name 
	   NOT LIKE 'E%'; 
   - 23393 Records

7. Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of 
   employees whose last name starts and ends with E. How many employees last names end with E, regardless of whether they start with E?
   SELECT *
   FROM employees
   WHERE last_name LIKE 'E%e';
    - 899 Records

   SELECT *
   FROM employees
   WHERE last_name 
	   LIKE '%e'; 
   - 24292 Records

8. Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
   SELECT *
   FROM employees
   WHERE hire_date LIKE '199%';
    - 135214 Records

9. Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
   SELECT *
   FROM employees
   WHERE birth_date LIKE '%12-25';
    - 842 Records

10. Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.
   SELECT *
   FROM employees
   WHERE hire_date LIKE '199%'
	AND birth_date LIKE '%12-25';
        - 362 Records

11. Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.
   SELECT *
   FROM employees
   WHERE last_name LIKE '%q%';
    - 1873 Records

12. Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?
   SELECT *
   FROM employees
   WHERE last_name 
      LIKE '%q%'
	   AND last_name 
      NOT LIKE '%qu%';
        - 547 Records