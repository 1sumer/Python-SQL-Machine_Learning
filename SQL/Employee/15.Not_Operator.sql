-- Active: 1685713185905@@localhost@3306@employee
SELECT
	employee_id,
	first_name,
	last_name,
	department_id
FROM
	employees
WHERE
	department_id NOT IN (1, 2, 3)
ORDER BY
	first_name;
    
SELECT
	first_name,
	last_name
FROM
	employees
WHERE
	first_name NOT LIKE 'D%'
ORDER BY
	first_name;
    
SELECT
	employee_id,
	first_name,
	last_name,
	salary
FROM
	employees
WHERE
	salary NOT BETWEEN 3000 AND 5000
ORDER BY
	salary;
    
SELECT
	employee_id,
	first_name,
	last_name
FROM
	employees e
WHERE
	NOT EXISTS (
		SELECT
			employee_id
		FROM
			dependents d
		WHERE
			d.employee_id = e.employee_id);