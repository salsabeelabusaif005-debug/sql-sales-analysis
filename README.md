# Sales Analysis with SQL

A small SQL project that analyzes sales data for a fictional store using MySQL. It answers common business questions such as total revenue, best-selling products, top customers, and monthly trends.

## Tools
- MySQL
- MySQL Workbench

## Database Structure
- `customers` (customer_id, name, city)
- `products` (product_id, product_name, category, price)
- `orders` (order_id, customer_id, product_id, quantity, order_date)

## Questions Answered
1. What is the total revenue?
2. What is the revenue per day and per month?
3. Which product category earns the most?
4. Who are the top 3 customers?
5. Which product sells the most units?
6. Which customers never ordered?
7. Which customers spend more than the average customer?

## SQL Concepts Used
`JOIN` · `LEFT JOIN` · `GROUP BY` · `HAVING` · `ORDER BY` · `LIMIT` · Aggregate functions (`SUM`, `AVG`) · Subqueries · `DATE_FORMAT`

## How to Run
1. Open MySQL Workbench.
2. Run `01_setup.sql` to create the database and load the sample data.
3. Run the queries in `02_queries.sql` one by one.

## Results

### Monthly Revenue
![Monthly revenue](monthly_revenue.png)

### Revenue by Category
![Category revenue](category_revenue.png)

### Top 3 Customers
![Top customers](top_customers.png)

**Key findings:**
- Total revenue was 3,352.50 across 20 orders.
- March had the highest revenue (1,668.00), nearly half of the total. It included two laptop orders, while January and February had one each.
- Electronics generated 3,125.00, over 90% of all revenue.
- The top customer was Ahmad (857.00), and two of the top three customers are from Amman.

## What I Learned

- How to build a complete project from start to finish: setting up a database, writing queries, and publishing the work on GitHub.
- How `JOIN` connects tables, which was my favorite part. It let me combine orders, customers, and products to answer real business questions.
- How to run a project, check the results, and compare them against expected values to make sure the queries are correct.

## Author
Salsabeel Abusaif, AI & Data Science Student, Al-Zaytoonah University of Jordan
