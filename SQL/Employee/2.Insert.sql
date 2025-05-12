-- Active: 1685713185905@@localhost@3306@employee
-- SQL provides the INSERT statement that allows you to insert one or more rows into a table. The INSERT statement allows you to:

-- Insert a single row into a table
-- Insert multiple rows into a table
-- Copy rows from a table to another table.

INSERT INTO dependents (
	first_name,
	last_name,
	relationship,
	employee_id
)
VALUES
	(
		'Dustin',
		'Johnson',
		'Child',
		178
	);
    
INSERT INTO dependents (
	first_name,
	last_name,
	relationship,
	employee_id
)
VALUES
	(
		'Cameron',
		'Bell',
		'Child',
		192
	),
	(
		'Michelle',
		'Bell',
		'Child',
		192
	);

-- The following statement copies all rows from the dependents table to the dependents_archive table.    
INSERT INTO dependents_archive 
SELECT
	*
FROM
	dependents;

-- The CHECK constraint comes after the data type of the column. If you insert or update the selling price with a negative value
CREATE TABLE dependents_archive (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    selling_price NUMERIC(10,2) CHECK (selling_price > 0)
);