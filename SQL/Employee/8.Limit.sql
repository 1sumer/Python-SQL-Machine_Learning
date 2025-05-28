-- Active: 1685713185905@@localhost@3306@employee

-- To limit the number of rows returned by a select statement, you use the LIMIT and OFFSET clauses.

-- In this syntax:

    --The LIMIT row_count determines the number of rows (row_count) returned by the query.

    --The OFFSET offset clause skips the offset rows before beginning to return the rows.

-- The OFFSET clause is optional. If you omit it, the query will return the row_count rows from the first row returned by the SELECT clause.

-- When you use the LIMIT clause, it is important to use an ORDER BY clause to ensure the order of rows in the result set.

-- Not all database systems support the LIMIT clause.


SELECT * FROM employees
ORDER BY employee_id
LIMIT 5;

-- Show Top 3 Highest-Paid Employees
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;


-- List 5 Employees Hired After the 10 Most Recently Hired
SELECT employee_id, first_name, hire_date
FROM employees
ORDER BY hire_date DESC
LIMIT 5 OFFSET 10;

-- Display Department Heads (Managers) – Paginated
SELECT DISTINCT e.manager_id, m.first_name, m.last_name
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
LIMIT 3 OFFSET 0;

SELECT 
    employee_id, 
    first_name, 
    last_name
FROM
    employees
ORDER BY 
	first_name;
    
SELECT 
    employee_id, 
    first_name, 
    last_name
FROM
    employees
ORDER BY 
	first_name
LIMIT 5;    

-- The following example uses both LIMIT & OFFSET clauses to return five rows starting from the 4th row:
SELECT 
    employee_id, first_name, last_name
FROM
    employees
ORDER BY first_name
LIMIT 5 OFFSET 3;

SELECT 
    employee_id, 
    first_name, 
    last_name
FROM
    employees
ORDER BY 
	first_name
LIMIT 3 , 5;

SELECT 
    employee_id, 
    first_name, 
    last_name, 
    salary
FROM
    employees
ORDER BY 
	salary DESC
LIMIT 5;

SELECT 
    employee_id, 
    first_name, 
    last_name, 
    salary
FROM
    employees
ORDER BY 
	salary DESC
LIMIT 1 OFFSET 1;

SELECT DISTINCT
    salary
FROM
    employees
ORDER BY salary DESC
LIMIT 1 , 1;

SELECT 
    employee_id, first_name, last_name, salary
FROM
    employees
WHERE
    salary = (SELECT DISTINCT
            salary
        FROM
            employees
        ORDER BY salary DESC
        LIMIT 1 , 1);