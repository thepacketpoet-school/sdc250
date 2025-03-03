-- Haley Archer

-- (15-11) Question 1:
-- List all rows and columns of L_EMPLOYEES.
-- Add a column "Old Timer" for employees hired before 2000.
-- Sort by employee_id.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE, DEPT_CODE, CREDIT_LIMIT, PHONE_NUMBER, MANAGER_ID,
       CASE 
           WHEN EXTRACT(YEAR FROM HIRE_DATE) < 2000 THEN 'Old Timer' 
           ELSE NULL 
       END AS OLD_TIMER
FROM L_EMPLOYEES
ORDER BY EMPLOYEE_ID;

-- (15-12) Question 2:
-- Divide hire date into "Old Timers" (before 2000) and "Newer Hires" (2000+).
-- Sort by last name, then first name.
SELECT LAST_NAME, FIRST_NAME, 
       CASE 
           WHEN EXTRACT(YEAR FROM HIRE_DATE) < 2000 THEN HIRE_DATE 
           ELSE NULL 
       END AS OLD_TIMERS,
       CASE 
           WHEN EXTRACT(YEAR FROM HIRE_DATE) >= 2000 THEN HIRE_DATE 
           ELSE NULL 
       END AS NEWER_HIRES
FROM L_EMPLOYEES
ORDER BY LAST_NAME, FIRST_NAME;

-- (15-13) Question 3:
-- Multiply even numbers by 2 and odd numbers by 3 from numbers_0_to_9.
SELECT DIGIT, 
       CASE  
           WHEN MOD(DIGIT, 2) = 0 THEN DIGIT * 2  
           ELSE DIGIT * 3  
       END AS RESULT 
FROM NUMBERS_0_TO_9;

-- (15-15) Question 4:
-- Find the intersection of the twos table and the threes table.
SELECT * FROM TWOS
INTERSECT
SELECT * FROM THREES;

-- (15-16) Question 5:
-- Find the difference between the twos table and the threes table (both ways).
SELECT * FROM TWOS
MINUS
SELECT * FROM THREES;

SELECT * FROM THREES
MINUS
SELECT * FROM TWOS;

-- (16-11) Question 9:
-- Find the difference between each prime number and the next in sec1611_prime_numbers.
SELECT P1.PRIME_NUMBER AS CURRENT_PRIME,  
       P2.PRIME_NUMBER AS NEXT_PRIME,  
       P2.PRIME_NUMBER - P1.PRIME_NUMBER AS DIFFERENCE 
FROM SEC1611_PRIME_NUMBERS P1 
JOIN SEC1611_PRIME_NUMBERS P2 
ON P1.SEQUENCE_ID = P2.SEQUENCE_ID - 1
ORDER BY P1.PRIME_NUMBER;
