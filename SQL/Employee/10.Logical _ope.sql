-- Active: 1685713185905@@localhost@3306@employee

-- AND	Return true if both expressions are true
-- The AND operator allows you to construct multiple conditions in the WHERE clause of an SQL statement such as SELECT, UPDATE, and DELETE:

SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary > 5000 AND salary < 7000
ORDER BY salary;

SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary > 5000 AND salary < 7000
ORDER BY salary;

-- Similar to the AND operator, the OR operator combines multiple conditions in an SQL statement’s WHERE clause:

-- However, the OR operator returns true if a least one expression evaluates to true.
SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary = 7000 OR salary = 8000
ORDER BY salary;

-- The IS NULL operator compares a value with a null value and returns true if the compared value is null; otherwise, it returns false.
SELECT 
    first_name, last_name, phone_number
FROM
    employees
WHERE
    phone_number IS NULL
ORDER BY first_name , last_name;


-- The BETWEEN operator searches for values that are within a set of values, given the minimum value and maximum value. Note that the minimum and maximum values are included as part of the conditional set.

SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary BETWEEN 9000 AND 12000
ORDER BY salary;

-- The IN operator compares a value to a list of specified values. The IN operator returns true if the compared value matches at least one value in the list; otherwise, it returns false.
SELECT 
    first_name, last_name, department_id
FROM
    employees
WHERE
    department_id IN (8, 9)
ORDER BY department_id;

-- The LIKE operator compares a value to similar values using a wildcard operator. SQL provides two wildcards used in conjunction with the LIKE operator:

-- The percent sign ( %) represents zero, one, or multiple characters.
-- The underscore sign ( _) represents a single character.

SELECT 
    employee_id, first_name, last_name
FROM
    employees
WHERE
    first_name LIKE 'jo%'
ORDER BY first_name;

-- The ALL operator compares a value to all values in another value set. The ALL operator must be preceded by a comparison operator and followed by a subquery.

SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary >= ALL (SELECT 
            salary
        FROM
            employees
        WHERE
            department_id = 8)
ORDER BY salary DESC;

-- The ANY operator compares a value to any value in a set according to the condition as shown below:

-- Similar to the ALL operator, the ANY operator must be preceded by a comparison operator and followed by a subquery.

SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary > ANY (SELECT 
            AVG(salary)
        FROM
            employees
        GROUP BY department_id)
ORDER BY first_name , last_name; 

-- The EXISTS operator tests if a subquery contains any rows:

-- If the subquery returns one or more rows, the result of the EXISTS is true; otherwise, the result is false.
SELECT 
    first_name, last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            1
        FROM
            dependents d
        WHERE
            d.employee_id = e.employee_id);


SELECT
	first_name,
	last_name,
	hire_date
FROM
	employees
WHERE
	YEAR (hire_date) = 2000
OR YEAR (hire_date) = 1999
OR YEAR (hire_date) = 1990;    

SELECT
	employee_id,
	first_name,
	last_name,
	salary
FROM
	employees
WHERE
	department_id = 5
AND NOT salary > 5000
ORDER BY
	salary;

SELECT
	employee_id,
	first_name,
	last_name,
	department_id
FROM
	employees
WHERE
	department_id NOT IN (1, 2, 3)
ORDER BY
	first_name;
    
SELECT
	first_name,
	last_name
FROM
	employees
WHERE
	first_name NOT LIKE 'D%'
ORDER BY
	first_name;
    
SELECT
	employee_id,
	first_name,
	last_name,
	salary
FROM
	employees
WHERE
	salary NOT BETWEEN 3000 AND 5000
ORDER BY
	salary;
    

