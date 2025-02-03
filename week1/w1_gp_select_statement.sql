-- Haley Archer

-- Step 1: Retrieve employee_id, last_name, and credit_limit for employees with credit limits > 20.
SELECT employee_id, last_name, credit_limit
FROM L_EMPLOYEES
WHERE credit_limit > 20.00
ORDER BY last_name;

-- Step 2: Display employee_id, phone_number, last_name, and rename some columns.
SELECT 
    employee_id AS employee_number, 
    phone_number AS extension, 
    last_name, 
    'excellent worker' AS evaluation, 
    10 AS rating
FROM L_EMPLOYEES;

-- Step 3: Retrieve all columns from the L_EMPLOYEES table.
SELECT * FROM L_EMPLOYEES;

-- Step 4: Get a list of all distinct manager_id values.
SELECT DISTINCT manager_id FROM L_EMPLOYEES;

-- Step 5: Get a list of all distinct manager_id and credit_limit values.
SELECT DISTINCT manager_id, credit_limit FROM L_EMPLOYEES;

-- Step 6: Retrieve employees reporting to employee 203 (Martha Woods).
SELECT employee_id, first_name, last_name, manager_id, hire_date
FROM L_EMPLOYEES
WHERE manager_id = 203;

-- Step 7: Retrieve employees whose first name is Henry.
SELECT employee_id, first_name, last_name, manager_id, hire_date
FROM L_EMPLOYEES
WHERE first_name = 'Henry';

-- Step 8: Retrieve employees hired on July 1, 2008.
SELECT employee_id, first_name, last_name, manager_id, hire_date
FROM L_EMPLOYEES
WHERE hire_date = TO_DATE('2008-07-01', 'YYYY-MM-DD');

-- Step 9: Retrieve employees whose first name is Paula, renaming first_name to given_name.
SELECT employee_id, first_name AS given_name, last_name, manager_id, hire_date
FROM L_EMPLOYEES
WHERE first_name = 'Paula';

-- Step 10: Retrieve employees with a credit limit < 17.50.
SELECT employee_id, first_name, last_name, credit_limit
FROM L_EMPLOYEES
WHERE credit_limit < 17.50;

-- Step 11: Demonstrate an alternative way to use >= and NOT.
-- Standard condition: credit_limit >= 17.50
SELECT employee_id, first_name, last_name, credit_limit
FROM L_EMPLOYEES
WHERE credit_limit >= 17.50;

-- Alternative using NOT:
SELECT employee_id, first_name, last_name, credit_limit
FROM L_EMPLOYEES
WHERE NOT credit_limit < 17.50;
