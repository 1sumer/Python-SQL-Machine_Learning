-- Active: 1685713185905@@localhost@3306@employee

-- Introduction to SQL SELECT statement

-- The SQL SELECT statement selects data from one or more tables. The following shows the basic syntax of the SELECT statement that selects data from a single table.

USE EMPLOYEE;

-- In this syntax:

	-- First, specify a list of comma-separated columns from the table in the SELECT clause.
	-- Then, specify the table name in the FROM clause.

	-- When evaluating the SELECT statement, the database system evaluates the FROM clause first and then the SELECT clause. It’s like from a table, select data from these columns.

	-- The semicolon (;) is not part of a query. The database server uses it to separate two SQL statements.

	-- SQL is case-insensitive.

select * from employees; -- * = All Atribute

select 
employee_id,
first_name,
last_name,
hire_date
from 
employees;

select * from locations;

select
country_id,
city,
location_id
from 
locations;

select * from employees; 

select 
employee_id,
first_name,
last_name,
salary,
salary + (salary * 0.15) as new_salary
from
employees;

SELECT * FROM locations;
