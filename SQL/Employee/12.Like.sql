-- Active: 1685713185905@@localhost@3306@employee

-- The LIKE operator is one of the SQL logical operators. The LIKE operator returns true if a value matches a pattern or false otherwise.

-- In this syntax, the LIKE operator tests whether an expression matches the pattern. The SQL standard provides you with two wildcard characters to make a pattern:

 	-- % percent wildcard matches zero, one, or more characters
 	-- _ underscore wildcard matches a single character.


-- Expression	Meaning
	-- LIKE 'Kim%'	match a string that starts with Kim
	-- LIKE '%er'	match a string that ends with er
	-- LIKE '%ch%'	match a string that contains ch
	-- LIKE 'Le_'	match a string that starts with Le and is followed by one character e.g., Les, Len…
	-- LIKE '_uy'	match a string that ends with uy and is preceded by one character e.g., guy
	-- LIKE '%are_'	match a string that contains are and ends with one character
	-- LIKE '_are%'	match a string that contains are, starts with one character, and ends with any number of characters
SELECT
	employee_id,
	first_name,
	last_name
FROM
	employees
WHERE
	first_name LIKE 'Da%';
    
SELECT
	employee_id,
	first_name,
	last_name
FROM
	employees
WHERE
	first_name LIKE '%er';
    
SELECT
	employee_id,
	first_name,
	last_name
FROM
	employees
WHERE
	last_name LIKE '%an%';
    
SELECT
	employee_id,
	first_name,
	last_name
FROM
	employees
WHERE
	first_name LIKE 'Jo__';
    
SELECT
	employee_id,
	first_name,
	last_name
FROM
	employees
WHERE
	first_name LIKE '%are_';

-- To negate the LIKE operator, you use the NOT operator:

-- The NOT LIKE operator returns true if the expression doesn’t match the pattern or false otherwise.  
SELECT
	employee_id,
	first_name,
	last_name
FROM
	employees
WHERE
	first_name LIKE 'S%'
AND first_name NOT LIKE 'Sh%'
ORDER BY
	first_name;
    
