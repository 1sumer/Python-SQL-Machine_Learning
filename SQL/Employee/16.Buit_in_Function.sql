-- Active: 1746006268448@@127.0.0.1@3306@employee
/*String Function*/
-- Get the length of the employee's first name:
SELECT first_name, LENGTH(first_name) AS name_length
FROM employees;

-- Concatenate first and last names
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

-- Converts a string to uppercase or lowercase
SELECT UPPER(country_name) FROM countries;
SELECT LOWER(city) FROM locations;

-- Extracts a substring from a string
SELECT SUBSTR(country_name, 1, 3) AS short_name FROM countries;

-- Extract a substring starting from position 3, with a length of 4
SELECT SUBSTR('Hello, World!', 3, 4) AS result;


-- Example 1: Basic usage
SELECT INSTR('Hello World', 'World') AS position;

-- Removes leading and trailing spaces from a string.
SELECT TRIM(both ' ' FROM street_address) AS trimmed_address FROM locations;

-- Replaces occurrences of a specified substring with another substring.
SELECT REPLACE(city, ' ', '_') AS modified_city FROM locations;

-- Returns the position of a specified substring in a string.
SELECT POSITION('land' IN street_address) AS position FROM locations;




/*Numarical Function*/
-- calculates the absolute value -ve to +ve
SELECT salary, ABS(salary) AS absolute_salary
FROM employees;

-- the MOD function is used to calculate the remainder
select MOD(16,3) as reminder;
SELECT employee_id, salary, MOD(salary, 1000) AS salary_mod_1000
FROM employees;

-- The POWER function raises the salary to the power of 2
select POWER(10,2) as power_of_number;
SELECT salary, POWER(salary, 2) AS salary_squared
FROM employees;

-- The SQRT function calculates the square root of the salary

select SQRT(15) as sqrt_no;
SELECT salary, SQRT(salary) AS salary_sqrt
FROM employees;

-- These queries demonstrate the use of trigonometric functions (SIN, COS, TAN) 

select SIN(45) as sin_value;
select COS(45) as cos_value;
select TAN(45) as tan_value;
select LOG(3) as log_value;

SELECT
    employee_id,
    SIN(employee_id) AS sin_value,
    COS(employee_id) AS cos_value,
    TAN(employee_id) AS tan_value
FROM employees;

-- The FLOOR function rounds down each salary to the nearest integer. 
SELECT FLOOR(15.9684) floor_value;
SELECT salary, FLOOR(salary) AS floor_salary
FROM employees;

-- The EXP function calculates the exponential value
select EXP(15) as exp_value;

-- Using GREATEST with literal values
SELECT GREATEST(10, 5, 8, 12, 7) AS max_value;

-- Using LEAST with literal values
SELECT LEAST(10, 5, 8, 12, 7) AS min_value;



/* Data and time Function*/

-- Returns the current date.
SELECT CURRENT_DATE AS current_date1;

-- Returns the current date and time.
SELECT NOW() AS current_datetime;
-- or
SELECT CURRENT_TIMESTAMP AS current_datetime;

-- Formats a date according to a specified format.
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s') AS formatted_datetime;  

-- Adds or subtracts a specified time interval from a date.
SELECT DATE_ADD(NOW(), INTERVAL 7 DAY) AS future_date;
SELECT DATE_SUB(NOW(), INTERVAL 1 MONTH) AS past_date;

--Calculates the difference between two dates
SELECT DATEDIFF('2023-01-01', '2022-12-01') AS date_difference;

-- Calculates the difference between two timestamps.
SELECT TIMESTAMPDIFF(HOUR, '2022-12-01 12:00:00', '2022-12-01 15:30:00') AS hours_difference;

-- Extracts a part (year, month, day, etc.) from a date.
SELECT EXTRACT(YEAR FROM hire_date) AS hire_year FROM employees;

-- Similar to CURRENT_DATE and CURRENT_TIME, respectively.
SELECT CURDATE() AS current_date1;
SELECT CURTIME() AS current_time1;

-- Returns the name of the day or month.
SELECT DAYNAME(NOW()) AS current_day;
SELECT MONTHNAME(NOW()) AS current_month;

-- Converts a date and time to a datetime value
SELECT TIMESTAMP('2023-01-01', '12:34:56') AS combined_datetime;

-- Casts a date or datetime value to a different data type.
SELECT CAST(NOW() AS CHAR) AS converted_to_string;

-- Converts a date or datetime value to a different format.
SELECT CONVERT(NOW(), CHAR) AS converted_to_string;