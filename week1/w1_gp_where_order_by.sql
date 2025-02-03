-- Haley Archer

-- Query 1: List all employees who do not report to employee 203 (Martha Woods)
SELECT employee_id, first_name, last_name, manager_id
FROM L_EMPLOYEES
WHERE manager_id <> 203;

-- Query 2: List all employees who report to employees 202 or 203 (Jim Kern or Martha Woods)
SELECT employee_id, first_name, last_name, manager_id
FROM L_EMPLOYEES
WHERE manager_id IN (202, 203);

-- Query 3: Alternative way to write Query 2 using Boolean OR
SELECT employee_id, first_name, last_name, manager_id
FROM L_EMPLOYEES
WHERE manager_id = 202 OR manager_id = 203;

-- Query 4: List all employees hired between ‘AUG-16-1999’ and ‘JUL-01-2008’
SELECT employee_id, first_name, last_name, hire_date
FROM L_EMPLOYEES
WHERE hire_date BETWEEN TO_DATE('16-AUG-1999', 'DD-MON-YYYY') 
                    AND TO_DATE('01-JUL-2008', 'DD-MON-YYYY');

-- Query 5: List employee ID, first name, and last name of employees with IDs between 201 and 205
SELECT employee_id, first_name, last_name
FROM L_EMPLOYEES
WHERE employee_id BETWEEN 201 AND 205;

-- Query 6: List all employees who have the letter 'n' in their last name
SELECT employee_id, first_name, last_name
FROM L_EMPLOYEES
WHERE LOWER(last_name) LIKE '%n%';

-- Query 7: List all employees who have NULL in the manager_id column
SELECT employee_id, first_name, last_name, manager_id
FROM L_EMPLOYEES
WHERE manager_id IS NULL;

-- Query 8: List last name and first name, renaming last_name to family_name, sorted by last name
-- Method 1: Sorting by column name
SELECT last_name AS family_name, first_name
FROM L_EMPLOYEES
ORDER BY last_name ASC;

-- Method 2: Sorting by column position
SELECT last_name AS family_name, first_name
FROM L_EMPLOYEES
ORDER BY 1 ASC;

-- Query 9: List department codes and last names of all employees except employee 209, sorted by both columns
SELECT dept_code, last_name
FROM L_EMPLOYEES
WHERE employee_id <> 209
ORDER BY dept_code ASC, last_name ASC;

-- Query 10: List all columns from sec0218 and sort in two different ways
-- Sort first by column A, then by column B
SELECT A, B
FROM sec0218
ORDER BY A ASC, B ASC;

-- Sort first by column B, then by column A
SELECT A, B
FROM sec0218
ORDER BY B ASC, A ASC;

