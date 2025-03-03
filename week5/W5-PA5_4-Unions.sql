-- Haley Archer

-- (15-1) Question 1:
-- Maximum number of columns and rows for UNION and INNER JOIN
-- Answer:
-- UNION: Maximum columns = 10 (same structure), Maximum rows = 100,000 + 50,000 = 150,000
-- INNER JOIN: Maximum columns = 20 (all columns from both tables if no overlap), Maximum rows = at most 50,000 (assuming full match).

-- (15-1) Question 2:
-- Form a UNION of the twos table and the threes table.
SELECT NUMBER_2 AS NUM, WORD_2 AS WORD FROM TWOS
UNION
SELECT NUMBER_3, WORD_3 FROM THREES;

-- (15-2) Question 1:
-- Form a UNION ALL of the twos and threes tables.
SELECT NUMBER_2, WORD_2 FROM TWOS
UNION ALL
SELECT NUMBER_3, WORD_3 FROM THREES;

-- UNION removes duplicates, UNION ALL keeps all records including duplicates.

-- (15-3) Question 1:
-- What's wrong? The column count does not match.
-- SELECT NUMBER_2 FROM TWOS UNION SELECT NUMBER_3, WORD_3 FROM THREES;
-- FIX: Ensure same number of columns in both selects
SELECT NUMBER_2, CAST(NULL AS VARCHAR2(50)) FROM TWOS
UNION
SELECT NUMBER_3, WORD_3 FROM THREES;

-- (15-3) Goal 1:
-- Show that a union adds new data like an insert.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME FROM L_EMPLOYEES
UNION
SELECT 301, 'GAIL', 'JONES' FROM DUAL;

-- (15-3) Goal 2:
-- Modify the statement to show Carol Rose and Paula Jacobs with zero lunches.
SELECT A.FIRST_NAME, A.LAST_NAME, COUNT(B.LUNCH_ID) AS NUMBER_OF_LUNCHES
FROM L_EMPLOYEES A
INNER JOIN L_LUNCHES B ON A.EMPLOYEE_ID = B.EMPLOYEE_ID
GROUP BY A.FIRST_NAME, A.LAST_NAME
UNION
SELECT 'CAROL', 'ROSE', 0 FROM DUAL
UNION
SELECT 'PAULA', 'JACOBS', 0 FROM DUAL;

-- (15-4) Question 4:
-- Add ORDER BY clause to sort by last name using different methods
SELECT A.FIRST_NAME, A.LAST_NAME, COUNT(B.LUNCH_ID) AS NUMBER_OF_LUNCHES 
FROM L_EMPLOYEES A 
INNER JOIN L_LUNCHES B ON A.EMPLOYEE_ID = B.EMPLOYEE_ID 
GROUP BY A.FIRST_NAME, A.LAST_NAME 
UNION ALL 
SELECT 'CAROL', 'ROSE', 0 FROM DUAL 
UNION ALL 
SELECT 'PAULA', 'JACOBS', 0 FROM DUAL 
ORDER BY 2;

-- (15-5) Question 5:
-- Insert new employee into a new table using UNION ALL
CREATE TABLE SEC1505_EMPLOYEES AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPT_CODE, HIRE_DATE, CREDIT_LIMIT, PHONE_NUMBER, MANAGER_ID
FROM L_EMPLOYEES
UNION ALL
SELECT 301, 'GAIL', 'JONES', 'SAL', TO_DATE('15-FEB-2011', 'DD-MON-YYYY'), 25.00, NULL, 202 FROM DUAL;

-- (15-6) Question 6:
-- Examine datatypes of original tables and new view.
SELECT COLUMN_NAME, DATA_TYPE FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'SEC1505_EMPLOYEES';

-- (15-7) Question 7:
-- Convert all datatypes to text
SELECT TO_CHAR(DATE_1), TO_CHAR(DATE_1), TO_CHAR(DATE_1) FROM SEC1507_FIRST
UNION
SELECT TO_CHAR(NUMBER_2), WORD_2, TO_CHAR(DATE_2) FROM SEC1507_SECOND;

-- (15-8) Question 8:
-- Ensure both SELECTs have the same column count.
SELECT NUMBER_COL, TEXT_COL, DATE_COL FROM SEC1508_MORE_COLUMNS 
UNION 
SELECT NUMBER_2, WORD_2, NULL FROM TWOS;

-- (15-10) Question 9:
-- Show the source table for each row in the UNION.
SELECT NUMBER_2, WORD_2, 'TWOS' AS SOURCE FROM TWOS
UNION
SELECT NUMBER_3, WORD_3, 'THREES' FROM THREES;
