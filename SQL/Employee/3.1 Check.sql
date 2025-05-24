-- create database Super_Store;

use super_store;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT,
    CHECK (salary >= 30000)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

show tables;

INSERT into employees (employee_id, first_name, salary, department_id) VALUES
(1, 'John Doe', 50000, 1),
(2, 'Jane Smith', 60000, 2),
(3, 'Alice Johnson', 70000, 1),
(4, 'Bob Brown', 80000, 3);

INSERT into employees (employee_id, first_name, salary, department_id) VALUES
(5, 'Charlie Davis', 20000, 2);

INSERT into products (product_id, product_name, price) VALUES
(1, 'Laptop', 1200.00),
(2, 'Smartphone', 800.00),
(3, 'Tablet', 600.00),
(4, 'Monitor', 300.00);