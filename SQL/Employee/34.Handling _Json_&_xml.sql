-- Handling Json and xml files in MySQL

/*
*JSON Data*
JSON data is represented as key-value pairs, with nested structures and arrays. 
In SQL databases that support JSON, you can store JSON documents in dedicated columns or fields.

*XML Data*
XML data is structured using tags and attributes, forming a hierarchical tree-like structure. 
SQL databases can store XML data in dedicated XML data types.

*Storing JSON Data*
Many modern SQL databases, including PostgreSQL, MySQL, and SQL Server, provide support for JSON data types. 
You can create tables with JSON columns to store JSON documents.*/

-- **Handling JSON in MySQL**
-- Table Creation with JSON Column
CREATE TABLE employees_json (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  details JSON
);

-- Inserting JSON Data
INSERT INTO employees_json (name, details) VALUES
('Alice', '{"age": 30, 
            "skills": ["SQL", "Python"], 
            "address": {"city": "New York", "zip": "10001"}}'),
('Bob', '{"age": 35, 
          "skills": ["Java", "AWS"], 
          "address": {"city": "Chicago", "zip": "60601"}}');

-- Querying JSON Data
SELECT 
  name,
  details->'$.age' AS age,
  details->'$.address.city' AS city
FROM employees_json;

-- Use JSON_EXTRACT() (same as ->):
SELECT name, JSON_EXTRACT(details, '$.skills[0]') AS first_skill FROM employees_json;

SELECT
  name,
  JSON_EXTRACT(details, '$.age') AS age,
  JSON_EXTRACT(details, '$.address.city') AS city
FROM employees_json;

-- Use ->> for unquoted (plain text) results:
SELECT name, details->>'$.address.zip' AS zip_code FROM employees_json;

-- Use JSON_CONTAINS to search:
SELECT * 
FROM employees_json 
WHERE JSON_CONTAINS(details->'$.skills', '"Python"');

-- Updating JSON Data
UPDATE employees_json
SET details = JSON_SET(details, '$.age', 31)
WHERE name = 'Alice';


-- **Handling XML in MySQL**

-- Table Creation for XML Data
CREATE TABLE employees_xml (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  xml_data TEXT
);

-- Inserting XML Data
INSERT INTO employees_xml (name, xml_data) VALUES
('Alice', '<employee>
                <age>30</age>
                <city>New York</city>
                <skills>
                    <skill>SQL</skill>
                    <skill>Python</skill>
                </skills>
            </employee>'),
('Bob', '<employee>
                <age>35</age>
                <city>Chicago</city>
                <skills>
                    <skill>Java</skill>
                    <skill>AWS</skill>
                </skills>
        </employee>');

-- Querying XML Data
-- Use ExtractValue() (deprecated in MySQL 8+):
SELECT
  name,
  EXTRACTVALUE(xml_data, '/employee/age') AS age,
  EXTRACTVALUE(xml_data, '/employee/city') AS city
FROM employees_xml;