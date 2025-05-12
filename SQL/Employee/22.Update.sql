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