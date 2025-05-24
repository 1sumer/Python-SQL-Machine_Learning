/*🧠 2. STORED PROCEDURE
📘 What is a Stored Procedure?
A stored procedure is a precompiled group of one or more SQL statements stored in the database. 
You can call it whenever needed — like a function or routine.

🔍 Why use it?

| Feature                  | Description                                           |
| ------------------------ | ----------------------------------------------------- |
| Precompiled              | Improves performance (compiled once, used many times) |
| Reusable                 | Write logic once, call many times                     |
| Accepts Parameters       | Can pass input/output values                          |
| Encapsulates Logic       | Abstracts business logic from application layer       |
| Reduces Code Duplication | Centralizes logic for maintainability                 |
| Supports Transaction     | Can commit or rollback within procedures              |

**Parameter Types**

| Type    | Use for        | Description                                |
| ------- | -------------- | ------------------------------------------ |
| `IN`    | Input only     | Pass values into the procedure             |
| `OUT`   | Output only    | Procedure sets a value to be returned      |
| `INOUT` | Input + output | Accepts a value and returns a modified one |


Syntax:
CREATE PROCEDURE procedure_name (IN dept_id INT)
BEGIN
  SELECT first_name, last_name, salary
  FROM employees
  WHERE department_id = dept_id;
END 
*/

-- Get all employees
DELIMITER //

CREATE PROCEDURE GetAllEmployees()
BEGIN
    SELECT * FROM employees;
END //

DELIMITER ;


-- Example: Procedure to give 10% raise to a department
DELIMITER //

CREATE PROCEDURE give_raise(IN dept INT)
BEGIN
  UPDATE employees
  SET salary = salary * 1.10
  WHERE department_id = dept;
END//

DELIMITER ;

call give_raise(9);

-- Get employees by department ID

DELIMITER //

CREATE PROCEDURE GetEmployeesByDepartment(IN dept_id INT)
BEGIN
    SELECT 
        employee_id, first_name, last_name, salary
    FROM 
        employees
    WHERE 
        department_id = dept_id;
END//

DELIMITER ;

SELECT * from employees
WHERE department_id = 9;


-- Show Employees Hired After a Specific Date
DELIMITER //

CREATE PROCEDURE ShowRecentHires(IN hire_after DATE)
BEGIN
   SELECT employee_id, first_name, hire_date
   FROM employees
   WHERE hire_date > hire_after;
END //

DELIMITER ;

CALL ShowRecentHires('2022-01-01');


-- OUT
-- n a stored procedure, an OUT parameter is used to return a value from the procedure to the caller

DELIMITER //

CREATE PROCEDURE CountEmployeesByDept(IN dept_id INT, OUT emp_count INT)
BEGIN
    SELECT COUNT(*) INTO emp_count
    FROM employees
    WHERE department_id = dept_id;
END //

DELIMITER ;

-- Define a variable to store the output
SET @total = 0;

-- Call the procedure and pass output variable
CALL GetEmployeeCountByDept(2, @total);

-- Show the result
SELECT @total AS employee_count_in_department;

-- Get Department Name by ID (IN + OUT)
DELIMITER //

CREATE PROCEDURE GetDeptName(IN dept_id INT, OUT dept_name VARCHAR(50))
BEGIN
   SELECT department_name INTO dept_name
   FROM departments
   WHERE department_id = dept_id;
END //

DELIMITER ;

CALL GetDeptName(3, @dname);
SELECT @dname;


/*
INOUT
- An INOUT parameter in a stored procedure serves a dual purpose:
- It accepts a value as input (like IN)
- It returns a (possibly modified) value back to the caller (like OUT)*/

DELIMITER //

CREATE PROCEDURE ApplyBonus(
    INOUT salary DECIMAL(8,2)
)
BEGIN
    SET salary = salary * 1.10;  -- Increase by 10%
END //

DELIMITER ;


-- Step 1: Declare a variable
SET @mysalary = 50000;

-- Step 2: Call the procedure
CALL ApplyBonus(@mysalary);

-- Step 3: See the updated value
SELECT @mysalary AS updated_salary;