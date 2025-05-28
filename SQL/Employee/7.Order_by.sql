
-- The ORDER BY is an optional clause of the SELECT statement. 
-- The ORDER BY clause allows you to sort the rows returned by the SELECT clause by one or more sort expressions in ascending or descending order.*/

-- In this syntax:

-- First, place the ORDER BY clause after the FROM clause. The database will evaluate the SELECT statement with the ORDER BY * clause in the following order: FROM > SELECT > ORDER BY.

-- Second, specify a sort expression after the ORDER BY clause. The sort expression specifies the sort criteria.

-- Third, use ASC option to sort the result set by the sort expression in ascending order and DESC to sort the result set by the sort expression in the descending order.

SELECT
	employee_id,
	first_name,
	last_name,
	hire_date,
	salary
FROM
	employees;
    
SELECT
	employee_id,
	first_name,
	last_name,
	hire_date,
	salary
FROM
	employees
ORDER BY
	first_name;
    
SELECT
	employee_id,
	first_name,
	last_name,
	hire_date,
	salary
FROM
	employees
ORDER BY
	first_name,
	last_name DESC;
    
SELECT
	employee_id,
	first_name,
	last_name,
	hire_date,
	salary
FROM
	employees
ORDER BY
	salary DESC;
    
SELECT
	employee_id,
	first_name,
	last_name,
	hire_date,
	salary
FROM
	employees
ORDER BY
	hire_date;
    
SELECT
	employee_id,
	first_name,
	last_name,
	hire_date,
	salary
FROM
	employees
ORDER BY
	hire_date DESC;

SELECT
	employee_id,
	first_name,
	last_name,
	salary
FROM
	employees
WHERE
	department_id = 5
ORDER BY
	salary;

SELECT
	employee_id,
	first_name,
	last_name,
	salary
FROM
	employees
WHERE
	department_id = 5
AND NOT salary > 5000
ORDER BY
	salary;