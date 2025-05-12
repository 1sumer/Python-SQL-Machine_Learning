-- Active: 1746006268448@@127.0.0.1@3306@employee

SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
  SELECT MAX(salary) FROM employees
);

select salary 
from (
    select salary, dense_rank() over (order by salary desc) as rnk
        from employees
    ) ranked
where rnk = 2;

-- 1. List all regions with their IDs and names.
SELECT region_id, region_name 
FROM regions;

-- 2. Show all countries located in the 'Americas' region.
SELECT c.country_id, c.country_name 
FROM countries c
JOIN regions r ON c.region_id = r.region_id
WHERE r.region_name = 'Americas';

-- 3. Display all employees with their first name, last name, and hire date, sorted by hire date in ascending order.
SELECT first_name, last_name, hire_date 
FROM employees
ORDER BY hire_date ASC;

-- 4. Find all departments located in the city 'Seattle'
SELECT d.department_id, d.department_name
FROM departments d
JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'Seattle';

-- 5. Count how many employees work in each department (show department name and count).
SELECT d.department_name, COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY employee_count DESC;

-- 6. List all employees who earn more than their manager, showing employee name, salary, and manager's salary.
SELECT e.first_name, e.last_name, e.salary AS employee_salary, 
       m.salary AS manager_salary
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;

-- 7. Find all dependents who are children of employees in the 'IT' department.
SELECT d.first_name, d.last_name, d.relationship
FROM dependents d
JOIN employees e ON d.employee_id = e.employee_id
JOIN departments dept ON e.department_id = dept.department_id
WHERE dept.department_name = 'IT' AND d.relationship = 'Child';

-- 8. Show the average salary for each job title, rounded to 2 decimal places.
SELECT j.job_title, ROUND(AVG(e.salary), 2) AS avg_salary
FROM jobs j
JOIN employees e ON j.job_id = e.job_id
GROUP BY j.job_title
ORDER BY avg_salary DESC;

-- 9. List all locations that don't have a postal code in the database.
SELECT location_id, street_address, city, state_province, country_id
FROM locations
WHERE postal_code IS NULL;

-- 11. Find departments where the average salary is higher than the company-wide average salary.
WITH DeptAverages AS (
    SELECT 
        d.department_name,
        AVG(e.salary) AS dept_avg_salary
    FROM departments d
    JOIN employees e ON d.department_id = e.department_id
    GROUP BY d.department_name
),
CompanyAverage AS (
    SELECT AVG(salary) AS company_avg FROM employees
)
SELECT d.department_name, d.dept_avg_salary, c.company_avg
FROM DeptAverages d, CompanyAverage c
WHERE d.dept_avg_salary > c.company_avg
ORDER BY d.dept_avg_salary DESC;

-- 12. List all employees who have the same job as their manager.
SELECT e.first_name, e.last_name, j.job_title
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
JOIN jobs j ON e.job_id = j.job_id
WHERE e.job_id = m.job_id;

-- 13. Calculate the salary difference between each employee and the average salary of their department.
WITH DeptAvgSalaries AS (
    SELECT 
        department_id, 
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT 
    e.first_name, e.last_name, e.salary,
    d.department_name,
    das.avg_salary AS department_avg,
    e.salary - das.avg_salary AS difference_from_avg
FROM employees e
JOIN DeptAvgSalaries das ON e.department_id = das.department_id
JOIN departments d ON e.department_id = d.department_id
ORDER BY difference_from_avg DESC;

-- 14. Show all employees with their department name, job title, and location city.
SELECT 
    e.first_name, e.last_name,
    d.department_name,
    j.job_title,
    l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN jobs j ON e.job_id = j.job_id
JOIN locations l ON d.location_id = l.location_id
ORDER BY e.last_name, e.first_name;

-- 15. Find all dependents with their employee's name, department, and job title.
SELECT 
    d.first_name AS dependent_first_name,
    d.last_name AS dependent_last_name,
    d.relationship,
    e.first_name AS employee_first_name,
    e.last_name AS employee_last_name,
    dept.department_name,
    j.job_title
FROM dependents d
JOIN employees e ON d.employee_id = e.employee_id
JOIN departments dept ON e.department_id = dept.department_id
JOIN jobs j ON e.job_id = j.job_id
ORDER BY d.last_name, d.first_name;

-- 16. List all countries with no employees in the database.
SELECT c.country_id, c.country_name
FROM countries c
LEFT JOIN locations l ON c.country_id = l.country_id
LEFT JOIN departments d ON l.location_id = d.location_id
LEFT JOIN employees e ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;

-- 17. Find employees who work in a different country than their manager.
SELECT 
    e.first_name || ' ' || e.last_name AS employee_name,
    ec.country_name AS employee_country,
    m.first_name || ' ' || m.last_name AS manager_name,
    mc.country_name AS manager_country
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
JOIN departments ed ON e.department_id = ed.department_id
JOIN locations el ON ed.location_id = el.location_id
JOIN countries ec ON el.country_id = ec.country_id
JOIN departments md ON m.department_id = md.department_id
JOIN locations ml ON md.location_id = ml.location_id
JOIN countries mc ON ml.country_id = mc.country_id
WHERE ec.country_id <> mc.country_id;

-- 18. Create a report showing the distribution of employees by salary range (e.g., 0−5000, 5001−10000, etc.) for each department.
WITH SalaryRanges AS (
    SELECT 
        d.department_name,
        SUM(CASE WHEN e.salary BETWEEN 0 AND 5000 THEN 1 ELSE 0 END) AS "0-5000",
        SUM(CASE WHEN e.salary BETWEEN 5001 AND 10000 THEN 1 ELSE 0 END) AS "5001-10000",
        SUM(CASE WHEN e.salary BETWEEN 10001 AND 15000 THEN 1 ELSE 0 END) AS "10001-15000",
        SUM(CASE WHEN e.salary > 15000 THEN 1 ELSE 0 END) AS "15000+"
    FROM departments d
    LEFT JOIN employees e ON d.department_id = e.department_id
    GROUP BY d.department_name
)
SELECT * FROM SalaryRanges
ORDER BY department_name;