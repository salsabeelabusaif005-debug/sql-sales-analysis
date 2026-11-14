-- ============================================
-- Sales Analysis Project - Analysis Queries
-- Run 01_setup.sql first.
-- ============================================

USE sales_analysis;

-- 1. Total revenue
SELECT SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id;

-- 2. Revenue per day
SELECT o.order_date,
       SUM(o.quantity * p.price) AS daily_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY o.order_date
ORDER BY o.order_date;

-- 3. Revenue per month
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month,
       SUM(o.quantity * p.price)          AS monthly_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY month
ORDER BY month;

-- 4. Revenue per product category
SELECT p.category,
       SUM(o.quantity * p.price) AS category_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;

-- 5. Top 3 customers by total spending
SELECT c.name,
       c.city,
       SUM(o.quantity * p.price) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products  p ON o.product_id  = p.product_id
GROUP BY c.customer_id, c.name, c.city
ORDER BY total_spent DESC
LIMIT 3;

-- 6. Best-selling product by quantity sold
SELECT p.product_name,
       SUM(o.quantity) AS units_sold
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY units_sold DESC;

-- 7. Customers who never placed an order
SELECT c.name, c.city
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 8. Customers who spent more than the average customer
SELECT c.name,
       SUM(o.quantity * p.price) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products  p ON o.product_id  = p.product_id
GROUP BY c.customer_id, c.name
HAVING total_spent > (
    SELECT AVG(customer_total) FROM (
        SELECT SUM(o2.quantity * p2.price) AS customer_total
        FROM orders o2
        JOIN products p2 ON o2.product_id = p2.product_id
        GROUP BY o2.customer_id
    ) AS totals
)
ORDER BY total_spent DESC;
