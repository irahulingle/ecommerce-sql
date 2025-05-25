use e_com;
-- 1. Retrieve all customers who have placed an order in the last 30 days

SELECT DISTINCT c.*
FROM customers c
JOIN orders o ON c.id = o.customer_id
WHERE o.order_date >= CURDATE() - INTERVAL 30 DAY;

-- 2. Get the total amount of all orders placed by each customer

SELECT c.id, c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.name;

-- 3. Update the price of Product C to 45.00

SET SQL_SAFE_UPDATES = 0;
UPDATE products
SET price = 45.00
WHERE name = 'Product C';



-- 5. Retrieve the top 3 products with the highest price

SELECT * FROM products
ORDER BY price DESC
LIMIT 3;

-- 6. Get the names of customers who have ordered Product A
-- First, normalize with order_items (needed for this)
-- We’ll do that in step 5

-- 7. Join orders and customers to retrieve the customer's name and order date for each order

SELECT o.id AS order_id, c.name AS customer_name, o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.id;

-- 8. Retrieve the orders with a total amount greater than 150.00

SELECT * FROM orders
WHERE total_amount > 150.00;



-- 6 (continued). Get the names of customers who have ordered Product A
SELECT DISTINCT c.name
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
WHERE p.name = 'Product A';

-- Calculate the average total amount of all orders
SELECT AVG(total_amount) AS average_order_total
FROM orders;
