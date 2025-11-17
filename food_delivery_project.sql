-- ================================================
-- FOOD DELIVERY SQL PROJECT
-- Dataset: Customers, Restaurants, Partners, Orders, Order_Details
-- ================================================

USE food_delivery;

-- ================================================
-- 1. BASIC QUERIES (BEGINNER)
-- 

-- Q1: Show all custo================================================mers
SELECT * FROM Customers;

-- Q2: Show all restaurants
SELECT * FROM Restaurants;

-- Q3: Show all delivery partners
SELECT * FROM Delivery_Partners;

-- Q4: Show all orders
SELECT * FROM Orders;

-- Q5: Show all food items ordered
SELECT * FROM Order_Details;

-- Q6: Count number of customers
SELECT COUNT(*) AS total_customers FROM Customers;

-- Q7: Show all customers from Kochi
SELECT * FROM Customers WHERE city = 'Kochi';

-- Q8: Show restaurants with rating above 4.2
SELECT * FROM Restaurants WHERE rating > 4.2;

-- Q9: Sort customers by join date
SELECT * FROM Customers ORDER BY join_date;

-- Q10: Show orders above 300 rupees
SELECT * FROM Orders WHERE order_amount > 300;


-- ================================================
-- 2. INTERMEDIATE QUERIES (JOIN + GROUP BY)
-- ================================================

-- Q11: Show orders with customer names
SELECT o.order_id, c.customer_name, o.order_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id;

-- Q12: Show each restaurant for each order
SELECT o.order_id, r.restaurant_name, o.order_amount
FROM Orders o
JOIN Restaurants r ON o.restaurant_id = r.restaurant_id;

-- Q13: Show delivery partner for each order
SELECT o.order_id, p.partner_name, p.rating
FROM Orders o
JOIN Delivery_Partners p ON o.partner_id = p.partner_id;

-- Q14: Count total orders for each customer
SELECT c.customer_name, COUNT(*) AS total_orders
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_name;

-- Q15: Count total orders for each restaurant
SELECT r.restaurant_name, COUNT(*) AS total_orders
FROM Orders o
JOIN Restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name;

-- Q16: Show average delivery time
SELECT AVG(delivery_time_mins) AS avg_delivery_time FROM Orders;

-- Q17: Fastest 3 deliveries
SELECT * FROM Orders ORDER BY delivery_time_mins ASC LIMIT 3;

-- Q18: Highest 3 order amounts
SELECT * FROM Orders ORDER BY order_amount DESC LIMIT 3;

-- Q19: Show customers and total amount spent
SELECT c.customer_name, SUM(o.order_amount) AS total_spent
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_name;

-- Q20: Show food items and total count ordered
SELECT food_item, COUNT(*) AS times_ordered
FROM Order_Details
GROUP BY food_item
ORDER BY times_ordered DESC;


-- ================================================
-- 3. ADVANCED ANALYTICAL QUERIES
-- ================================================

-- Q21: Which restaurant earned the highest revenue?
SELECT r.restaurant_name, SUM(o.order_amount) AS total_revenue
FROM Orders o
JOIN Restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
ORDER BY total_revenue DESC
LIMIT 1;

-- Q22: Most valuable customer (highest spending)
SELECT c.customer_name, SUM(o.order_amount) AS total_spent
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 1;

-- Q23: Most active delivery partner (max deliveries)
SELECT p.partner_name, COUNT(*) AS deliveries
FROM Orders o
JOIN Delivery_Partners p ON o.partner_id = p.partner_id
GROUP BY p.partner_name
ORDER BY deliveries DESC;

-- Q24: Which city has most customers?
SELECT city, COUNT(*) AS customer_count
FROM Customers
GROUP BY city
ORDER BY customer_count DESC;

-- Q25: Most ordered food item
SELECT food_item, COUNT(*) AS times_ordered
FROM Order_Details
GROUP BY food_item
ORDER BY times_ordered DESC
LIMIT 1;