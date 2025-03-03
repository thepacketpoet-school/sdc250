-- Haley Archer
-- Week 5 Guided Practice: Union All, Cross Joins, and CrossTab Queries

-- (15-12) Question 1:
-- Divide the cost column into two columns: debits and credits.
-- FIX: Since TRANSACTIONS_TABLE does not exist, using L_EMPLOYEES (CREDIT_LIMIT as cost).
SELECT EMPLOYEE_ID, 
       CASE WHEN CREDIT_LIMIT < 0 THEN CREDIT_LIMIT ELSE NULL END AS DEBIT, 
       CASE WHEN CREDIT_LIMIT >= 0 THEN CREDIT_LIMIT ELSE NULL END AS CREDIT
FROM L_EMPLOYEES;

-- (15-13) Question 2: 
-- Increase the price of all foods costing more than $2.00 by 5%. 
-- Increase the price of all other foods by 10%.
SELECT MENU_ITEM, PRICE, 
       CASE 
           WHEN PRICE > 2.00 THEN PRICE * 1.05 
           ELSE PRICE * 1.10 
       END AS NEW_PRICE
FROM L_FOODS;

-- (15-14) Question 3: 
-- List the letters from 'A' to 'G' using a UNION.
SELECT 'A' AS LETTER FROM DUAL 
UNION 
SELECT 'B' FROM DUAL 
UNION 
SELECT 'C' FROM DUAL 
UNION 
SELECT 'D' FROM DUAL 
UNION 
SELECT 'E' FROM DUAL 
UNION 
SELECT 'F' FROM DUAL 
UNION 
SELECT 'G' FROM DUAL;

-- (15-15) Question 4:
-- Find the intersection of two tables (common rows in both tables).
-- FIX: TABLE_A and TABLE_B do not exist. Using L_EMPLOYEES and L_LUNCHES as examples.
SELECT EMPLOYEE_ID FROM L_EMPLOYEES
INTERSECT
SELECT EMPLOYEE_ID FROM L_LUNCHES;

-- (15-16) Question 5:
-- Find all the rows that are in one table and not in the other table.
-- Do this both ways to find all the differences.
SELECT EMPLOYEE_ID FROM L_EMPLOYEES
MINUS
SELECT EMPLOYEE_ID FROM L_LUNCHES;

SELECT EMPLOYEE_ID FROM L_LUNCHES
MINUS
SELECT EMPLOYEE_ID FROM L_EMPLOYEES;

-- (16-1) Question 6: 
-- Show an example of a CROSS JOIN.
SELECT A.EMPLOYEE_ID, B.MENU_ITEM
FROM L_EMPLOYEES A
CROSS JOIN L_FOODS B;

-- (16-3) Question 7: 
-- Create an INNER JOIN of sec1603_fruits and sec1603_colors.
-- Use the join condition f_num = c_num.
SELECT F.FRUIT, C.COLOR
FROM SEC1603_FRUITS F
INNER JOIN SEC1603_COLORS C
ON F.F_NUM = C.C_NUM;

-- (16-5) Question 8: 
-- Show an SQL error by leaving out a join condition.
-- Using the L_FOODS and L_LUNCH_ITEMS tables.
SELECT LI.LUNCH_ID, LI.SUPPLIER_ID, LI.PRODUCT_CODE, F.DESCRIPTION, F.PRICE, LI.QUANTITY
FROM L_LUNCH_ITEMS LI
JOIN L_FOODS F
ON LI.PRODUCT_CODE = F.PRODUCT_CODE
-- ERROR: Missing supplier join condition
WHERE LI.LUNCH_ID = 2;

-- (16-9) Question 9: 
-- Form a CROSS JOIN of a table with itself.
SELECT E1.EMPLOYEE_ID AS EMP1, E2.EMPLOYEE_ID AS EMP2
FROM L_EMPLOYEES E1
CROSS JOIN L_EMPLOYEES E2;

-- (16-10) Question 10: 
-- From L_EMPLOYEES, list employee details with their manager’s name and phone.
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.PHONE_NUMBER, 
       M.FIRST_NAME AS MANAGER_NAME, M.PHONE_NUMBER AS MANAGER_PHONE
FROM L_EMPLOYEES E
LEFT JOIN L_EMPLOYEES M
ON E.MANAGER_ID = M.EMPLOYEE_ID
ORDER BY E.EMPLOYEE_ID;

-- (16-11) Question 11:
-- Find the amount of time that has elapsed between one event and the next.
-- FIX: EVENTS_TABLE does not exist, replaced with L_LUNCHES (LUNCH_DATE as event timestamp).
SELECT LUNCH_ID, LUNCH_DATE, 
       LEAD(LUNCH_DATE) OVER (ORDER BY LUNCH_DATE) AS NEXT_LUNCH_DATE,
       LEAD(LUNCH_DATE) OVER (ORDER BY LUNCH_DATE) - LUNCH_DATE AS TIME_ELAPSED
FROM L_LUNCHES;

-- (16-12) Question 12:
-- Create a table with all numbers from 0 to 999 using a cross join.
-- FIX: NUM column does not exist in NUMBERS_0_TO_9, replaced with DIGIT.
CREATE TABLE NUMBERS_0_TO_999 AS
SELECT (T1.DIGIT * 10 + T2.DIGIT) AS NUMBER_VALUE
FROM NUMBERS_0_TO_9 T1
CROSS JOIN NUMBERS_0_TO_9 T2;
