-- Active: 1746006268448@@127.0.0.1@3306@employee
/*Delete*/
-- To delete multiple rows in a table, you use the condition in the WHERE clause to identify the rows that should be deleted
-- Insert 
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary) VALUES (147,'my','sql','my.sql@gmail.com','514.124.4568','2025-05-05',4,25000.00);

select * FROM employees;

DELETE FROM 
dependents 
WHERE
    employee_id IN (100 , 101, 102);

select * FROM dependents;

-- to remove the employee id 192 and all  the employee’s dependents  
DELETE
FROM
	employees
WHERE
	employee_id = 192;
    