--Retrieve all orders with customer information
SELECT  o.order_id, c.first_name, c.last_name, c.email, o.order_date
FROM orders AS o
JOIN customers AS c
ON o.customer_id = c.customer_id;


--Calculate revenue per products
SELECT p.product_name, SUM(od.quantity) AS total_quantity_sold, SUM(od.quantity * p.price) AS revenue
FROM order_details AS od
JOIN products AS p
on od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;


--Calculate total_amount per customer
SELECT c.first_name, c.last_name, SUM(p.amount_paid) AS total_amount
FROM customers AS c
JOIN orders AS o 
ON c.customer_id = o.customer_id
JOIN payment AS p
ON o.order_id = p.order_id
GROUP BY c.first_name, c.last_name
ORDER BY total_amount DESC;


--To list all orders and their products
SELECT o.order_id, o.order_date, p.product_name,od.quantity
FROM orders AS o
JOIN order_details AS od 
ON o.order_id = od.order_id
JOIN products AS p 
ON od.product_id = p.product_id
ORDER BY o.order_id;


--Check stock levels for each products
SELECT 	product_name, stock
FROM products
ORDER BY stock ASC;

--Identify Top 5 best-selling products
SELECT p.product_name, SUM(od.quantity) AS total_quantity_sold
FROM products AS p
JOIN order_details AS od
ON p.product_id = od.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold
LIMIT 5;


--Monthly sales report
SELECT DATE_TRUNC('month', p.payment_date) AS month, SUM(p.amount_paid) AS total_sales
FROM payment AS p
GROUP BY month
ORDER BY month;

--Pending orders(Unpaid)
SELECT o.order_id, o.order_date, c.first_name, c.last_name
FROM orders AS o
JOIN customers AS c
ON o.customer_id = c.customer_id
LEFT JOIN payment AS p
ON o.order_id = p.order_id
WHERE p.payment_id IS NULL;