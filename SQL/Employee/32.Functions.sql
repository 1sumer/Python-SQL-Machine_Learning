/* FUNCTION
📘 What is a SQL Function?
A function in SQL is a block of code that takes input, processes it, and returns a single value. 
Unlike stored procedures, functions must return a value, and they can be used inside SQL statements (e.g., in SELECT, WHERE, etc.).

🔍 Why use it?

| Type                             | Description                       | Examples                              |
| -------------------------------- | --------------------------------- | ------------------------------------- |
| **System Functions**             | Built-in by SQL engine            | `LEN()`, `GETDATE()`, `NOW()`         |
| **Aggregate Functions**          | Operate on sets of rows           | `SUM()`, `AVG()`, `COUNT()`           |
| **Scalar Functions**             | Operate on a single value         | `UPPER()`, `LOWER()`, `ROUND()`       |
| **User-Defined Functions (UDF)** | Custom functions created by users | You define it using `CREATE FUNCTION` |

Difference: Function vs Stored Procedure:

| Feature                     | Function              | Stored Procedure              |
| --------------------------- | --------------------- | ----------------------------- |
| Returns                     | Must return 1 value   | May return zero, one, or many |
| Use in SELECT               | Yes                   | No                            |
| Can use DML (INSERT/UPDATE) | No (usually)          | Yes                           |
| Call with `SELECT`          | Yes                   | No (`CALL` only)              |
| Input/Output                | Only input parameters | IN, OUT, INOUT                |


Syntax:
DELIMITER //

CREATE FUNCTION function_name(param_name TYPE, ...)
RETURNS return_type
DETERMINISTIC
BEGIN
   -- Logic
   RETURN value;
END //

DELIMITER ;

DETERMINISTIC means the function will return the same output for the same input (required if binary logging is enabled

*/

--  Simple Function to Add Two Numbers
DELIMITER //

CREATE FUNCTION AddNumbers(a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN
   RETURN a + b;
END //

DELIMITER ;

SELECT AddNumbers(10, 20) AS result;  -- Output: 30


-- Example: Create a function to calculate the square of a number
DELIMITER //

CREATE FUNCTION calculate_square(num INT)
RETURNS INT
DETERMINISTIC
BEGIN
  RETURN num * num;
END //

DELIMITER ;

select calculate_square(5); 

--  Get Employee Full Name

DELIMITER //

CREATE FUNCTION GetFullName(first VARCHAR(50), last VARCHAR(50))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
   RETURN CONCAT(first, ' ', last);
END //

DELIMITER ;

SELECT GetFullName(first_name, last_name) AS full_name FROM employees;

-- Job Grade Based on Salary
DELIMITER //

CREATE FUNCTION GetJobGrade(salary DECIMAL(10,2))
RETURNS CHAR(1)
DETERMINISTIC
BEGIN
   DECLARE grade CHAR(1);
   IF salary >= 100000 THEN
       SET grade = 'A';
   ELSEIF salary >= 70000 THEN
       SET grade = 'B';
   ELSEIF salary >= 50000 THEN
       SET grade = 'C';
   ELSE
       SET grade = 'D';
   END IF;
   RETURN grade;
END //

DELIMITER ;

SELECT first_name, salary, GetJobGrade(salary) AS grade
FROM employees;

