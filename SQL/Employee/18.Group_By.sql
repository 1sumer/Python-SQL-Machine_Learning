-- The GROUP BY is an optional clause of the SELECT statement. The GROUP BY clause allows you to group rows based on values of one or more columns. It returns one row for each group.
--The GROUP BY clause will be more useful when you use it with an aggregate function.

SELECT 
    department_id
FROM 
    employees
GROUP BY 
    department_id;
    
SELECT 
   DISTINCT department_id
FROM 
   employees
ORDER BY 
   department_id;
   
SELECT
	department_id,
	COUNT(employee_id) headcount
FROM
	employees
GROUP BY
	department_id;
    
SELECT
	department_name,
	COUNT(employee_id) headcount
FROM
	employees e
INNER JOIN departments d ON d.department_id = e.department_id
GROUP BY
        department_name;

SELECT 
    department_name,
    COUNT(employee_id) headcount
FROM
employees e
INNER JOIN
departments d ON d.department_id = e.department_id
GROUP BY department_name
ORDER BY headcount DESC;