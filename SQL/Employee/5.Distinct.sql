-- Active: 1685713185905@@localhost@3306@employee

-- To remove duplicate rows from a result set, you use the DISTINCT operator in the SELECT clause as follows:

-- If you use one column after the DISTINCT operator, the DISTINCT operator uses values in that column to evaluate duplicates.

-- If you use two or more columns, the DISTINCT will use the combination of values in those columns to evaluate the duplicate.

-- Note that the DISTINCT only removes the duplicate rows from the result set. It doesn’t delete duplicate rows in the table.

-- If you want to select two columns and remove duplicates in one column, you should use the GROUP BY clause instead.
SELECT 
    salary
FROM
    employees
ORDER BY salary DESC;

SELECT 
    DISTINCT salary
FROM
    employees
ORDER BY salary DESC;

select * from employees;
SELECT
	job_id,
	salary
FROM
	employees
ORDER BY
	job_id,
	salary desc;
    
SELECT DISTINCT
	job_id,
	salary
FROM
	employees
ORDER BY
	job_id,
	salary Asc;
    
SELECT DISTINCT phone_number
FROM employees
ORDER BY phone_number;