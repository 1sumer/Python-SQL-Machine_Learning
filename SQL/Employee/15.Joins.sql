-- Active: 1746006268448@@127.0.0.1@3306@employee

-- INNER JOIN

-- Returns rows when there is a match in both tables.

-- Suppose, you have two tables: A and B.

-- Table A has four rows: (1,2,3,4) and table B has four rows: (3,4,5,6)

-- When table A joins with table B using the inner join, you have the result set (3,4) that is the intersection of table A and table B.

SELECT *
FROM employees
INNER JOIN departments 
ON employees.department_id = departments.department_id;

-- Employees with their Departments
SELECT e.first_name, d.department_name
FROM Employees e
INNER JOIN Departments d ON e.department_id = d.department_id;

-- Employees with their Jobs
SELECT e.first_name, j.job_title
FROM employees e
INNER JOIN jobs j ON e.job_id = j.job_id;

-- Employees and Their Dependents
SELECT e.first_name, d.first_name AS dependent_name
FROM employees e
INNER JOIN dependents d ON e.employee_id = d.employee_id;

-- Countries and Their Regions
SELECT c.country_name, r.region_name
FROM countries c
INNER JOIN regions r ON c.region_id = r.region_id;

SELECT
	first_name,
	last_name,
	job_title,
	department_name
FROM
	employees e
INNER JOIN departments d ON d.department_id = e.department_id
INNER JOIN jobs j ON j.job_id = e.job_id
WHERE
	e.department_id IN (1, 2, 3);

-- RIGHT JOIN & LEFT JOIN
-- LEFT OUTER JOIN
-- Returns all rows from the left table, with matched rows from the right table. Nulls if no match.

--Retrieves all rows from the left table and the matched rows from the right table.

-- The left join, however, returns all rows from the left table whether or not there is a matching row in the right table.

-- Suppose we have two tables A and B. The table A has four rows 1, 2, 3 and 4. The table B also has four rows 3, 4, 5, 6.

-- When we join table A with table B, all the rows in table A (the left table) are included in the result set whether there is a matching row in the table B or not.


-- All Employees with or without Dependents
SELECT e.first_name, d.first_name AS dependent_name
FROM employees e
LEFT JOIN dependents d ON e.employee_id = d.employee_id;

-- Employees and Jobs (including unassigned job_id)
SELECT e.first_name, j.job_title
FROM employees e
LEFT JOIN jobs j ON e.job_id = j.job_id;

-- Locations and Departments
SELECT l.city, d.department_name
FROM locations l
LEFT JOIN departments d ON l.location_id = d.location_id;

-- Countries and Their Locations
SELECT c.country_name, l.city
FROM countries c
LEFT JOIN locations l ON c.country_id = l.country_id;

SELECT e.employee_id, e.first_name, e.last_name, m.employee_id AS manager_id, m.first_name AS manager_first_name, m.last_name AS manager_last_name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;

select * from locations;
SELECT
	country_name, location_id
FROM
	countries c
LEFT JOIN locations l 
ON l.country_id = c.country_id
WHERE
	l.location_id is null --is not null
ORDER BY
	country_name;

SELECT
	r.region_name,
	c.country_name,
	l.street_address,
	l.city
FROM
	regions r
LEFT JOIN countries c ON c.region_id = r.region_id
LEFT JOIN locations l ON l.country_id = c.country_id
WHERE
	c.country_id IN ('US', 'UK', 'CN');

SELECT
	country_name
FROM
	countries c
LEFT JOIN locations l ON l.country_id = c.country_id
WHERE
	l.location_id IS NULL
ORDER BY
	country_name;

SELECT *
FROM employees
LEFT JOIN departments 
ON employees.department_id = departments.department_id;



-- RIGHT OUTER JOIN
-- Returns all rows from the right table, with matched rows from the left table. Nulls if no match.

-- Dependents and Their Employees
SELECT e.first_name AS employee_name, d.first_name AS dependent_name
FROM employees e
RIGHT JOIN dependents d ON e.employee_id = d.employee_id;

-- Departments and Their Locations
SELECT d.department_name, l.city
FROM locations l
RIGHT JOIN departments d ON l.location_id = d.location_id;

-- Jobs and Assigned Employees
SELECT j.job_title, e.first_name
FROM jobs j
RIGHT JOIN employees e ON j.job_id = e.job_id;

-- Regions and Countries
SELECT r.region_name, c.country_name
FROM regions r
RIGHT JOIN countries c ON r.region_id = c.region_id;

-- Locations and Their Departments
SELECT l.city, d.department_name
FROM departments d
RIGHT JOIN locations l ON d.location_id = l.location_id;

-- FULL OUTER JOIN
-- Returns all rows from both tables; matches when possible, NULLs otherwise.
-- this error because MySQL does not support FULL OUTER JOIN directly.
--To perform a FULL OUTER JOIN in MySQL, you need to simulate it using a combination of LEFT JOIN and RIGHT JOIN with UNION.

SELECT d.department_name, e.first_name AS employee_name, d.department_id
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id

UNION

SELECT d.department_name, e.first_name AS employee_name, d.department_id
FROM employees e
LEFT JOIN departments d ON d.department_id = e.department_id

ORDER BY department_name;


-- Self JOin
-- Joins a table with itself, often used for hierarchy or relationships within same table.

-- We join a table to itself to evaluate the rows with other rows in the same table. To perform the self-join, we use either an inner join or left join clause.

-- Because the same table appears twice in a single query, we have to use the table aliases. The following statement illustrates how to join a table to itself.


-- Employees and Their Managers
SELECT e.first_name AS employee, m.first_name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

-- Employees at the Same Department
SELECT e1.first_name AS employee1, e2.first_name AS employee2, d.department_name
FROM employees e1
JOIN employees e2 ON e1.department_id = e2.department_id AND e1.employee_id < e2.employee_id
JOIN departments d ON e1.department_id = d.department_id;

-- Employees and Others with Same Job
SELECT e1.first_name AS employee1, e2.first_name AS employee2
FROM employees e1
JOIN employees e2 ON e1.job_id = e2.job_id AND e1.employee_id <> e2.employee_id;

-- Employees and Higher Paid Colleagues
SELECT e1.first_name AS employee, e2.first_name AS higher_paid_colleague
FROM employees e1
JOIN employees e2 ON e1.salary < e2.salary;


SELECT 
    e.first_name || ' ' || e.last_name AS employee,
    m.first_name || ' ' || m.last_name AS manager
FROM
    employees e
        INNER JOIN
    employees m ON m.employee_id = e.manager_id
ORDER BY manager;

SELECT 
    e.first_name || ' ' || e.last_name AS employee,
    m.first_name || ' ' || m.last_name AS manager
FROM
    employees e
        LEFT JOIN
    employees m ON m.employee_id = e.manager_id
ORDER BY manager;



-- Retrieve the employee names, their job titles, and the department_name they work in
SELECT e.first_name AS employee_name, j.job_title, d.department_name
FROM employees e
INNER JOIN jobs j ON e.job_id = j.job_id
INNER JOIN departments d ON e.department_id = d.department_id;

-- Find the names of employees along with their department names and manager names.
SELECT e.first_name AS employee_name, d.department_name, m.first_name AS manager_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
LEFT JOIN employees m ON e.manager_id = m.employee_id;

-- Get the names of employees and their dependents along with the employee’s job title.
SELECT e.first_name AS employee_name, d.first_name AS dependent_name, j.job_title
FROM employees e
INNER JOIN dependents d ON e.employee_id = d.employee_id
INNER JOIN jobs j ON e.job_id = j.job_id;



select * from employees e;

