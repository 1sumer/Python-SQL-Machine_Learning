<<<<<<< HEAD
-- Active: 1746006268448@@127.0.0.1@3306@employee
-- The CASE expression compares an expression to a set of expression (when_expression_1, when_expression_2, when_expression_3, …) using the equality operator (=). If you want to use other comparison operators such as greater than (>), less than (<), etc., you use the searched CASE expression.
-- The CASE statement returns the result_1, result_2, or result_3 if the expression matches the corresponding expression in the WHEN clause.
-- If the expression does not match any expression in the WHEN clause, it returns the esle_result in the ELSE clause. The ELSE clause is optional.
-- If you omit the ELSE clause and the expression does not match any expression in the WHEN clause, the CASE expression returns NULL.


select if(234>300, 'yes', 'no');

SELECT if (251=251 ,'Correct','wrong');

select if(STRCMP('sameer', 'sameer')=0, 'Correct','wrong');


select ifnull("hello", "sameer");

select ifnull(null,5);

SELECT 
    first_name,
    last_name,
    hire_date,
    CASE (2000 - YEAR(hire_date))
        WHEN 1 THEN '1 year'
        WHEN 3 THEN '3 years'
        WHEN 5 THEN '5 years'
        WHEN 10 THEN '10 years'
        WHEN 15 THEN '15 years'
        WHEN 20 THEN '20 years'
        WHEN 25 THEN '25 years'
        WHEN 30 THEN '30 years'
    END as aniversary
FROM
    employees
ORDER BY first_name;

SELECT 
    first_name,
    last_name,
    CASE
        WHEN salary < 3000 THEN 'Low'
        WHEN salary >= 3000 AND salary <= 5000 THEN 'Average'
        WHEN salary > 5000 THEN 'High'
    END as evaluation
FROM
    employees
  having evaluation = 'High';




--CASE in WHERE

SELECT * FROM employees
WHERE department_id = 
  CASE 
    WHEN YEAR(hire_date) < 2020 THEN 1
    ELSE 2
  END;


SELECT * FROM employees
WHERE 
  CASE 
    WHEN salary > 20000 THEN 1
    ELSE 0
  END = 1;


-- CASE in ORDER BY

SELECT first_name, department_id FROM employees
ORDER BY 
  CASE 
    WHEN department_id = 10 THEN 1
    WHEN department_id = 20 THEN 2
    ELSE 3
  END;

SELECT first_name, salary
FROM employees
ORDER BY 
  CASE 
    WHEN salary >= 20000 THEN 1
    WHEN salary BETWEEN 10000 AND 20000 THEN 2
    ELSE 3
  END;

-- CASE in GROUP BY
SELECT department_id, COUNT(*) AS emp_count
FROM employees
GROUP BY department_id
HAVING COUNT(*) >
  CASE 
    WHEN department_id = 10 THEN 5
    ELSE 2
  END;


SELECT first_name,
  CASE
    WHEN job_id IS NULL THEN 'Unassigned'
    ELSE 'Assigned'
  END AS job_status
FROM employees;

--Case With Update
UPDATE employees
SET salary = salary +
  CASE
    WHEN salary >= 20000 THEN salary * 0.10
    ELSE salary * 0.05
  END;

UPDATE employees
SET salary = 
  CASE 
    WHEN department_id = 1 THEN salary * 1.10
    WHEN department_id = 2 THEN salary * 1.05
    ELSE salary
  END;

--Case With Delete
DELETE FROM employees
WHERE employee_id IN (
  SELECT employee_id
  FROM employees
  WHERE department_id = 
    CASE 
      WHEN department_id = 10 THEN 1
      ELSE 2
    END
);


SELECT * FROM (
  SELECT 
    employee_id,
    salary,
    CASE 
      WHEN salary > 10000 THEN 'High'
      WHEN salary BETWEEN 4000 AND 7000 THEN 'Medium'
      ELSE 'Low'
    END AS salary_level
  FROM employees
) AS emp_with_level
WHERE salary_level = 'Medium';


=======
-- Active: 1746006268448@@127.0.0.1@3306@employee
-- The CASE expression compares an expression to a set of expression (when_expression_1, when_expression_2, when_expression_3, …) using the equality operator (=). If you want to use other comparison operators such as greater than (>), less than (<), etc., you use the searched CASE expression.
-- The CASE statement returns the result_1, result_2, or result_3 if the expression matches the corresponding expression in the WHEN clause.
-- If the expression does not match any expression in the WHEN clause, it returns the esle_result in the ELSE clause. The ELSE clause is optional.
-- If you omit the ELSE clause and the expression does not match any expression in the WHEN clause, the CASE expression returns NULL.


select if(234>300, 'yes', 'no');

SELECT if (251=251 ,'Correct','wrong');

select if(STRCMP('sameer', 'sameer')=0, 'Correct','wrong');


select ifnull("hello", "sameer");

select ifnull(null,5);

SELECT 
    first_name,
    last_name,
    hire_date,
    CASE (2000 - YEAR(hire_date))
        WHEN 1 THEN '1 year'
        WHEN 3 THEN '3 years'
        WHEN 5 THEN '5 years'
        WHEN 10 THEN '10 years'
        WHEN 15 THEN '15 years'
        WHEN 20 THEN '20 years'
        WHEN 25 THEN '25 years'
        WHEN 30 THEN '30 years'
    END as aniversary
FROM
    employees
ORDER BY first_name;

SELECT 
    first_name,
    last_name,
    CASE
        WHEN salary < 3000 THEN 'Low'
        WHEN salary >= 3000 AND salary <= 5000 THEN 'Average'
        WHEN salary > 5000 THEN 'High'
    END as evaluation
FROM
    employees
  having evaluation = 'High';




--CASE in WHERE

SELECT * FROM employees
WHERE department_id = 
  CASE 
    WHEN YEAR(hire_date) < 2020 THEN 1
    ELSE 2
  END;


SELECT * FROM employees
WHERE 
  CASE 
    WHEN salary > 20000 THEN 1
    ELSE 0
  END = 1;


-- CASE in ORDER BY

SELECT first_name, department_id FROM employees
ORDER BY 
  CASE 
    WHEN department_id = 10 THEN 1
    WHEN department_id = 20 THEN 2
    ELSE 3
  END;

SELECT first_name, salary
FROM employees
ORDER BY 
  CASE 
    WHEN salary >= 20000 THEN 1
    WHEN salary BETWEEN 10000 AND 20000 THEN 2
    ELSE 3
  END;

-- CASE in GROUP BY
SELECT department_id, COUNT(*) AS emp_count
FROM employees
GROUP BY department_id
HAVING COUNT(*) >
  CASE 
    WHEN department_id = 10 THEN 5
    ELSE 2
  END;


SELECT first_name,
  CASE
    WHEN job_id IS NULL THEN 'Unassigned'
    ELSE 'Assigned'
  END AS job_status
FROM employees;

--Case With Update
UPDATE employees
SET salary = salary +
  CASE
    WHEN salary >= 20000 THEN salary * 0.10
    ELSE salary * 0.05
  END;

UPDATE employees
SET salary = 
  CASE 
    WHEN department_id = 1 THEN salary * 1.10
    WHEN department_id = 2 THEN salary * 1.05
    ELSE salary
  END;

--Case With Delete
DELETE FROM employees
WHERE employee_id IN (
  SELECT employee_id
  FROM employees
  WHERE department_id = 
    CASE 
      WHEN department_id = 10 THEN 1
      ELSE 2
    END
);


SELECT * FROM (
  SELECT 
    employee_id,
    salary,
    CASE 
      WHEN salary > 10000 THEN 'High'
      WHEN salary BETWEEN 4000 AND 7000 THEN 'Medium'
      ELSE 'Low'
    END AS salary_level
  FROM employees
) AS emp_with_level
WHERE salary_level = 'Medium';


>>>>>>> 8c5b2c02a42c07e081ce66ee1e7cd955f96b8cf1
select * from employees;