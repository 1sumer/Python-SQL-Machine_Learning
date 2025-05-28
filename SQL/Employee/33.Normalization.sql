<<<<<<< HEAD
-- Normalization
`https://www.datacamp.com/tutorial/normalization-in-sql`

/*
**What is Normalization in SQL?**
Normalization, in this context, is the process of organizing data within a database (relational database) to eliminate data anomalies, 
such as redundancy.

In simpler terms, it involves breaking down a large, complex table into smaller and simpler tables while maintaining data relationships.

Normalization is commonly used when dealing with large datasets.

**Why Normalize a Database?**

- Reduces redundancy: Redundancy is when the same information is stored multiple times, 
and a good way of avoiding this is by splitting data into smaller tables.

- Improves query performance: You can perform faster query execution on smaller tables that have undergone normalization.

- Minimizes update anomalies: With normalized tables, you can easily update data without affecting other records.

- Enhances data integrity: It ensures that data remains consistent and accurate.

**What Causes the Need for Normalization?**

If a table is not properly normalized and has data redundancy, it will not only take up extra data storage space but also make it difficult to 
handle and update the database.

There are several factors that drive the need for normalization, from data redundancy(as covered above) to difficulty managing relationships.

**Different Types of Database Normalization**

*First Normal Form (1NF)*
This normalization level ensures that each column in your data contains only atomic values. 
Atomic values in this context means that each entry in a column is indivisible. 
It is like saying that each cell in a spreadsheet should hold just one piece of information. 
1NF ensures atomicity of data, with each column cell containing only a single value and each column having unique names.

*Second Normal Form (2NF)*
Eliminates partial dependencies by ensuring that non-key attributes depend only on the primary key. 
What this means, in essence, is that there should be a direct relationship between each column and the primary key, and not between other columns.

*Third Normal Form (3NF)*
Removes transitive dependencies by ensuring that non-key attributes depend only on the primary key. This level of normalization builds on 2NF.

*Boyce-Codd Normal Form (BCNF)*
This is a more strict version of 3NF that addresses additional anomalies. At this normalization level, every determinant is a candidate key.

*Fourth Normal Form (4NF)*
This is a normalization level that builds on BCNF by dealing with multi-valued dependencies.

*Fifth Normal Form (5NF)*
5NF is the highest normalization level that addresses join dependencies. 
It is used in specific scenarios to further minimize redundancy by breaking a table into smaller tables
*/

-- 1NF: Atomic values, one department/project per row
CREATE TABLE employee_departments_projects (
  employee_id INT,
  employee_name VARCHAR(50),
  department VARCHAR(50),
  project VARCHAR(50)
);

INSERT INTO employee_departments_projects VALUES
(1, 'Alice', 'HR', 'P1'),
(1, 'Alice', 'Finance', 'P2'),
(2, 'Bob', 'IT', 'P1');


-- 2NF: Remove Partial Dependencies
-- Employees table
CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(50)
);

-- Employee departments
CREATE TABLE employee_departments (
  employee_id INT,
  department VARCHAR(50),
  PRIMARY KEY (employee_id, department),
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- 3NF: Remove Transitive Dependencies
-- New departments table
CREATE TABLE departments (
  department VARCHAR(50) PRIMARY KEY,
  location VARCHAR(50)
);

-- employee_departments stays same but now references departments
ALTER TABLE employee_departments
  ADD FOREIGN KEY (department) REFERENCES departments(department);

-- 4NF: No Multivalued Dependencies
-- Incorrect (cross-product effect):
CREATE TABLE employee_skills_languages (
  employee_id INT,
  skill VARCHAR(50),
  language VARCHAR(50)
);

-- Fix:
CREATE TABLE employee_skills (
  employee_id INT,
  skill VARCHAR(50),
  PRIMARY KEY (employee_id, skill)
);

CREATE TABLE employee_languages (
  employee_id INT,
  language VARCHAR(50),
  PRIMARY KEY (employee_id, language)
);

-- 5NF: No Join Dependency (Decomposition)
-- Table: course, instructor, semester
CREATE TABLE course_instructor (
  course VARCHAR(50),
  instructor VARCHAR(50),
  PRIMARY KEY (course, instructor)
);

CREATE TABLE course_semester (
  course VARCHAR(50),
  semester VARCHAR(10),
  PRIMARY KEY (course, semester)
);

CREATE TABLE instructor_semester (
  instructor VARCHAR(50),
  semester VARCHAR(10),
  PRIMARY KEY (instructor, semester)
);
=======
-- Normalization
`https://www.datacamp.com/tutorial/normalization-in-sql`

/*
**What is Normalization in SQL?**
Normalization, in this context, is the process of organizing data within a database (relational database) to eliminate data anomalies, 
such as redundancy.

In simpler terms, it involves breaking down a large, complex table into smaller and simpler tables while maintaining data relationships.

Normalization is commonly used when dealing with large datasets.

**Why Normalize a Database?**

- Reduces redundancy: Redundancy is when the same information is stored multiple times, 
and a good way of avoiding this is by splitting data into smaller tables.

- Improves query performance: You can perform faster query execution on smaller tables that have undergone normalization.

- Minimizes update anomalies: With normalized tables, you can easily update data without affecting other records.

- Enhances data integrity: It ensures that data remains consistent and accurate.

**What Causes the Need for Normalization?**

If a table is not properly normalized and has data redundancy, it will not only take up extra data storage space but also make it difficult to 
handle and update the database.

There are several factors that drive the need for normalization, from data redundancy(as covered above) to difficulty managing relationships.

**Different Types of Database Normalization**

*First Normal Form (1NF)*
This normalization level ensures that each column in your data contains only atomic values. 
Atomic values in this context means that each entry in a column is indivisible. 
It is like saying that each cell in a spreadsheet should hold just one piece of information. 
1NF ensures atomicity of data, with each column cell containing only a single value and each column having unique names.

*Second Normal Form (2NF)*
Eliminates partial dependencies by ensuring that non-key attributes depend only on the primary key. 
What this means, in essence, is that there should be a direct relationship between each column and the primary key, and not between other columns.

*Third Normal Form (3NF)*
Removes transitive dependencies by ensuring that non-key attributes depend only on the primary key. This level of normalization builds on 2NF.

*Boyce-Codd Normal Form (BCNF)*
This is a more strict version of 3NF that addresses additional anomalies. At this normalization level, every determinant is a candidate key.

*Fourth Normal Form (4NF)*
This is a normalization level that builds on BCNF by dealing with multi-valued dependencies.

*Fifth Normal Form (5NF)*
5NF is the highest normalization level that addresses join dependencies. 
It is used in specific scenarios to further minimize redundancy by breaking a table into smaller tables
*/

-- 1NF: Atomic values, one department/project per row
CREATE TABLE employee_departments_projects (
  employee_id INT,
  employee_name VARCHAR(50),
  department VARCHAR(50),
  project VARCHAR(50)
);

INSERT INTO employee_departments_projects VALUES
(1, 'Alice', 'HR', 'P1'),
(1, 'Alice', 'Finance', 'P2'),
(2, 'Bob', 'IT', 'P1');


-- 2NF: Remove Partial Dependencies
-- Employees table
CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(50)
);

-- Employee departments
CREATE TABLE employee_departments (
  employee_id INT,
  department VARCHAR(50),
  PRIMARY KEY (employee_id, department),
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- 3NF: Remove Transitive Dependencies
-- New departments table
CREATE TABLE departments (
  department VARCHAR(50) PRIMARY KEY,
  location VARCHAR(50)
);

-- employee_departments stays same but now references departments
ALTER TABLE employee_departments
  ADD FOREIGN KEY (department) REFERENCES departments(department);

-- 4NF: No Multivalued Dependencies
-- Incorrect (cross-product effect):
CREATE TABLE employee_skills_languages (
  employee_id INT,
  skill VARCHAR(50),
  language VARCHAR(50)
);

-- Fix:
CREATE TABLE employee_skills (
  employee_id INT,
  skill VARCHAR(50),
  PRIMARY KEY (employee_id, skill)
);

CREATE TABLE employee_languages (
  employee_id INT,
  language VARCHAR(50),
  PRIMARY KEY (employee_id, language)
);

-- 5NF: No Join Dependency (Decomposition)
-- Table: course, instructor, semester
CREATE TABLE course_instructor (
  course VARCHAR(50),
  instructor VARCHAR(50),
  PRIMARY KEY (course, instructor)
);

CREATE TABLE course_semester (
  course VARCHAR(50),
  semester VARCHAR(10),
  PRIMARY KEY (course, semester)
);

CREATE TABLE instructor_semester (
  instructor VARCHAR(50),
  semester VARCHAR(10),
  PRIMARY KEY (instructor, semester)
);
>>>>>>> 8c5b2c02a42c07e081ce66ee1e7cd955f96b8cf1
