-- The CASE expression compares an expression to a set of expression (when_expression_1, when_expression_2, when_expression_3, …) using the equality operator (=). If you want to use other comparison operators such as greater than (>), less than (<), etc., you use the searched CASE expression.
-- The CASE statement returns the result_1, result_2, or result_3 if the expression matches the corresponding expression in the WHEN clause.
-- If the expression does not match any expression in the WHEN clause, it returns the esle_result in the ELSE clause. The ELSE clause is optional.
-- If you omit the ELSE clause and the expression does not match any expression in the WHEN clause, the CASE expression returns NULL.

SELECT 
    first_name,
    last_name,
    hire_date,
    CASE (2000 - YEAR(hire_date))
        WHEN 1 THEN '1 year'
        WHEN 3 THEN '3 years'
        WHEN 5 THEN '5 years'
        WHEN 10 THEN '10 years'
        WHEN 15 THEN '15 years'
        WHEN 20 THEN '20 years'
        WHEN 25 THEN '25 years'
        WHEN 30 THEN '30 years'
    END aniversary
FROM
    employees
ORDER BY first_name;

SELECT 
    first_name,
    last_name,
    CASE
        WHEN salary < 3000 THEN 'Low'
        WHEN salary >= 3000 AND salary <= 5000 THEN 'Average'
        WHEN salary > 5000 THEN 'High'
    END evaluation
FROM
    employees;
    
