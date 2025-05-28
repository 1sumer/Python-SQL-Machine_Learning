<<<<<<< HEAD
-- Active: 1746006268448@@127.0.0.1@3306@employee

/*What is a Subquery?
A subquery is a query nested inside another SQL query. It is used to return data that will be used by the main (outer) query.

It can appear in:
- SELECT clause
- FROM clause
- WHERE clause
- HAVING clause

Types of Subqueries

| **Type**                    | **Description**                                   | **Returns**         |
| --------------------------- | ------------------------------------------------- | ------------------- |
| **Scalar Subquery**         | Returns a single value                            | One row, one column |
| **Row Subquery**            | Returns a single row of values                    | One row, many cols  |
| **Table Subquery**          | Returns multiple rows and columns                 | A result set        |
| **Correlated Subquery**     | Depends on outer query row (evaluated row-by-row) | Varies              |
| **Non-Correlated Subquery** | Independent of outer query                        | Varies              |

Operators Common with Subqueries

| **Operator**  | **Use Case**                                  |
| ------------- | --------------------------------------------- |
| `IN` `Not IN` | Check if value exists in subquery result      |
| `=`, `>`, `<` | Scalar comparisons with subquery              |
| `ANY`, `ALL`  | Compare value with all or any subquery values |
| `EXISTS`      | Check if subquery returns any rows            |
*/

-- FINDING SECOND HIGHEST SALARY IN EMPLOYEES
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
  SELECT MAX(salary) FROM employees
);

-- Employees with salary higher than department 10's average
SELECT first_name, salary
FROM employees
WHERE salary > (
  SELECT AVG(salary)
  FROM employees
  WHERE department_id = 10
);

-- List employees with their department name:
SELECT 
  e.first_name,
  e.department_id,
  (SELECT department_name 
   FROM departments d 
   WHERE d.department_id = e.department_id) AS dept_name
FROM employees e;

-- Get departments and average salary of employees in each:
SELECT department_id, avg_salary
FROM (
  SELECT department_id, AVG(salary) AS avg_salary
  FROM employees
  GROUP BY department_id
) AS dept_avg;


select * from (SELECT 
    employee_id,
    salary,
    CASE 
      WHEN salary > 10000 THEN 'High'
      WHEN salary BETWEEN 4000 AND 7000 THEN 'Medium'
      ELSE 'Low'
    END AS salary_level
  FROM employees) as emp_level
  where salary_level = 'Medium';

-- FINDING EMPLOYEES IN DEPARTMENTS LOCATED IN LOCATION_ID 1700
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

-- FINDING EMPLOYEES NOT IN DEPARTMENTS LOCATED IN LOCATION_ID 1700
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


-- FINDING EMPLOYEES WITH SALARY GREATER THAN AVERAGE SALARY
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
-- Find all departments that have employees with a salary greater than 10000.
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

-- The NOT EXISTS operator returns true if the subquery does not return any rows. Otherwise, it returns false.
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

-- FINDING EMPLOYEES WITH SALARY GREATER THAN MINIMUM SALARY IN EACH DEPARTMENT
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

-- FINDING EMPLOYEES WITH SALARY GREATER THAN SOME MINIMUM SALARY IN EACH DEPARTMENT
SELECT 
    employee_id, first_name, last_name, salary
FROM
    employees
WHERE
    salary >= SOME (SELECT 
            MAX(salary)
        FROM
            employees
=======
-- Active: 1746006268448@@127.0.0.1@3306@employee

/*What is a Subquery?
A subquery is a query nested inside another SQL query. It is used to return data that will be used by the main (outer) query.

It can appear in:
- SELECT clause
- FROM clause
- WHERE clause
- HAVING clause

Types of Subqueries

| **Type**                    | **Description**                                   | **Returns**         |
| --------------------------- | ------------------------------------------------- | ------------------- |
| **Scalar Subquery**         | Returns a single value                            | One row, one column |
| **Row Subquery**            | Returns a single row of values                    | One row, many cols  |
| **Table Subquery**          | Returns multiple rows and columns                 | A result set        |
| **Correlated Subquery**     | Depends on outer query row (evaluated row-by-row) | Varies              |
| **Non-Correlated Subquery** | Independent of outer query                        | Varies              |

Operators Common with Subqueries

| **Operator**  | **Use Case**                                  |
| ------------- | --------------------------------------------- |
| `IN` `Not IN` | Check if value exists in subquery result      |
| `=`, `>`, `<` | Scalar comparisons with subquery              |
| `ANY`, `ALL`  | Compare value with all or any subquery values |
| `EXISTS`      | Check if subquery returns any rows            |
*/

-- FINDING SECOND HIGHEST SALARY IN EMPLOYEES
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
  SELECT MAX(salary) FROM employees
);

-- Employees with salary higher than department 10's average
SELECT first_name, salary
FROM employees
WHERE salary > (
  SELECT AVG(salary)
  FROM employees
  WHERE department_id = 10
);

-- List employees with their department name:
SELECT 
  e.first_name,
  e.department_id,
  (SELECT department_name 
   FROM departments d 
   WHERE d.department_id = e.department_id) AS dept_name
FROM employees e;

-- Get departments and average salary of employees in each:
SELECT department_id, avg_salary
FROM (
  SELECT department_id, AVG(salary) AS avg_salary
  FROM employees
  GROUP BY department_id
) AS dept_avg;


select * from (SELECT 
    employee_id,
    salary,
    CASE 
      WHEN salary > 10000 THEN 'High'
      WHEN salary BETWEEN 4000 AND 7000 THEN 'Medium'
      ELSE 'Low'
    END AS salary_level
  FROM employees) as emp_level
  where salary_level = 'Medium';

-- FINDING EMPLOYEES IN DEPARTMENTS LOCATED IN LOCATION_ID 1700
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

-- FINDING EMPLOYEES NOT IN DEPARTMENTS LOCATED IN LOCATION_ID 1700
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


-- FINDING EMPLOYEES WITH SALARY GREATER THAN AVERAGE SALARY
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
-- Find all departments that have employees with a salary greater than 10000.
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

-- The NOT EXISTS operator returns true if the subquery does not return any rows. Otherwise, it returns false.
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

-- FINDING EMPLOYEES WITH SALARY GREATER THAN MINIMUM SALARY IN EACH DEPARTMENT
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

-- FINDING EMPLOYEES WITH SALARY GREATER THAN SOME MINIMUM SALARY IN EACH DEPARTMENT
SELECT 
    employee_id, first_name, last_name, salary
FROM
    employees
WHERE
    salary >= SOME (SELECT 
            MAX(salary)
        FROM
            employees
>>>>>>> 8c5b2c02a42c07e081ce66ee1e7cd955f96b8cf1
        GROUP BY department_id);