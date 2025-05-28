-- Active: 1685713185905@@localhost@3306@employee

-- SQL alias allows you to assign a table or a column a temporary name during the execution of a query. SQL has two types of aliases: table and column aliases.

-- column_name AS alias_name

-- column_name alias_name

-- column_name AS 'Alias Name'

SELECT 
    first_name, 
    last_name, 
    salary * 1.1 AS new_salary
FROM
    employees;
    
SELECT 
    first_name, 
    last_name, 
    salary * 1.1 AS new_salary
FROM
    employees
WHERE new_salary > 5000;

SELECT 
    first_name, 
    last_name, 
    salary * 1.1 AS 'new_salary'
FROM
    employees
ORDER BY new_salary;

SELECT 
    employees.first_name, 
    employees.last_name
FROM
    employees;

SELECT 
    e.first_name, 
    e.last_name
FROM
    employees AS e;

