
-- SQL, set operations allow you to combine the results of two or more SELECT statements. The most common set operations are:

-- 1.UNION

-- 2.UNION ALL

-- 3.INTERSECT (Not supported in MySQL directly)

-- 4.EXCEPT or MINUS (Also not supported in MySQL directly)

/* ✅ Rules for Using Set Operations     
- To use set operations, the SELECTs must:
- Have the same number of columns.
- Have compatible data types in corresponding positions.*/

--  1. UNION
-- Combines results from two queries and removes duplicates.

-- Syntax:
/*SELECT column1, column2 FROM table1
UNION
SELECT column1, column2 FROM table2;*/

-- Countries in Europe or Asia
SELECT country_name FROM countries WHERE region_id = 1
UNION
SELECT country_name FROM countries WHERE region_id = 3;
    
-- Employees or managers (unique IDs)
SELECT employee_id FROM employees
UNION
SELECT manager_id FROM employees WHERE manager_id IS NOT NULL;

-- Locations in US or Canada
SELECT city FROM locations WHERE country_id = 'US'
UNION
SELECT city FROM locations WHERE country_id = 'CA';

-- UNION ALL (keeps duplicates)
-- Combines results from two queries and keeps duplicates.

-- Syntax:
/*SELECT column1, column2 FROM table1
UNION ALL
SELECT column1, column2 FROM table2;*/


-- 1. Employees from department 60 and 100 (duplicates allowed)
SELECT first_name FROM employees WHERE department_id = 60
UNION ALL
SELECT first_name FROM employees WHERE department_id = 100;

-- 2. All cities from US and Canada (with duplicates)
SELECT city FROM locations WHERE country_id = 'US'
UNION ALL
SELECT city FROM locations WHERE country_id = 'CA';

-- 3. Countries in regions 1 and 2
SELECT country_name FROM countries WHERE region_id = 1
UNION ALL
SELECT country_name FROM countries WHERE region_id = 2;

-- 4. Employee IDs and manager IDs (duplicates included)
SELECT employee_id FROM employees
UNION ALL
SELECT manager_id FROM employees WHERE manager_id IS NOT NULL;


-- INTERSECT (Not supported in MySQL — use INNER JOIN workaround)
-- Combines results from two queries and returns only the rows that are present in both.

-- EXCEPT / MINUS (Not supported in MySQL — use NOT IN or LEFT JOIN + NULL)
-- Combines results from two queries and returns only the rows from the first query that are not present in the second.
