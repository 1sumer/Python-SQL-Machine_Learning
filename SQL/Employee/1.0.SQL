select version();

SELECT ROUTINE_NAME, ROUTINE_TYPE
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_SCHEMA = 'employee';

-- View Users
SELECT user, host FROM mysql.user;

-- View Password Hash (not actual password)
SELECT user, host, authentication_string FROM mysql.user;

-- Change User Password (MySQL)
ALTER USER 'john'@'localhost' IDENTIFIED BY 'NewPassword123';

-- Privilege & Access Management
SHOW GRANTS FOR 'john'@'localhost';

use employee;

-- Storage & Engine Info
SHOW TABLE STATUS;
SELECT * FROM information_schema.tables WHERE table_schema = 'countries';

