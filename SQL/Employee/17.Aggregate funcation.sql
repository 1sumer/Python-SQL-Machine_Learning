-- Active: 1685713185905@@localhost@3306@employee
SELECT 
    AVG(DISTINCT salary)
FROM
    employees;
    
SELECT 
    ROUND(AVG(DISTINCT salary), 2)
FROM
    employees;

SELECT 
    AVG(salary)
FROM
    employees
WHERE
    job_id = 6;  
    
SELECT
	department_id,
	AVG(salary)
FROM
	employees
GROUP BY
	department_id;
    
    
/* Sum */
SELECT 
    SUM(salary)
FROM
    employees;
    
SELECT 
    SUM(salary)
FROM
    employees
WHERE
    department_id = 5;
    
SELECT
	department_id,
	SUM(salary)
FROM
	employees
GROUP BY
	department_id;
    
/*count*/
SELECT 
    COUNT(*)
FROM
    employees
WHERE
    department_id = 6;
    
SELECT 
    COUNT(*)
FROM
    employees
WHERE
    job_id = 9;
    
SELECT
	department_id,
	COUNT(*)
FROM
	employees
GROUP BY
	department_id;
    
/*max*/
SELECT 
    MAX(salary)
FROM
    employees;
    
SELECT
	department_id,
	MAX(salary)
FROM
	employees
GROUP BY
	department_id;
    
/*min*/
SELECT
	department_id,
	MIN(salary)
FROM
	employees
GROUP BY
	department_id;