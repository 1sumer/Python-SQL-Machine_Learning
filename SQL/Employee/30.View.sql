/*✅ 1. VIEW
📘 What is a View?
A VIEW is a virtual table based on the result of a SQL query. It does not store data, but instead stores a predefined SELECT statement.

🔍 Why use a View?

| Purpose                    | Benefit                                    |
| -------------------------- | ------------------------------------------ |
| Simplify complex queries   | Write once, use repeatedly                 |
| Improve security           | Expose only selected columns               |
| Logical data abstraction   | Abstract schema changes from the end users |
| Code reuse                 | Makes reports and business logic modular   |
| Combine data across tables | Like a pre-joined table                    |


/*Syntax:
CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;*/


use employee;

CREATE VIEW high_earners AS
SELECT employee_id, first_name, last_name, salary, department_id
FROM employees
WHERE salary > 10000;

CREATE VIEW employee_info AS
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.email,
    e.salary,
    j.job_title,
    d.department_name,
    l.city,
    c.country_name,
    r.region_name
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
JOIN regions r ON c.region_id = r.region_id;

CREATE VIEW manager_list AS
SELECT employee_id, first_name, last_name
FROM employees
WHERE employee_id IN (
  SELECT DISTINCT manager_id FROM employees WHERE manager_id IS NOT NULL
);

select * from high_earners
where employee_id > 110;

/*
**Updating a View Definition**
If you want to update the view definition without affecting the data, use the CREATE OR REPLACE VIEW statement.*/

CREATE OR REPLACE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

/*
**Deleting a View**
SQL allows us to delete an existing View. We can delete or drop View using the DROP statement.*/

DROP VIEW view_name;