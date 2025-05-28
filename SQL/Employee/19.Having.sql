-- Active: 1685713185905@@localhost@3306@employee

-- The HAVING clause is often used with the GROUP BY clause in the SELECT statement. If you use a HAVING clause without a GROUP BY clause, the HAVING clause behaves like the WHERE clause.
-- To specify a condition for groups, you use the HAVING clause.

--HAVING vs. WHERE
-- The WHERE clause applies the condition to individual rows before the rows are summarized into groups by the GROUP BY clause. 
--However, the HAVING clause applies the condition to the groups after the rows are grouped into groups.
-- Therefore, it is important to note that the HAVING clause is applied after whereas the WHERE clause is applied before the GROUP BY clause.

SELECT 
    department_id, SUM(salary)
FROM
    employees
GROUP BY department_id
HAVING SUM(salary) BETWEEN 20000 AND 30000
ORDER BY SUM(salary);

SELECT
	e.department_id,
	department_name,
	MIN(salary)
FROM
	employees e
INNER JOIN departments d ON d.department_id = e.department_id
GROUP BY
	e.department_id
HAVING
	MIN(salary) >= 10000
ORDER BY
	MIN(salary);

SELECT
	e.department_id,
	department_name,
	ROUND(AVG(salary), 2)
FROM
	employees e
INNER JOIN departments d ON d.department_id = e.department_id
GROUP BY
	e.department_id
HAVING
	AVG(salary) BETWEEN 5000
AND 7000
ORDER BY
	AVG(salary);