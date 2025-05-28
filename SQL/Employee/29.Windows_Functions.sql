use employee;
/*Window functions perform calculations across a set of rows related to the current row.
Unlike GROUP BY, which collapses rows into a single result, window functions keep all rows visible, allowing powerful row-wise analytics.*/

-- Syntax:
/*
<function>(<expression>) OVER (
    [PARTITION BY column]
    [ORDER BY column]
    [ROWS BETWEEN ...]
)
*/

/*
| Function          | Purpose                           |
| ----------------- | --------------------------------- |
| `ROW_NUMBER()`    | Unique row number per partition   |
| `RANK()`          | Rank with gaps                    |
| `DENSE_RANK()`    | Rank without gaps                 |
| `SUM()` / `AVG()` | Running total / average           |
| `FIRST_VALUE()`   | First value in window             |
| `LAST_VALUE()`    | Last value in window              |
*/

-- 1. ROW_NUMBER() 
-- Give row numbers to employees per department
-- Assigns a unique sequential integer to rows within a partition, starting from 1.
-- No tie-handling: Even tied values get different row numbers.

SELECT 
  department_id, 
  employee_id, 
  first_name, 
  salary,
  ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS row_num
FROM employees;

-- Row number by job, ordered by hire date
SELECT employee_id, job_id, hire_date,
  ROW_NUMBER() OVER (PARTITION BY job_id ORDER BY hire_date) AS row_num
FROM employees;

-- Row number by location (via department)
SELECT e.employee_id, d.location_id,
  ROW_NUMBER() OVER (PARTITION BY d.location_id ORDER BY e.salary DESC) AS row_num
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- 2. RANK()
-- Ranks rows within a partition based on the ordering, with gaps for tied ranks.
-- If two employees tie for 1st, they both get rank 1, and the next gets rank 3.
-- RANK() assigns the same rank to tied rows, but skips subsequent ranks.

-- Handle ties in salaries
SELECT 
  department_id,
  employee_id,
  first_name,
  salary,
  RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS 'rank'
FROM employees;

-- Rank by salary within each department
SELECT employee_id, department_id, salary,
  RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
FROM employees;

-- Rank employees globally by hire date
SELECT employee_id, hire_date,
  RANK() OVER (ORDER BY hire_date) AS hire_rank
FROM employees;

-- Rank by salary where ties are likely
SELECT employee_id, salary,
  RANK() OVER (ORDER BY salary) AS rank_with_ties
FROM employees;

-- DENSE_RANK() by salary within each department
-- Ranks rows like RANK(), but without gaps for tied values.
-- If two employees tie for 1st, they both get rank 1, the next gets rank 2.
-- DENSE_RANK() assigns the same rank to tied rows, but does not skip subsequent ranks.

SELECT 
  department_id,
  employee_id,
  first_name,
  salary,
  DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS 'dense_rank'
FROM employees;

-- Dense rank by job and hire date
SELECT employee_id, job_id, hire_date,
  DENSE_RANK() OVER (PARTITION BY job_id ORDER BY hire_date) AS 'dense_rank'
FROM employees;

-- Dense rank by department and last name
SELECT employee_id, department_id, last_name,
  DENSE_RANK() OVER (PARTITION BY department_id ORDER BY last_name) AS dense_name_rank
FROM employees;

-- Dense rank by manager ID and hire date
SELECT employee_id, manager_id, hire_date,
  DENSE_RANK() OVER (PARTITION BY manager_id ORDER BY hire_date) AS dense_mgr_rank
FROM employees;

-- 3. SUM() / AVG()
-- Calculate running total of salaries
-- Calculates a cumulative total or average across rows in a partition.
SELECT 
  employee_id,
  first_name,
  salary,
  SUM(salary) OVER (ORDER BY hire_date) AS running_total
FROM employees;

-- Average salary by department
SELECT employee_id, department_id, salary,
  AVG(salary) OVER (PARTITION BY department_id) AS dept_avg_salary
FROM employees;

-- Running average salary by job
SELECT employee_id, job_id, salary,
  AVG(salary) OVER (PARTITION BY job_id ORDER BY hire_date) AS running_avg_salary
FROM employees;

-- 5. Global average salary
SELECT employee_id, salary,
  AVG(salary) OVER () AS global_avg_salary
FROM employees;

SELECT 
  employee_id,
  first_name,
  department_id,
  salary,
  AVG(salary) OVER (PARTITION BY department_id) AS dept_avg_salary
FROM employees;

SELECT 
  employee_id,
  department_id,
  salary,
  MIN(salary) OVER (PARTITION BY department_id) AS min_salary_in_dept
FROM employees;

SELECT 
  employee_id,
  department_id,
  salary,
  MAX(salary) OVER (PARTITION BY department_id) AS max_salary_in_dept
from employees;

SELECT 
  e.employee_id,
  j.job_title,
  e.salary,
  MAX(e.salary) OVER (PARTITION BY j.job_title) AS max_salary_for_job
FROM employees e
JOIN jobs j ON e.job_id = j.job_id;

SELECT 
  employee_id,
  department_id,
  COUNT(*) OVER (PARTITION BY department_id) AS dept_employee_count
FROM employees;


-- 4. FIRST_VALUE()
-- Returns the first value in the ordered window for each row
-- Default frame ends at the current row, but can be customized for full-partition comparison.

-- 1. First salary per department by hire date
SELECT employee_id, department_id, salary,
  FIRST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY hire_date) AS first_salary
FROM employees;

-- 2. First hire date globally
SELECT employee_id, hire_date,
  FIRST_VALUE(hire_date) OVER (ORDER BY hire_date) AS company_first_hire
FROM employees;

-- 3. First employee name in department by salary
SELECT employee_id, department_id, first_name, salary,
  FIRST_VALUE(first_name) OVER (PARTITION BY department_id ORDER BY salary DESC) AS top_earner
FROM employees;

-- 4. First salary per manager
SELECT employee_id, manager_id, salary,
  FIRST_VALUE(salary) OVER (PARTITION BY manager_id ORDER BY hire_date) AS first_mgr_salary
FROM employees;

-- LAST_VALUE()
-- Returns the last value in the ordered window for each row.
-- 🏁 `LAST_VALUE()` – Last row value in the window
-- 🔄 Use frame: `ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING` to get true last value.

-- **UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING**
/*The clause ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING is a frame specification used with window functions. 
It defines the range of rows (called the window frame) to consider for calculating the result of the window function.*/

-- UNBOUNDED PRECEDING: Refers to the first row of the partition.

-- UNBOUNDED FOLLOWING: Refers to the last row of the partition.

-- By default, some window functions (like LAST_VALUE()) do not return the true last value of the partition unless you explicitly define the frame.


-- 1. Last salary per department
SELECT employee_id, department_id, salary,
  LAST_VALUE(salary) OVER (
    PARTITION BY department_id ORDER BY hire_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
  ) AS dept_last_salary
FROM employees;

-- 2. Last hire date globally
SELECT employee_id, hire_date,
  LAST_VALUE(hire_date) OVER (
    ORDER BY hire_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
  ) AS company_last_hire
FROM employees;

-- 3. Last salary in job group
SELECT employee_id, job_id, salary,
  LAST_VALUE(salary) OVER (
    PARTITION BY job_id ORDER BY hire_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
  ) AS last_job_salary
FROM employees;

-- 4. Last salary per manager group
SELECT employee_id, manager_id, salary,
  LAST_VALUE(salary) OVER (
    PARTITION BY manager_id ORDER BY hire_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
  ) AS last_mgr_salary
FROM employees;

SELECT 
  employee_id,
  department_id,
  salary,
  FIRST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY hire_date) AS first_salary,
  LAST_VALUE(salary) OVER (
    PARTITION BY department_id ORDER BY hire_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
  ) AS last_salary
FROM employees;