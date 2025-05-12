-- Active: 1685713185905@@localhost@3306@employee

-- The IN is a logical operator in SQL. The IN operator returns true if a value is in a set of values or false otherwise.

-- Technically, you can substitute the IN operator with the = and OR operators The condition that uses the IN operator can be rewritten using one or more OR operators as follows:

-- To negate the IN operator, you use the NOT operator:
SELECT
	employee_id,
	first_name,
	last_name,
	job_id
FROM
	employees
WHERE
	job_id IN (8, 9, 10)
ORDER BY
	job_id;
    
SELECT
	employee_id,
	first_name,
	last_name,
	department_id
FROM
	employees
WHERE
	department_id IN (2, 8);
    
SELECT
	employee_id,
	first_name,
	last_name,
	job_id
FROM
	employees
WHERE
	job_id NOT IN (7, 8, 9)
ORDER BY
	job_id;

SELECT 
    employee_id, first_name, last_name, salary
FROM
    employees
WHERE
    department_id IN (SELECT 
            department_id
        FROM
            departments
        WHERE
            department_name = 'Marketing'
                OR department_name = 'Sales')


