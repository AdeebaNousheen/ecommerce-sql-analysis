USE ecommerce_db;

-- 1️⃣ Total Revenue
SELECT SUM(p.price * oi.quantity) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

-- 2️⃣ Revenue by Category
SELECT p.category,
       SUM(p.price * oi.quantity) AS revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- 3️⃣ Top Selling Product
SELECT p.product_name,
       SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 1;

-- 4️⃣ Repeat Customers
SELECT c.name,
       COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name

HAVING total_orders > 1;
