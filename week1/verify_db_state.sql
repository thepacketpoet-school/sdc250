-- SQL script to verify the current database state for VaporGames

-- Step 1: Check which users have access to the database
SELECT USER_ID, USERNAME, CREATED, PASSWORD_CHANGE_DATE 
FROM USER_USERS;

-- Step 2: Check what tables are present in the database
SELECT * FROM USER_TABLES;

-- Step 3: Examine the structure of key tables
DESCRIBE ORDERS;
DESCRIBE PRODUCTLIST;
DESCRIBE REVIEWS;
DESCRIBE STOREFRONT;
DESCRIBE USERBASE;
DESCRIBE USERLIBRARY;

-- Step 4: Display all data from each table
SELECT * FROM ORDERS;
SELECT * FROM PRODUCTLIST;
SELECT * FROM REVIEWS;
SELECT * FROM STOREFRONT;
SELECT * FROM USERBASE;
SELECT * FROM USERLIBRARY;

-- Step 5: Check database constraints
SELECT TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE, STATUS 
FROM USER_CONSTRAINTS;

-- Step 6: Check database views
SELECT VIEW_NAME, TEXT 
FROM USER_VIEWS;

-- Step 7: Retrieve every username in alphabetical order
SELECT USERNAME 
FROM USERBASE 
ORDER BY USERNAME ASC;

-- Step 8: Find users with Yahoo email addresses
SELECT FIRSTNAME, LASTNAME, USERNAME, PASSWORD, EMAIL 
FROM USERBASE 
WHERE EMAIL LIKE '%@yahoo.com';

-- Step 9: Find users with less than $25 in wallet funds
SELECT USERNAME, BIRTHDAY, WALLETFUNDS 
FROM USERBASE 
WHERE WALLETFUNDS < 25;

-- Step 10: Retrieve users who have played more than 100 hours
SELECT USERID, PRODUCTCODE 
FROM USERLIBRARY 
WHERE HOURSPLAYED > 100;

-- Step 11: Retrieve games that have been played for less than 10 hours
SELECT PRODUCTCODE 
FROM USERLIBRARY 
WHERE HOURSPLAYED < 10;

-- Step 12: Retrieve all unique publishers
SELECT DISTINCT PUBLISHER 
FROM PRODUCTLIST;

-- Step 13: Display all products sorted by genre
SELECT PRODUCTNAME, RELEASEDATE, PUBLISHER, GENRE 
FROM PRODUCTLIST 
ORDER BY GENRE ASC;

-- Step 14: Find products in the ‘Strategy’ genre
SELECT PRODUCTCODE, PUBLISHER 
FROM PRODUCTLIST 
WHERE GENRE = 'Strategy';

-- Step 15: Retrieve all products that cost more than $25, sorted from highest to lowest price
SELECT PRODUCTCODE, DESCRIPTION, PRICE 
FROM PRODUCTLIST 
WHERE PRICE > 25 
ORDER BY PRICE DESC;

-- Step 16: Retrieve storefront inventory sorted by lowest price first
SELECT INVENTORYID, PRICE 
FROM STOREFRONT 
ORDER BY PRICE ASC;

-- Step 17: Retrieve all reviews with a rating of 1
SELECT PRODUCTCODE, REVIEW 
FROM REVIEWS 
WHERE RATING = 1;

-- Step 18: Retrieve all reviews with a rating of 4 or higher
SELECT PRODUCTCODE, REVIEW 
FROM REVIEWS 
WHERE RATING >= 4;

-- Step 19: Retrieve every unique user ID from users who have placed an order
SELECT DISTINCT USERID 
FROM ORDERS;

-- Step 20: Retrieve all orders sorted by earliest purchase date
SELECT * 
FROM ORDERS 
ORDER BY PURCHASEDATE ASC;
