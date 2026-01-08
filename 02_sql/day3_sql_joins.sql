/* =========================================================
   DAY 3: SQL JOINS – BUSINESS ANALYTICS (LIMIT-SAFE)
   Database: de_bootcamp
   Tables:
     - users (10 rows)
     - products (500 rows)
     - orders (500 rows)
   ========================================================= */


/* ---------------------------------------------------------
   1. TOTAL ORDERS PER USER
   - LEFT JOIN keeps users with zero orders
   - LIMIT is not strictly needed (only 10 users)
   --------------------------------------------------------- */
SELECT 
    u.user_id,
    u.name,
    COUNT(o.order_id) AS total_orders
FROM users u
LEFT JOIN orders o 
    ON u.user_id = o.user_id
GROUP BY u.user_id, u.name
ORDER BY total_orders DESC
LIMIT 10;


/* ---------------------------------------------------------
   2. TOTAL REVENUE PER USER
   - Shows how much money each user spent
   - LIMIT keeps output small and readable
   --------------------------------------------------------- */
SELECT 
    u.user_id,
    u.name,
    SUM(o.quantity * p.price) AS total_spent
FROM orders o
JOIN users u 
    ON o.user_id = u.user_id
JOIN products p 
    ON o.product_id = p.product_id
GROUP BY u.user_id, u.name
ORDER BY total_spent DESC
LIMIT 10;


/* ---------------------------------------------------------
   3. TOP 10 BEST-SELLING PRODUCTS
   - Very common interview + business query
   --------------------------------------------------------- */
SELECT 
    p.product_id,
    p.name AS product_name,
    SUM(o.quantity) AS total_units_sold
FROM orders o
JOIN products p 
    ON o.product_id = p.product_id
GROUP BY p.product_id, p.name
ORDER BY total_units_sold DESC
LIMIT 10;


/* ---------------------------------------------------------
   4. DAILY REVENUE TREND (RECENT 30 DAYS)
   - LIMIT avoids large historical output
   --------------------------------------------------------- */
SELECT 
    o.order_date,
    SUM(o.quantity * p.price) AS daily_revenue
FROM orders o
JOIN products p 
    ON o.product_id = p.product_id
GROUP BY o.order_date
ORDER BY o.order_date DESC
LIMIT 30;


/* ---------------------------------------------------------
   5. USERS WHO NEVER PLACED AN ORDER
   - LEFT JOIN + NULL check
   - Small result set, but LIMIT added for safety
   --------------------------------------------------------- */
SELECT 
    u.user_id,
    u.name
FROM users u
LEFT JOIN orders o 
    ON u.user_id = o.user_id
WHERE o.order_id IS NULL
LIMIT 10;


/* ---------------------------------------------------------
   6. AVERAGE ORDER VALUE (AOV)
   - Subquery computes value per order
   - Outer query averages it
   - Single-row result (LIMIT optional)
   --------------------------------------------------------- */
SELECT 
    AVG(order_total) AS avg_order_value
FROM (
    SELECT 
        o.order_id,
        SUM(o.quantity * p.price) AS order_total
    FROM orders o
    JOIN products p 
        ON o.product_id = p.product_id
    GROUP BY o.order_id
) t
LIMIT 1;


/* ---------------------------------------------------------
   7. MOST EXPENSIVE SINGLE ORDER
   - Finds highest-value order
   --------------------------------------------------------- */
SELECT 
    o.order_id,
    SUM(o.quantity * p.price) AS order_value
FROM orders o
JOIN products p 
    ON o.product_id = p.product_id
GROUP BY o.order_id
ORDER BY order_value DESC
LIMIT 1;


/* ---------------------------------------------------------
   8. ORDERS COUNT PER DAY (RECENT 30 DAYS)
   --------------------------------------------------------- */
SELECT 
    order_date,
    COUNT(order_id) AS orders_count
FROM orders
GROUP BY order_date
ORDER BY order_date DESC
LIMIT 30;


/* ---------------------------------------------------------
   9. USERS WITH MORE THAN 5 ORDERS
   - HAVING filters after aggregation
   --------------------------------------------------------- */
SELECT 
    u.user_id,
    u.name,
    COUNT(o.order_id) AS total_orders
FROM users u
JOIN orders o 
    ON u.user_id = o.user_id
GROUP BY u.user_id, u.name
HAVING COUNT(o.order_id) > 5
ORDER BY total_orders DESC
LIMIT 10;


/* ---------------------------------------------------------
   10. PRODUCTS THAT WERE NEVER ORDERED
   - Important for inventory/business decisions
   --------------------------------------------------------- */
SELECT 
    p.product_id,
    p.name
FROM products p
LEFT JOIN orders o 
    ON p.product_id = o.product_id
WHERE o.order_id IS NULL
LIMIT 20;


/* ---------------------------------------------------------
   11. TOTAL REVENUE PER PRODUCT (TOP 20)
   --------------------------------------------------------- */
SELECT 
    p.product_id,
    p.name,
    SUM(o.quantity * p.price) AS product_revenue
FROM orders o
JOIN products p 
    ON o.product_id = p.product_id
GROUP BY p.product_id, p.name
ORDER BY product_revenue DESC
LIMIT 20;


/* ---------------------------------------------------------
   12. AVERAGE QUANTITY PER ORDER
   - Measures average basket size
   --------------------------------------------------------- */
SELECT 
    AVG(quantity) AS avg_items_per_order
FROM orders
LIMIT 1;


/* =========================================================
   END OF DAY 3 – SQL JOINS (LIMIT SAFE)
   ========================================================= */
