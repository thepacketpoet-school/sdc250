-- W4_GP_InnerJoins2_Archer.sql
-- Haley Archer

-- (13-10) Question 1
SELECT f.F_NUM_1, f.F_NUM_2, f.FRUIT, c.C_NUM_1, c.C_NUM_2, c.COLOR 
FROM sec1310_fruits f  
INNER JOIN sec1310_colors c  
ON f.F_NUM_1 = c.C_NUM_1 AND f.F_NUM_2 = c.C_NUM_2

-- (13-11) Question 2
SELECT s.STUDENT_NAME, g.LETTER_GRADE  
FROM SEC1311_STUDENT_SCORES s 
JOIN SEC1311_GRADE_RANGES g  
ON s.TEST_SCORE BETWEEN g.BEGINNING_SCORE AND g.ENDING_SCORE

-- (13-12) Question 3
SELECT b.LARGER_NUMBER, s.SMALLER_NUMBER 
FROM sec1312_bigger_numbers b 
INNER JOIN sec1312_smaller_numbers s 
ON s.SMALLER_NUMBER < b.LARGER_NUMBER

-- (13-14) Question 4
SELECT * 
FROM sec1314_fruits f
JOIN sec1314_colors c
ON f.f_num = c.c_num;

-- (13-15) Question 5
SELECT e.employee_id, e.first_name, e.last_name, e.dept_code, d.department_name
FROM L_EMPLOYEES e
INNER JOIN L_DEPARTMENTS d
ON e.dept_code = d.dept_code
ORDER BY e.employee_id;

-- (13-17) Question 6
SELECT e.employee_id, e.first_name, e.last_name, COUNT(l.lunch_id) AS number_of_lunches
FROM L_EMPLOYEES e
INNER JOIN L_LUNCHES l ON e.employee_id = l.employee_id
WHERE e.employee_id <> 208
GROUP BY e.employee_id, e.first_name, e.last_name;

-- (13-18) Question 7
SELECT column_name
FROM all_cons_columns
WHERE table_name = 'L_FOODS' AND constraint_name = (
    SELECT constraint_name FROM all_constraints
    WHERE table_name = 'L_FOODS' AND constraint_type = 'P'
);

-- (13-19) Question 8
SELECT e.employee_id, e.first_name, e.last_name, l.lunch_date, f.description, li.quantity 
FROM L_EMPLOYEES e 
INNER JOIN L_LUNCHES l ON e.employee_id = l.employee_id 
INNER JOIN L_LUNCH_ITEMS li ON l.lunch_id = li.lunch_id 
INNER JOIN L_FOODS f ON li.product_code = f.product_code 
WHERE e.dept_code = (SELECT dept_code FROM L_DEPARTMENTS WHERE department_name = 'SHIPPING') 
ORDER BY e.employee_id, l.lunch_date