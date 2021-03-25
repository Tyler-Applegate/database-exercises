LIMIT Exercises

1. Create a new SQL script named limit_exercises.sql.


2. MySQL provides a way to return only unique results from our queries with the keyword DISTINCT. For example, to find all the 
   unique titles within the company, we could run the following query:

        SELECT DISTINCT title FROM titles;

   List the first 10 distinct last name sorted in descending order.

        SELECT DISTINCT last_name
        FROM employees
        ORDER BY last_name DESC
        LIMIT 10;
            - Zykh
            - Zyda
            - Zwicker
            - Zweizig
            - Zumaque
            - Zultner
            - Zucker
            - Zuberek
            - Zschoche
            - Zongker

3. Find all previous or current employees hired in the 90s and born on Christmas. Find the first 5 employees hired in the 90s 
   by sorting by hire date and limiting your results to the first 5 records. Write a comment in your code that lists the five names 
   of the employees returned.

        SELECT *
        FROM employees
        WHERE hire_date LIKE '199%'
	        AND birth_date LIKE '%12-25'
	        ORDER BY hire_date
	        LIMIT 5;
                - Alselm Cappello
                - Utz Mandell
                - Bouchung Schreiter
                - Baocai Kushner
                - Petter Stroustrup

4. Try to think of your results as batches, sets, or pages. The first five results are your first page. The five after that would be 
   your second page, etc. Update the query to find the tenth page of results.

    LIMIT and OFFSET can be used to create multiple pages of data. What is the relationship between OFFSET (number of results to skip), 
    LIMIT (number of results per page), and the page number?

        SELECT *
        FROM employees
        WHERE hire_date LIKE '199%'
	        AND birth_date LIKE '%12-25'
	        ORDER BY hire_date
	        LIMIT 5
	        OFFSET 45;
                - Pranay Narwekar
                - Marjo Farrow
                - Ennio Karcich
                - Dines Lubachevsky
                - Ipke Fontan

    ## LIMIT will only give you the first 'x' number of results. 
    ## OFFSET will skip the first 'x' number of results
    ## LIMIT 5, OFFSET 45 will group the results in sets of 5, but skip the first 45 individual results (9 pages) and return 
    the 46th-50th results (the 10th set of 5, on the 10th "page")