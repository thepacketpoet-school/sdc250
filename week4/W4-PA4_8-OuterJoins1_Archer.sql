-- Haley Archer

-- (14-3) Question 1: 
-- The following select statement shows all the employees who are in each department.
-- First run this code as it is—as an inner join. Then change it to a left outer join.
-- What is the difference in the result tables?
SELECT a.department_name, b.first_name, b.last_name
FROM L_DEPARTMENTS a
INNER JOIN L_EMPLOYEES b
ON a.dept_code = b.dept_code;

-- Left Outer Join Version:
SELECT a.department_name, b.first_name, b.last_name
FROM L_DEPARTMENTS a
LEFT OUTER JOIN L_EMPLOYEES b
ON a.dept_code = b.dept_code;

-- (14-4) Question 2: 
-- This is a modification of the exercise in section 14-3.
-- The only thing that has been changed is the order of the tables in the from clause.
-- First run this code as it is—as an inner join.
-- Then change this select statement to a right outer join.
SELECT a.department_name, b.first_name, b.last_name
FROM L_EMPLOYEES b
INNER JOIN L_DEPARTMENTS a
ON a.dept_code = b.dept_code;

-- Right Outer Join Version:
SELECT a.department_name, b.first_name, b.last_name
FROM L_EMPLOYEES b
RIGHT OUTER JOIN L_DEPARTMENTS a
ON a.dept_code = b.dept_code;

-- (14-5) Question 3: 
-- This is a modification of the exercise in section 14-3.
-- The only thing that has changed is that table sec1405_employees replaces table L_EMPLOYEES.
-- The new table contains one new employee who has not been assigned to any department yet.
-- First run this code as it is—as an inner join.
-- Then change this select statement to a full outer join.
SELECT a.department_name, b.first_name, b.last_name
FROM L_DEPARTMENTS a
INNER JOIN sec1405_employees b
ON a.dept_code = b.dept_code;

-- Full Outer Join Version:
SELECT a.department_name, b.first_name, b.last_name
FROM L_DEPARTMENTS a
FULL OUTER JOIN sec1405_employees b
ON a.dept_code = b.dept_code;

-- (14-7) Question 4: 
-- The table sec1407_departments has the same format as the L_DEPARTMENTS table.
-- Write a select statement that shows the union of the two tables.
SELECT department_name, dept_code
FROM L_DEPARTMENTS
UNION
SELECT department_name, dept_code
FROM sec1407_departments;
