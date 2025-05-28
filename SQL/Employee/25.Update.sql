-- Active: 1685713185905@@localhost@3306@employee

UPDATE employees 
SET 
	last_name = 'king1',
	email = 'steven.king2@gamil.com'
WHERE
    employee_id = 100;


    
UPDATE dependents 
SET 
    last_name = 'Lopez'
WHERE
    employee_id = 192;


UPDATE employees
SET 
    last_name = CASE employee_id
        WHEN 101 THEN 'Smith'
        WHEN 102 THEN 'Taylor'
        WHEN 103 THEN 'Brown'
    END,
    email = CASE employee_id
        WHEN 101 THEN 'smith@gmail.com'
        WHEN 102 THEN 'taylor@gmail.com'
        WHEN 103 THEN 'brown@gmail.com'
    END
WHERE employee_id IN (101, 102, 103);