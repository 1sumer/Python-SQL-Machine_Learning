<<<<<<< HEAD
-- 
SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary < ALL (SELECT 
            salary
        FROM
            employees
        WHERE
            department_id = 2)
ORDER BY salary DESC;

SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary = ALL (SELECT 
            MAX(salary)
        FROM
            employees
        WHERE
            department_id = 2);
            
SELECT 
    first_name, 
    last_name, 
    salary
FROM
    employees
WHERE
    salary = ANY (
        SELECT 
            AVG(salary)
        FROM
            employees
        GROUP BY 
            department_id)
ORDER BY 
    first_name, 
    last_name,
    salary;   
    
SELECT 
    first_name, 
    last_name, 
    salary
FROM
    employees
WHERE
    salary > ANY (SELECT 
            AVG(salary)
        FROM
            employees
        GROUP BY department_id)
ORDER BY 
    salary; 
=======
-- 
SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary < ALL (SELECT 
            salary
        FROM
            employees
        WHERE
            department_id = 2)
ORDER BY salary DESC;

SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary = ALL (SELECT 
            MAX(salary)
        FROM
            employees
        WHERE
            department_id = 2);
            
SELECT 
    first_name, 
    last_name, 
    salary
FROM
    employees
WHERE
    salary = ANY (
        SELECT 
            AVG(salary)
        FROM
            employees
        GROUP BY 
            department_id)
ORDER BY 
    first_name, 
    last_name,
    salary;   
    
SELECT 
    first_name, 
    last_name, 
    salary
FROM
    employees
WHERE
    salary > ANY (SELECT 
            AVG(salary)
        FROM
            employees
        GROUP BY department_id)
ORDER BY 
    salary; 
>>>>>>> 8c5b2c02a42c07e081ce66ee1e7cd955f96b8cf1
