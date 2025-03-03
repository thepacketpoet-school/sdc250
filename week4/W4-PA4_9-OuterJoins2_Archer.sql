-- Week 4 Performance Assessment: Outer Joins Part 2
-- Haley Archer

-- (14-8) Question 1:
-- The following select statement shows the number of orders for each food on the menu.
-- Modify the SQL so the result table shows that there are no orders for broccoli.
SELECT a.description AS food_item,
       COALESCE(SUM(b.quantity), 0) AS number_of_orders
FROM L_FOODS a
LEFT JOIN L_LUNCH_ITEMS b
ON a.supplier_id = b.supplier_id
AND a.product_code = b.product_code
GROUP BY a.description
ORDER BY a.description;

-- (14-12) Question 2:
-- The table sec1412_departments is similar to the L_DEPARTMENTS table,
-- except that a few rows have been added, deleted, or changed.
-- Find all the differences between the two tables.
SELECT * FROM sec1412_departments
MINUS
SELECT * FROM L_DEPARTMENTS;

SELECT * FROM L_DEPARTMENTS
MINUS
SELECT * FROM sec1412_departments;
