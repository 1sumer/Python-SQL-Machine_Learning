-- Active: 1685713185905@@localhost@3306@employee

-- To select specific rows from a table, you use a WHERE clause in the SELECT statement. The following illustrates the syntax of the WHERE clause in the SELECT statement:

-- The WHERE clause appears immediately after the FROM clause. The WHERE clause contains one or more logical expressions that evaluate each row in the table. 
    -- If a row that causes the condition evaluates to true, it will be included in the result set; otherwise, it will be excluded.

-- Note that SQL has three-valued logic which are TRUE, FALSE, and UNKNOWN. It means that if a row causes the condition to evaluate to FALSE or NULL, the row will not be returned.

-- Note that the logical expression that follows the WHERE clause is also known as a predicate. You can use various operators to form the row selection criteria used in the WHERE clause.

SELECT
	employee_id,
	first_name,
	last_name,
	salary
FROM
	employees
WHERE
	salary > 14000
ORDER BY
	salary DESC;

SELECT
	employee_id,
	first_name,
	last_name,
	department_id
FROM
	employees
WHERE
	department_id = 5
ORDER BY
	first_name;

SELECT
	employee_id,
	first_name,
	last_name,
	hire_date
FROM
	employees
WHERE
	hire_date >= '1999-01-01'
ORDER BY
	hire_date DESC;

SELECT
	employee_id,
	first_name,
	last_name,
	hire_date
FROM
	employees
WHERE
	YEAR (hire_date) = 1999
ORDER BY
	hire_date DESC;