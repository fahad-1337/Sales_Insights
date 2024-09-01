-- What is the total sales amount by product code?

SELECT product_code, SUM(sales_amount) AS Total_Sales FROM sales.transactions
GROUP BY product_code

-- What are the Sales Quantity according to market?

SELECT markets_name, SUM(sales_qty) AS Total_Sales_Qty
FROM sales.transactions
JOIN sales.markets
ON market_code = markets_code
GROUP BY markets_name

-- Total number of Different Customer Types?

SELECT customer_type, COUNT(customer_type) AS COUNT
FROM sales.customers
GROUP BY customer_type

-- Rows where sales amount is zero?

SELECT * FROM sales.transactions
WHERE sales_amount < 0

-- What is the average sales amount per order for each product?

SELECT product_code, ROUND(AVG(sales_amount), 2) AS average_sales
FROM sales.transactions
GROUP BY product_code


-- Which markets have the highest sales?

SELECT markets_name, SUM(sales_amount) AS total_sales
FROM sales.transactions
JOIN sales.markets
GROUP BY markets_name
ORDER BY total_sales DESC;

-- How many unique customers made purchases each year?

SELECT YEAR(order_date) AS year, COUNT(DISTINCT customer_code) AS unique_customers
FROM sales.transactions
GROUP BY year;

