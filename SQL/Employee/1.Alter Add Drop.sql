-- Active: 1685713185905@@localhost@3306@employee

CREATE TABLE candidates (
    id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO candidates VALUES (1, 'SAMEER', 'PASHA', 'sameerpasha658@gmail.com'),
                            (2,'SUMER','PASHA','sumerpasha078@gmail.com');


-- Once you create a new table, you may want to change its structure because business requirements change. To modify the structure of a table, you use the ALTER TABLE statement. The ALTER TABLE statement allows you to perform the following operations on an existing table:

-- Add a new column using the ADD clause.
-- Modify attribute of a column such as constraint, default value, etc. using the MODIFY clause.
-- Remove columns using the DROP clause.

select * from candidates;

ALTER TABLE candidates
ADD COLUMN phone VARCHAR(50);

ALTER TABLE candidates 
ADD fee NUMERIC (10, 2) AFTER last_name,
ADD max_limit INT AFTER last_name;

select * from candidates;
ALTER TABLE candidates
ADD COLUMN home_address VARCHAR(255),
ADD COLUMN dob DATE,
ADD COLUMN linkedin_account VARCHAR(255);

ALTER TABLE candidates 
MODIFY first_name VARCHAR(150) DEFAULT NULL;

ALTER TABLE candidates
DROP COLUMN linkedin_account;

ALTER TABLE candidates
DROP COLUMN phone,
DROP COLUMN dob;

-- Drop TABLE (name of the table);
-- DROP DATABASE (name of the database);

-- only delete the data from table
TRUNCATE TABLE candidates;

DELETE from candidates where id = 1; 

UPDATE candidates SET first_name = 'Sumer' WHERE id = 1;

SELECT * FROM candidates;

RENAME TABLE candidates TO candidates_1;