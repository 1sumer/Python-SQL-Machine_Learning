-- Active: 1685713185905@@localhost@3306@employee
-- What is a Common Table Expression (CTE)?
--A Common Table Expression (CTE) is a named temporary result set in a SQL query that can be referenced within the scope of a SELECT, INSERT, UPDATE, or DELETE statement.
 /*CTEs make complex queries more readable and maintainable by allowing you to define a named temporary result set before using it in the main query.*/


-- Syntax of CTE:
WITH CTE_Name (column1, column2, ...) AS (
    -- CTE query here
    SELECT column1, column2, ...
    FROM YourTable
    WHERE SomeCondition
)
-- Main query that references the CTE
SELECT * FROM CTE_Name;

-- CTE_Name: This is the name you give to your Common Table Expression. It acts as a temporary table that you can reference in the subsequent query.
-- (column1, column2, ...): If your CTE involves selecting specific columns, you can list them after the CTE name. This is optional; if omitted, the CTE will inherit the column names from the result of the inner query.
-- AS: This keyword is used to define the start of the CTE's SELECT statement.
-- (SELECT column1, column2, ... FROM YourTable WHERE SomeCondition): This is the actual query that defines the CTE. It can be as complex or as simple as needed.

-- Example

WITH emp AS (
    SELECT First_Name, Last_Name, Salary
    FROM Employees
    WHERE Salary < 50000
)
SELECT *
FROM emp;

select * from employees;

-- Advantages
-- Readability: CTEs enhance the readability of complex queries by breaking them into modular, named components.

-- Reuse: You can reference the CTE multiple times in the same query, avoiding redundant code.

-- Recursive Queries: CTEs are commonly used for recursive queries, where a query refers to its own output.

-- Encapsulation: CTEs encapsulate logic, making it easier to understand and maintain.
