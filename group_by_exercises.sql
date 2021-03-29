group_by_exercises

1.  Create a new file named group_by_exercises.sql

2.  In your script, use DISTINCT to find the unique titles in the titles table. 
    How many unique titles have there ever been? Answer that in a comment in your SQL file.

    SELECT DISTINCT title
    FROM titles;
        -- 7 Records

3.  Write a query to to find a list of all unique last names of all employees that start and 
    end with 'E' using GROUP BY.

    SELECT last_name
    FROM employees
    WHERE last_name LIKE 'E%e'
    GROUP BY last_name;

        -- 5 Records

4.  Write a query to to find all unique combinations of first and last names of all employees whose 
    last names start and end with 'E'.

    SELECT first_name, last_name
    FROM employees
    WHERE last_name LIKE 'E%e'
    GROUP BY first_name, last_name;

        -- 846 Records

5.  Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a 
    comment in your sql code.

    SELECT last_name
    FROM employees
    WHERE last_name LIKE '%q%' 
    AND last_name NOT LIKE '%qu%'
    GROUP BY last_name;

        -- 3 Records
        -- Chleq
        -- Lindqvist
        -- Qiwen       

6.  Add a COUNT() to your results (the query above) and use ORDER BY to make it easier to find 
    employees whose unusual name is shared with others.

    SELECT last_name, COUNT(last_name)
    FROM employees
    WHERE last_name LIKE '%q%' 
    AND last_name NOT LIKE '%qu%'
    GROUP BY last_name
    ORDER BY count(last_name) DESC;

        -- 3 Records
        -- Lindqvist	190
        -- Chleq	    189
        -- Qiwen	    168

7.  Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY 
    to find the number of employees for each gender with those names.

    SELECT first_name, gender, COUNT(*)
    FROM employees
    WHERE first_name IN ('Irena', 'Vidya', 'Maya')
    GROUP BY first_name, gender
    ORDER BY count(*) DESC;

        -- 6 Records
        -- Vidya	M	151
        -- Maya	    M	146
        -- Irena	M	144
        -- Irena	F	97
        -- Maya	    F	90
        -- Vidya	F	81

8.  Using your query that generates a username for all of the employees, generate a count employees 
    for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames 
    are there?

    SELECT LOWER(
    CONCAT(
    SUBSTR(first_name, 1, 1),
    SUBSTR(last_name, 1, 4),
    '_',
    SUBSTR(birth_date, 6, 2),
    SUBSTR(birth_date, 3, 2)))
    AS username, COUNT(*)
    FROM employees
    GROUP BY username
    HAVING COUNT(username)>1
    ORDER BY COUNT(username) DESC;

    -- 13251 Records (Which is almost as many as Manu Ginobili has)
      