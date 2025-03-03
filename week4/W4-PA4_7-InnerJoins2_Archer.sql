-- Week 4 Performance Assessment: Inner Joins Part 2
-- Haley Archer

-- (13-10) Question 1: 
-- Write a select statement to create the inner join of tables sec1310_table1 and sec1310_table2.
-- The join condition should say that the first three columns of these tables are equal.
SELECT t1.M1, t1.M2, t1.M3, t1.ADJECTIVE, t2.ANIMAL
FROM SEC1310_TABLE1 t1
INNER JOIN SEC1310_TABLE2 t2
ON t1.M1 = t2.M1 AND t1.M2 = t2.M2 AND t1.M3 = t2.M3;

-- (13-11) Question 2: 
-- A large dictionary has four volumes. Table sec1311_dictionary shows the range of words that are in each volume.
-- Table sec1311_words contains some words that are in the dictionary. Write SQL to determine which volume of the dictionary contains each of these words.
SELECT w.WORD, d.DICTIONARY_VOLUME
FROM SEC1311_WORDS w
INNER JOIN SEC1311_DICTIONARY d
ON w.WORD BETWEEN d.BEGINNING_LETTER AND d.ENDING_LETTER;

-- (13-12) Question 3: 
-- List all the letters that are greater than S. Use the alphabet table. Put these letters in order.
SELECT letter
FROM alphabet
WHERE letter > 'S'
ORDER BY letter;

-- (13-13) Question 4: 
-- Tables sec1313_words1 and sec1313_words2 contain words.
-- Join these tables together when the words end in the same letter.
SELECT w1.word AS word1, w2.word AS word2
FROM sec1313_words1 w1
INNER JOIN sec1313_words2 w2
ON SUBSTR(w1.word, -1) = SUBSTR(w2.word, -1);

-- (13-14) Question 5: 
-- Change this SQL, writing the join condition in the from clause.
SELECT a.student_name, a.test_score, b.letter_grade
FROM sec1311_student_scores a
JOIN sec1311_grade_ranges b
ON a.test_score BETWEEN b.beginning_score AND b.ending_score
ORDER BY a.student_name;

-- (13-15) Question 6: 
-- Write a select statement to list all the foods on the lunch menu and show the full name of the supplier of each food.
SELECT f.description AS food_item, s.supplier_name
FROM L_FOODS f
INNER JOIN L_SUPPLIERS s
ON f.supplier_id = s.supplier_id;

-- (13-16) Question 7: 
-- Demonstrate that a select statement can be separated into two parts:
-- The first part joins the tables and creates a new table, and the second part restricts the amount of data that is shown.
-- Step 1: Create the joined table
CREATE VIEW food_suppliers AS
SELECT f.description, s.supplier_name
FROM L_FOODS f
INNER JOIN L_SUPPLIERS s
ON f.supplier_id = s.supplier_id;

-- Step 2: Restrict the data shown
SELECT * FROM food_suppliers
WHERE description LIKE '%SALAD%';

-- (13-17) Question 8: 
-- List all the foods on the menu and the total number of orders for each food item.
SELECT f.description AS food_item, COUNT(l.product_code) AS total_orders
FROM L_FOODS f
LEFT JOIN L_LUNCH_ITEMS l
ON f.supplier_id = l.supplier_id AND f.product_code = l.product_code
GROUP BY f.description
ORDER BY total_orders DESC;

-- (13-19) Question 9:
-- Join all the tables of the lunches database together (Anything table starting with L_).
-- Show only the most relevant columns to avoid excessive duplication.
SELECT 
    e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME, e.DEPT_CODE, 
    l.LUNCH_ID, l.LUNCH_DATE, 
    li.ITEM_NUMBER, li.QUANTITY, 
    f.MENU_ITEM, f.PRICE
FROM L_EMPLOYEES e
JOIN L_LUNCHES l ON e.EMPLOYEE_ID = l.EMPLOYEE_ID
JOIN L_LUNCH_ITEMS li ON l.LUNCH_ID = li.LUNCH_ID
JOIN L_FOODS f ON li.SUPPLIER_ID = f.SUPPLIER_ID AND li.PRODUCT_CODE = f.PRODUCT_CODE
ORDER BY e.EMPLOYEE_ID, l.LUNCH_DATE;
-- Count the total number of columns
SELECT COUNT(*) AS TOTAL_COLUMNS
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME IN ('L_EMPLOYEES', 'L_LUNCHES', 'L_LUNCH_ITEMS', 'L_FOODS');
