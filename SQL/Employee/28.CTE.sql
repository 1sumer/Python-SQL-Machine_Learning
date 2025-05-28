-- Active: 1685713185905@@localhost@3306@employee
/*What is a Common Table Expression (CTE)?
A Common Table Expression (CTE) is a named temporary result set in a SQL query that can be referenced within the scope of a SELECT, INSERT, UPDATE, or DELETE statement.
CTEs make complex queries more readable and maintainable by allowing you to define a named temporary result set before using it in the main query.


**Why Use CTEs in SQL?**
CTEs simplify query writing and maintenance by:

- Breaking down complex queries into smaller, reusable components.
- Improving readability and modularity by separating the logic.
- Enabling recursive operations for hierarchical data.

**Advantages**
-- Readability: CTEs enhance the readability of complex queries by breaking them into modular, named components.

-- Reuse: You can reference the CTE multiple times in the same query, avoiding redundant code.

-- Recursive Queries: CTEs are commonly used for recursive queries, where a query refers to its own output.

-- Encapsulation: CTEs encapsulate logic, making it easier to understand and maintain.

**Benefits of Using CTEs in SQL**
- Improved Readability: CTEs help break down complex queries into modular, reusable components, improving code readability and maintainability.
- Reusability: Once defined, a CTE can be referenced multiple times within the same query, reducing the need for repetitive code.
- Simplifies Complex Queries: By using CTEs, especially recursive CTEs, complex operations like hierarchical data queries become much easier to manage.
- Query Optimization: SQL engines can optimize queries that use CTEs more efficiently, improving performance, 
                    especially when the same result set needs to be accessed multiple times.

**CTE vs Subqueries**
| **Feature**     | **CTE (Common Table Expression)**              | **Subquery**                                     |
|-----------------|------------------------------------------------|--------------------------------------------------|
| Reusability     | Can be referenced multiple times.              | Typically used once.                             |
| Readability     | Improves readability for complex queries.      | Can become difficult to read when nested.        |
| Performance     | Optimized for multiple references.             | May be less efficient for repeated operations.   |
*/


-- Syntax of CTE:
WITH CTE_Name (column1, column2, ...) AS (
    -- CTE query here
    SELECT column1, column2, ...
    FROM YourTable
    WHERE SomeCondition
)
-- Main query that references the CTE
SELECT * FROM CTE_Name;


WITH emp AS (
    SELECT First_Name, Last_Name, Salary
    FROM Employees
    WHERE Salary < 50000
)
SELECT *
FROM emp;

select * from employees;

WITH avg_salary_cte AS (
  SELECT AVG(salary) AS avg_salary FROM employees
)
SELECT first_name, salary
FROM employees, avg_salary_cte
WHERE employees.salary > avg_salary_cte.avg_salary;


-- Find departments with average salary > 60000
WITH dept_avg AS (
  SELECT department_id, AVG(salary) AS avg_sal
  FROM employees
  GROUP BY department_id
)
SELECT d.department_name, da.avg_sal
FROM departments d
JOIN dept_avg da ON d.department_id = da.department_id
WHERE da.avg_sal > 60000;


/*
Calculate average salary

Find employees with salary above average

Get their department names
*/
WITH avg_salary_cte AS (
    SELECT AVG(salary) AS avg_sal FROM employees
),
high_earners AS (
    SELECT employee_id, first_name, salary, department_id
    FROM employees, avg_salary_cte
    WHERE salary > avg_sal
),
dept_names AS (
    SELECT he.employee_id, he.first_name, he.salary, d.department_name
    FROM high_earners he
    JOIN departments d ON he.department_id = d.department_id
)
SELECT * FROM dept_names;

-- CTE with INSERT
WITH new_employees AS (
  SELECT 'John' AS first_name, 'Doe' AS last_name, 50000 AS salary
)
INSERT INTO employees (first_name, last_name, salary)
SELECT first_name, last_name, salary FROM new_employees;


--CTE with UPDATE
WITH sales_dept AS (
  SELECT employee_id, salary
  FROM employees
  WHERE department_id = 3
)
UPDATE employees
SET salary = salary * 1.10
WHERE employee_id IN (SELECT employee_id FROM sales_dept);


-- CTE with DELETE
WITH low_salary_employees AS (
  SELECT employee_id
  FROM employees
  WHERE salary < 30000
)
DELETE FROM employees
WHERE employee_id IN (SELECT employee_id FROM low_salary_employees);

/* Recursive CTE
A recursive CTE is very useful when dealing with hierarchical data, such as an employee-management structure where employees report to managers.*/

-- Let’s say you want to find all employees who report (directly or indirectly) to a specific manager (say, manager_id = 1) using the employees table.
-- Anchor member: The initial query that selects the base case (e.g., top-level managers).
-- Recursive member: The query that references the CTE itself, pulling the next level of data.

-- usage:-
-- Create sequence numbers dynamically.
-- Simulate calendar dates or hierarchical levels.
-- Perform iterations in SQL logic (e.g., reporting levels).

WITH RECURSIVE numbers AS (
    -- Anchor member: start with 1
    SELECT 1 AS n

    UNION ALL

    -- Recursive member: add 1 to the previous number
    SELECT n + 1
    FROM numbers
    WHERE n < 10
)
SELECT * FROM numbers;

WITH RECURSIVE emp_hierarchy AS (
    SELECT employee_id, manager_id, first_name FROM employees WHERE manager_id = 1
    UNION ALL
    SELECT e.employee_id, e.manager_id, e.first_name
    FROM employees e
    JOIN emp_hierarchy eh ON e.manager_id = eh.employee_id
)
SELECT * FROM emp_hierarchy;


-- Recursive CTE to get hierarchy under manager_id = 1
WITH RECURSIVE employee_hierarchy AS (
    -- Anchor member: start with the manager
    SELECT 
        employee_id,
        first_name,
        last_name,
        manager_id,
        1 AS level
    FROM employees
    WHERE manager_id = 1

    UNION ALL

    -- Recursive member: find employees who report to the previous level
    SELECT 
        e.employee_id,
        e.first_name,
        e.last_name,
        e.manager_id,
        eh.level + 1
    FROM employees e
    INNER JOIN employee_hierarchy eh ON e.manager_id = eh.employee_id
)
SELECT * FROM employee_hierarchy
ORDER BY level, employee_id;

-- Generate first N Fibonacci numbers using MySQL 8.0+
WITH RECURSIVE fibonacci (n, a, b) AS (
    SELECT 1, 0, 1  -- (n=1, a=0, b=1)
    UNION ALL
    SELECT n + 1, b, a + b
    FROM fibonacci
    WHERE n < 20  -- change 20 to generate more terms
)
SELECT a AS fibonacci_number FROM fibonacci;

-- The following pattern represents P(5):
WITH RECURSIVE numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM numbers WHERE n < 20
)
SELECT REPEAT('* ', n) AS pattern
FROM numbers;