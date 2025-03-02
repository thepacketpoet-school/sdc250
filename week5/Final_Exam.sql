-- Haley Archer

-- 1) Find all courses that cost less than the average course price
SELECT DESCRIPTION, COURSE_NO, TO_CHAR(COST, '$9,999') AS COST
FROM COURSE
WHERE COST < (SELECT AVG(COST) FROM COURSE)
ORDER BY COST DESC;

-- 2) List all courses and their corresponding sections, ensuring no duplicates
SELECT DISTINCT C.COURSE_NO, C.DESCRIPTION, TO_CHAR(C.COST, '$9,999') AS COST, S.START_DATE_TIME
FROM COURSE C
JOIN SECTION S ON C.COURSE_NO = S.COURSE_NO
ORDER BY C.COURSE_NO, C.DESCRIPTION;

-- 3) Show all zip codes and the count of instructors in each zip code
SELECT Z.ZIP, COUNT(I.INSTRUCTOR_ID) AS INSTRUCTOR_COUNT
FROM ZIPCODE Z
JOIN INSTRUCTOR I ON Z.ZIP = I.ZIP
GROUP BY Z.ZIP;

-- 4) List all students that live in Brooklyn (Checking ZIP instead of CITY)
SELECT STUDENT_ID, FIRST_NAME, LAST_NAME, STREET_ADDRESS, ZIP
FROM STUDENT
WHERE ZIP IN (SELECT ZIP FROM ZIPCODE WHERE UPPER(CITY) = 'BROOKLYN')
ORDER BY LAST_NAME, FIRST_NAME;

-- 5) List all instructors and the number of sections they teach
SELECT I.FIRST_NAME, I.LAST_NAME, COUNT(S.SECTION_ID) AS NUM_SECTIONS
FROM INSTRUCTOR I
LEFT JOIN SECTION S ON I.INSTRUCTOR_ID = S.INSTRUCTOR_ID
GROUP BY I.FIRST_NAME, I.LAST_NAME
ORDER BY NUM_SECTIONS DESC;

-- 6) List all students who live in the same zipcode as instructor Tom Wojick
SELECT S.FIRST_NAME, S.LAST_NAME, S.STREET_ADDRESS, S.ZIP
FROM STUDENT S
WHERE S.ZIP = (SELECT ZIP FROM INSTRUCTOR WHERE UPPER(FIRST_NAME) = 'TOM' AND UPPER(LAST_NAME) = 'WOJICK')
AND EXISTS (SELECT 1 FROM INSTRUCTOR WHERE UPPER(FIRST_NAME) = 'TOM' AND UPPER(LAST_NAME) = 'WOJICK');

-- 7) List all students who registered before Vera Wetcel (Ensuring Vera Exists)
SELECT STUDENT_ID, SALUTATION, FIRST_NAME, LAST_NAME
FROM STUDENT
WHERE REGISTRATION_DATE < (SELECT REGISTRATION_DATE FROM STUDENT WHERE UPPER(FIRST_NAME) = 'VERA' AND UPPER(LAST_NAME) = 'WETCEL')
AND EXISTS (SELECT 1 FROM STUDENT WHERE UPPER(FIRST_NAME) = 'VERA' AND UPPER(LAST_NAME) = 'WETCEL');

-- 8) Find all students who haven't enrolled in any classes
SELECT STUDENT_ID
FROM STUDENT
WHERE STUDENT_ID NOT IN (SELECT DISTINCT STUDENT_ID FROM ENROLLMENT);

-- 9) Create a view called all_people_view listing all students and instructors
CREATE VIEW ALL_PEOPLE_VIEW AS
SELECT SALUTATION, FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME, STREET_ADDRESS, ZIP, PHONE
FROM STUDENT
UNION
SELECT SALUTATION, FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME, STREET_ADDRESS, ZIP, PHONE
FROM INSTRUCTOR;

-- 10) Show the student who got the highest grade (Fixing grade column reference)
SELECT S.FIRST_NAME, S.LAST_NAME, S.STUDENT_ID
FROM STUDENT S
JOIN ENROLLMENT E ON S.STUDENT_ID = E.STUDENT_ID
WHERE E.FINAL_GRADE = (SELECT MAX(FINAL_GRADE) FROM ENROLLMENT);

-- 11) List all courses that have more than 5 sections
SELECT C.COURSE_NO, C.DESCRIPTION, COUNT(S.SECTION_ID) AS NUM_SECTIONS
FROM COURSE C
JOIN SECTION S ON C.COURSE_NO = S.COURSE_NO
GROUP BY C.COURSE_NO, C.DESCRIPTION
HAVING COUNT(S.SECTION_ID) > 5;

-- 12) List all courses and their prerequisites (Fixing missing table issue)
SELECT C.COURSE_NO, C.DESCRIPTION, TO_CHAR(C.COST, '$9,999') AS COST,  
       P.COURSE_NO AS PRE_COURSE_NO, P.DESCRIPTION AS PREREQUISITE_DESCRIPTION 
FROM COURSE C  
LEFT JOIN COURSE P ON C.PREREQUISITE = P.COURSE_NO 
WHERE C.PREREQUISITE IS NOT NULL;

-- 13) List the course(s) with the most sections
SELECT COURSE_NO, DESCRIPTION, NUM_SECTIONS
FROM (
    SELECT C.COURSE_NO, C.DESCRIPTION, COUNT(S.SECTION_ID) AS NUM_SECTIONS,
           RANK() OVER (ORDER BY COUNT(S.SECTION_ID) DESC) AS RANKING
    FROM COURSE C
    JOIN SECTION S ON C.COURSE_NO = S.COURSE_NO
    GROUP BY C.COURSE_NO, C.DESCRIPTION
) WHERE RANKING = 1;

-- 14) List all courses where the number of students enrolled exceeds capacity
SELECT C.COURSE_NO, C.DESCRIPTION, S.START_DATE_TIME, S.CAPACITY, COUNT(E.STUDENT_ID) AS ENROLLED_STUDENTS
FROM COURSE C
JOIN SECTION S ON C.COURSE_NO = S.COURSE_NO
JOIN ENROLLMENT E ON S.SECTION_ID = E.SECTION_ID
GROUP BY C.COURSE_NO, C.DESCRIPTION, S.START_DATE_TIME, S.CAPACITY
HAVING COUNT(E.STUDENT_ID) > S.CAPACITY;
