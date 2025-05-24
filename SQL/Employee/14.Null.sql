-- NULL is special in SQL. NULL indicates that the data is unknown, inapplicable, or even does not exist. In other words,

-- NULL represents the missing data in the database.

-- The NULL is special because any comparisons with a NULL can never result in true or false, but in a third logical result, unknown.

-- To determine whether an expression or column is NULL or not, you use the IS NULL operator as follows:


SELECT
	employee_id,
	first_name,
	last_name,
	phone_number
FROM
	employees
WHERE
	phone_number IS NULL;
    
SELECT
	employee_id,
	first_name,
	last_name,
	phone_number
FROM
	employees
WHERE
	phone_number IS NOT NULL;
    
