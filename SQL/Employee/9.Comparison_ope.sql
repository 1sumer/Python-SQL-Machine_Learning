-- Active: 1746006268448@@127.0.0.1@3306@employee

SELECT 
    employee_id, first_name, last_name
FROM
    employees
WHERE
    last_name = 'Himuro'; 

SELECT 
    employee_id, first_name, last_name, phone_number
FROM
    employees
WHERE
    phone_number = NULL;

SELECT 
    employee_id, first_name, last_name, phone_number
FROM
    employees
WHERE
    phone_number IS NULL;

SELECT 
    employee_id, first_name, last_name, department_id
FROM
    employees
WHERE
    department_id <> 8
ORDER BY first_name , last_name;

SELECT 
    employee_id, first_name, last_name, department_id
FROM
    employees
WHERE
    department_id <> 8
        AND department_id <> 10
ORDER BY first_name , last_name; 

SELECT 
    employee_id, first_name, last_name, salary
FROM
    employees
WHERE
    salary > 10000
ORDER BY salary DESC;

SELECT 
    employee_id, first_name, last_name, salary
FROM
    employees
WHERE
    salary > 10000 AND department_id = 8
ORDER BY salary DESC;

SELECT 
    employee_id, first_name, last_name, salary
FROM
    employees
WHERE
    salary >= 9000
ORDER BY salary;

SELECT
	employee_id,
	first_name,
	last_name,
	salary
FROM
	employees
WHERE
	salary > 14000
ORDER BY
	salary DESC;
    
SELECT
	employee_id,
	first_name,
	last_name,
	department_id
FROM
	employees
WHERE
	department_id = 5
ORDER BY
	first_name;
    
SELECT
	employee_id,
	first_name,
	last_name
FROM
	employees
WHERE
	last_name = 'Chen';
    
SELECT
	employee_id,
	first_name,
	last_name,
	hire_date
FROM
	employees
WHERE
	hire_date >= '1999-01-01'
ORDER BY
	hire_date DESC;
    
SELECT
	employee_id,
	first_name,
	last_name,
	hire_date
FROM
	employees
WHERE
	YEAR (hire_date) = 1999
ORDER BY
	hire_date DESC;