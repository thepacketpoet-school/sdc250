-- Haley Archer

-- Question 1: List first name, last name, and department code for employees in departments SAL, SHP, and ACT
SELECT first_name, last_name, dept_code
FROM L_EMPLOYEES
WHERE dept_code IN ('SAL', 'SHP', 'ACT');

-- Question 2: List employee ID, first name, and last name of employees with employee ID between 201 and 205
SELECT employee_id, first_name, last_name
FROM L_EMPLOYEES
WHERE employee_id BETWEEN 201 AND 205;

-- Question 3: List employee ID, first name, and last name of employees where employee ID contains the number 1
SELECT employee_id, first_name, last_name 
FROM L_EMPLOYEES 
WHERE TO_CHAR(employee_id) LIKE '%1%';

-- Question 4: List all columns of L_EMPLOYEES where manager_ID is NULL
SELECT *
FROM L_EMPLOYEES
WHERE manager_id IS NULL;

-- Question 5: List department names from L_DEPARTMENTS, rename column as 'dept', sort ascending (Method 1)
SELECT department_name AS dept
FROM L_DEPARTMENTS
ORDER BY department_name ASC;
