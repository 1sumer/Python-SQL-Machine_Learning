
-- The BETWEEN operator is one of the logical operators in SQL. The BETWEEN operator checks if a value is within a range of values.

-- The BETWEEN operator returns true if the expression is greater than or equal to ( >=) the low value and less than or equal to ( <=) the high value.

-- Technically, the BETWEEN is the equivalent to the following expression that uses the greater than or equal to (>=) and less than or equal to (<=) operators:
SELECT 
    employee_id, 
    first_name, 
    last_name, 
    salary
FROM
    employees
WHERE
    salary BETWEEN 2500 AND 2900
ORDER BY 
	salary DESC;

SELECT 
    employee_id, 
    first_name, 
    last_name, 
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN '1999-01-01' AND '2000-12-31'
ORDER BY 
	hire_date;

-- To negate the result of the BETWEEN operator, you use the NOT operator:

-- The NOT BETWEEN returns true if the expression is less than low or greater than (>) high; otherwise, it returns false.

-- Like the BETWEEN operator, you can rewrite the NOT BETWEEN operator using the less than (<) and greater than (>) operators with the OR operator as follows:
SELECT 
    employee_id, 
    first_name, 
    last_name, 
    salary
FROM
    employees
WHERE
    salary NOT BETWEEN 2500 AND 2900
ORDER BY salary DESC;

SELECT 
    employee_id, 
    first_name, 
    last_name, 
    hire_date
FROM
    employees
WHERE
    hire_date NOT BETWEEN '1989-01-01' AND '1992-12-31'
ORDER BY 
	hire_date;