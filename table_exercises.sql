## Notes on completing table exercises

## Using "employees" DB

## List all tables in the DB
    - show tables;
        - "current_dept_emp"
        - "departments"
        - "dept_emp"
        - "dept_emp_latest_date"
        - "dept_manager"
        - "employees"
        - "salaries"
        - "titles"

## What data types are present on the table?
    - describe employees;
        - int(11): integer up to 11 places
        - date: YYYY-MM-DD
        - varchar(14): variable character that could go up to 65,535 but is instead capped at 14
        - varchar(16): variable character that could go up to 65,535 but is instead capped at 16
            - for space / speed / DATA INTEGRITY both should have been set as character
        - enum('M','F'): Enumeration is a set list of possible string identifiers. In this case, two options were made available, but could use this data type for colors, floors in a hotel, etc
        - date: YYY-MM-DD

    - Which table(s) do you think contain numeric type column?
        - dept_int
        - dept_manager
        - employees
        - salaries
        - titles
        - ALL OF THESE USE EMPLOYEE ID NUMBERS

    - Which table(s) do you think contain a string type colum?
        - departments
        - dept_emp
        - dept_manager
        - employees
        - titles

    - Which table(s) do you think contain a date type column?
        - dept_emp
        - dept_manager
        - employees
        - salaries
        - titles

    - What is the relationship between the "employees" and the "departments" tables?
        - show create table dept_emp
            - Here we see that the primary key (`emp_no`,`dept_no`) are made from unique identifiers available on two separate databases
            - we need info from both `employees` and `departments` to act in concert to obtain actionable insite from `dept_emp`

    - Show the SQL that created the `dept_manager` table
        - show create table dept_manager;
        -CREATE TABLE `dept_manager` (
        `emp_no` int(11) NOT NULL,
        `dept_no` char(4) NOT NULL,
        `from_date` date NOT NULL,
        `to_date` date NOT NULL,
        PRIMARY KEY (`emp_no`,`dept_no`),
        KEY `dept_no` (`dept_no`),
        CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE,
        CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE
        ) ENGINE=InnoDB DEFAULT CHARSET=latin1
