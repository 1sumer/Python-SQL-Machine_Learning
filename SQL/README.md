# SQL Repository

## Overview

This repository contains a comprehensive set of SQL scripts organized to help you learn and practice core database concepts using an **Employee database schema**. The exercises span basic to advanced SQL, including DDL, DML, joins, subqueries, built-in functions, window functions, and stored procedures.

## Objectives

* Learn to create and manage relational database structures
* Write queries for data retrieval, filtering, and aggregation
* Practice joins, subqueries, views, and functions
* Understand advanced topics like CTEs, procedures, and window functions

---
## SQL Practice Repository – Employee Database


### 📁 File Structure

| **Filename**                 | **Topic Covered**                                     |
| ---------------------------- | ----------------------------------------------------- |
| `1.0.SQL`                    | Initial setup or basic SQL intro                      |
| `1.Creating_Load_Tables.sql` | Creating and loading tables (DDL + DML basics)        |
| `2.Insert.sql`               | Inserting records into tables                         |
| `3.1 Check.sql`              | Using `CHECK` constraints                             |
| `3.Alter Add Drop.sql`       | Altering tables: `ALTER`, `ADD`, `DROP`               |
| `4.Select.sql`               | Basic `SELECT` statements                             |
| `5.Distinct.sql`             | Removing duplicates with `DISTINCT`                   |
| `6.Where.sql`                | Filtering data using `WHERE`                          |
| `7.Order_by.sql`             | Sorting results with `ORDER BY`                       |
| `8.Limit.sql`                | Limiting rows using `LIMIT` or `TOP`                  |
| `9.Comparison_ope.sql`       | Operators like `=`, `!=`, `>`, `<`, etc.              |
| `10.Logical_ope.sql`         | `AND`, `OR`, `NOT` logical operators                  |
| `11.Between.sql`             | Filtering between a range                             |
| `12.IN operator.sql`         | Filtering using `IN` clause                           |
| `13.Like.sql`                | Pattern matching with `LIKE`                          |
| `14.Null.sql`                | Handling `NULL` values                                |
| `15.Not_Operator.sql`        | Using `NOT` operator in queries                       |
| `16.Buit_in_Function.sql`    | Using SQL built-in functions                          |
| `17.Aggregate function.sql`  | `SUM()`, `AVG()`, `COUNT()`, `MAX()`, `MIN()`         |
| `18.Group_By.sql`            | Grouping results using `GROUP BY`                     |
| `19.Having.sql`              | Filtering groups with `HAVING`                        |
| `20.Alias.sql`               | Using aliases with `AS`                               |
| `21.Joins.sql`               | `INNER`, `LEFT`, `RIGHT`, `FULL` joins                |
| `22.Subquerry.sql`           | Writing subqueries (nested queries)                   |
| `23.ALL & Any.sql`           | Using `ALL` and `ANY` keywords                        |
| `24.Set_Operation.sql`       | `UNION`, `INTERSECT`, `EXCEPT`                        |
| `25.Update.sql`              | Updating existing records                             |
| `26.Delete.sql`              | Deleting records                                      |
| `27.Case.sql`                | Using `CASE` for conditional logic                    |
| `28.CTE.sql`                 | Writing Common Table Expressions (`WITH` clause)      |
| `29.Windows_Functions.sql`   | `ROW_NUMBER()`, `RANK()`, `LEAD()`, `LAG()`           |
| `30.View.sql`                | Creating and using SQL `VIEW`s                        |
| `31.Storage_Procedure.sql`   | Introduction to stored procedures                     |
| `32.Functions.sql`           | Writing user-defined functions                        |
| `33.Normalization.sql`       | Database normalization concepts (1NF, 2NF, 3NF, etc.) |
| `34.Handling_JSON_&_xml.sql` | Working with JSON and XML data types                  |
| `ER diagram.pdf`             | Entity Relationship diagram for the Employee database |

### [**SQL_books**](./SQL_Books/)

Reference materials or notes based on popular Python books.
---

## How to Use

1. **Setup**:

   * Use a SQL environment such as MySQL, PostgreSQL, SQLite, or SQL Server.
   * Load the database schema and data using `1.Creating_Load_Tables.sql`.

2. **Explore**:

   * Run each script sequentially to master SQL fundamentals and advanced concepts.
   * Modify queries and try new examples for deeper understanding.

3. **Visualize**:

   * Use the included `ER diagram.pdf` to understand the structure and relationships.

---

## Prerequisites

* Basic understanding of relational databases
* Installed SQL engine (e.g., MySQL Workbench, pgAdmin, SQLite Studio)

---

## License

This project is open-source and available for educational use under the MIT License.

---

## Acknowledgements

* SQL documentation from [W3Schools](https://www.w3schools.com/sql/)
* [PostgreSQL Docs](https://www.postgresql.org/docs/)
* [MySQL Docs](https://dev.mysql.com/doc/)
* Inspired by real-world employee database models
