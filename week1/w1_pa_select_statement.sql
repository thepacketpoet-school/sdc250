-- Haley Archer

-- Question 1: List the description and price of all the foods. Rename columns.
SELECT description AS food_item, price AS cost
FROM L_FOODS;

-- Question 2: List all columns and all rows of the L_FOODS table.
SELECT * FROM L_FOODS;

-- Question 3: List all distinct supplier_id values from the L_FOODS table.
SELECT DISTINCT supplier_id FROM L_FOODS;

-- Question 4: List all distinct values in columns A and B of the sec0207 table.
SELECT DISTINCT A, B FROM sec0207;

-- Question 5: List first name and last name of employees with first name 'Nancy'.
SELECT first_name, last_name 
FROM L_EMPLOYEES 
WHERE first_name = 'Nancy';

-- Question 6: List first name and last name of employees with employee_id >= 205.
SELECT first_name, last_name 
FROM L_EMPLOYEES 
WHERE employee_id >= 205;

-- Question 7 (Three Different Ways)
SELECT first_name, last_name 
FROM L_EMPLOYEES 
WHERE employee_id <> 205;

