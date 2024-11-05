# SQL-Portfolio
A SQL- based data analysis project on e-commerce data for a tech gadgets company

### Table of Contents

 - [Project Overview](#project-overview)
 - [Data Source](#data-source)
 - [Tools Used](#tools-used)
 - [Data Cleaning and Preparation](#data-cleaning-and-preparation)
 - [Exploratory Data Analysis](#exploratory-data-analysis)
 - [SQL Queries](#sql-queries)
 - [Findings](#findings)
 - [Recommendations](#recommendations)
 - [Limitations](#limitations)

   
## Project Overview
This project analyzes an e-commerce dataset for a tech gadgets company to deliver insights into customer behavior, sales trends, products popularity and payment method. Using SQL, I organized and queried data to identify actionable insights that can inform marketing, inventory and operational decisions, making the business more data driven.


## Data Source

The dataset was synthetically created to resemble real-world e-commerce data, capturing various aspects of the business, including customer information, orders, products and payment records. The project uses tables including: 
- Customer: customer details such as customer_id, name, email and date_created
- Products: product_id, product_name, price and stock
- Orders: order_id, customer_id and order_date
- Order_details: order_id, product_id and quantity
- Payment: payment_id, order_id, product_id and quantity

  
## Tools Used

- PostgreSQL: for database management, data cleaning and analysis
- DataCamp: Platform for learning AI and Data related courses and gaining hands-on experience.


## Data Cleaning and Preparation

To prepare the data analysis, I:
1. Used CREATE TABLE and INSERT INTO statements to set up the database schema and populate tables.
2. Ensured referential integrity by linking tables through foreign keys such as customer_id, product_id.
3. Checked for and addressed missing or inconsistent data where applicable.
4. Verified data types for accurate querying and aggregation.


## Exploratory Data Analysis

I conducted exploratory analysis to understand the dataset and gain insights. Key SQL queries included:
- Aggregating customer order frequency and revenue.
- Identifying top 5 products by sales volume and peak sales periods.
- Analyzing payment methods used and amounts per products.
- Querying for seasonal sales trends using date filter.


## SQL Queries
```
 -- Retrieve all orders with customer information
SELECT  o.order_id, c.first_name, c.last_name, c.email, o.order_date
FROM orders AS o
JOIN customers AS c
ON o.customer_id = c.customer_id;
```

![Tech Gadget Analysis 1](https://github.com/user-attachments/assets/1dc77dd5-ccf7-443a-a8ed-118cc9072521)

```
-- Caculate revenue per products
SELECT p.product_name, SUM(od.quantity) AS total_quantity_sold, SUM(od.quantity * p.price) AS revenue
FROM order_details AS od
JOIN products AS p
on od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;
```

![Tech Gadget Analysis 2](https://github.com/user-attachments/assets/63535f42-83ce-498f-b5bd-406f0fdaf4d6)

```
--Calculate total_amount per customer
SELECT c.first_name, c.last_name, SUM(p.amount_paid) AS total_amount
FROM customers AS c
JOIN orders AS o 
ON c.customer_id = o.customer_id
JOIN payment AS p
ON o.order_id = p.order_id
GROUP BY c.first_name, c.last_name
ORDER BY total_amount DESC;
```

![Tech Gadget Analysis 4](https://github.com/user-attachments/assets/656ee326-13a8-4b4f-9622-86eb1d72a828)

```
--To list all orders and their products
SELECT o.order_id, o.order_date, p.product_name,od.quantity
FROM orders AS o
JOIN order_details AS od 
ON o.order_id = od.order_id
JOIN products AS p 
ON od.product_id = p.product_id
ORDER BY o.order_id;
```

![Tech Gadget Analysis 5](https://github.com/user-attachments/assets/83cfa215-def9-4b0c-9202-d6b717ee7a70)

```
--Check stock levels for each products
SELECT 	product_name, stock
FROM products
ORDER BY stock ASC;
```

![Tech Gadget Analysis 6](https://github.com/user-attachments/assets/d016bf80-bd71-4d88-90ed-3fe54c420919)

```
--Identify Top 5 best-selling products
SELECT p.product_name, SUM(od.quantity) AS total_quantity_sold
FROM products AS p
JOIN order_details AS od
ON p.product_id = od.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold
LIMIT 5;
```

![Tech Gadget Analysis 7](https://github.com/user-attachments/assets/cef628b3-99e4-4451-861d-01d731d0bbf8)



```
--Monthly sales report
SELECT DATE_TRUNC('month', p.payment_date) AS month, SUM(p.amount_paid) AS total_sales
FROM payment AS p
GROUP BY month
ORDER BY month;
```

![Screenshot (229)](https://github.com/user-attachments/assets/2804edd7-06ac-4a0e-b8a9-d024f8bfb07f)

```
--Pending orders(Unpaid)
SELECT o.order_id, o.order_date, c.first_name, c.last_name
FROM orders AS o
JOIN customers AS c
ON o.customer_id = c.customer_id
LEFT JOIN payment AS p
ON o.order_id = p.order_id
WHERE p.payment_id IS NULL;
 ```

![Tech Gadget Analysis 8](https://github.com/user-attachments/assets/35c39537-1495-4b56-be58-b625cd0a8c7a)


## Findings

- Customer Analysis: I dentified high-value customers based on order frequency.
- Product Performance: Determined top 5 tech gadgets with the highest sales volume, highlighting items for priority restocking.
- Order Trends: Observed peak ordering times and seasonal patterns.
- Payment Insights: Found a preference for certain payment methods, informing potential improvements to the checkout process.

## Recommendations

1. Customer Retention: Implement loyalty program targeting high-value customers.
2. Inventory Management: Prioritize top-selling products to avoid stockout.
3. Marketing Campaigns: Launch promotions during identified peak periods to maximize sales.
4. Pyment Options: Consider optimizing for popular payment methods to streamline the checkout experience.


## Limitations

- The dataset is synthetic and may not capture all complexities of a real-world e-commerce business.
- Certain data points like customer demographics or location were not included, limiting segmentation analysis.
-  Analysis was limited to SQL, future work could incorporate visualization tools for a more interactive analysis.


## Contact 

- [Email](https://myaccount.google.com/) funmyshow@gmail.com
- [Additional portfolio](https://www.datacamp.com/portfolio/funmyshow)
- [Phone Number](08146696383) 08146696383
- [Connect on LinkedIn here](https://www.linkedin.com/in/funmilayo-shodimu)
