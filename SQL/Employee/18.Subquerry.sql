-- Active: 1685713185905@@localhost@3306@employee

-- The query placed with in the parentheses is called a subquery. It is also known as an inner query or inner select. The query that contains the subquery is called an outer query or an outer select.

-- You can use a subquery in many places such as:

-- With the IN or NOT IN operator
-- With comparison operators
-- With the EXISTS or NOT EXISTS operator
-- With the ANY or ALL operator
-- In the FROM clause
-- In the SELECT clause

SELECT 
    employee_id, first_name, last_name
FROM
    employees
WHERE
    department_id IN (SELECT 
            department_id
        FROM
            departments
        WHERE
            location_id = 1700)
        ORDER BY first_name , last_name;

SELECT 
    employee_id, first_name, last_name
FROM
    employees
WHERE
    department_id NOT IN (SELECT 
            department_id
        FROM
            departments
        WHERE
            location_id = 1700)
        ORDER BY first_name , last_name;

-- FINDING SECOND HIGHEST SALARY IN EMPLOYEES
SELECT 
    employee_id, first_name, last_name, salary
FROM
    employees
WHERE
    salary = (SELECT 
            MAX(salary)
        FROM
            employees)
        ORDER BY first_name , last_name;

SELECT 
    employee_id, first_name, last_name, salary
FROM
    employees
WHERE
    salary > (SELECT 
            AVG(salary)
        FROM
            employees);

-- The EXISTS operator returns true if the subquery contains any rows. Otherwise, it returns false.
SELECT 
    department_name
FROM
    departments d
WHERE
    EXISTS ( SELECT 
            1
        FROM
            employees e
        WHERE
            salary > 10000
                AND e.department_id = d.department_id)
ORDER BY department_name; 

SELECT 
    department_name
FROM
    departments d
WHERE
    NOT EXISTS( SELECT 
            1
        FROM
            employees e
        WHERE
            salary > 10000
                AND e.department_id = d.department_id)
ORDER BY department_name;  

SELECT 
    employee_id, first_name, last_name, salary
FROM
    employees
WHERE
    salary >= ALL (SELECT 
            MIN(salary)
        FROM
            employees
        GROUP BY department_id)
ORDER BY first_name , last_name;

SELECT 
    employee_id, first_name, last_name, salary
FROM
    employees
WHERE
    salary >= SOME (SELECT 
            MAX(salary)
        FROM
            employees
        GROUP BY department_id);

SELECT 
    ROUND(AVG(average_salary), 0)
FROM
    (SELECT 
        AVG(salary) average_salary
    FROM
        employees
    GROUP BY department_id) department_salary;

   