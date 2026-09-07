CREATE DATABASE ecommerce;
CREATE TABLE sales (
    order_id VARCHAR(20),
    order_date DATE,
    customer_id VARCHAR(20),
    product VARCHAR(100),
    category VARCHAR(50),
    quantity INTEGER,
    sales NUMERIC(12,2),
    discount NUMERIC(5,2),
    profit NUMERIC(12,2),
    region VARCHAR(50),
    city VARCHAR(50)
);

SELECT*FROM sales
LIMIT 10;

SELECT COUNT(*) AS total_rows
FROM sales;

SELECT
    COUNT(*) AS total_rows,
    COUNT(order_id) AS order_id_filled,
    COUNT(order_date) AS order_date_filled,
    COUNT(customer_id) AS customer_id_filled,
    COUNT(product) AS product_filled,
    COUNT(category) AS category_filled,
    COUNT(quantity) AS quantity_filled,
    COUNT(sales) AS sales_filled,
    COUNT(discount) AS discount_filled,
    COUNT(profit) AS profit_filled,
    COUNT(region) AS region_filled,
    COUNT(city) AS city_filled
FROM sales;


-- 01. DATA QUALITY CHECKS


-- Check for missing values
SELECT
    COUNT(*) AS total_rows,
    COUNT(order_id) AS order_id_filled,
    COUNT(order_date) AS order_date_filled,
    COUNT(customer_id) AS customer_id_filled,
    COUNT(product) AS product_filled,
    COUNT(category) AS category_filled,
    COUNT(quantity) AS quantity_filled,
    COUNT(sales) AS sales_filled,
    COUNT(discount) AS discount_filled,
    COUNT(profit) AS profit_filled,
    COUNT(region) AS region_filled,
    COUNT(city) AS city_filled
FROM sales;


-- Check for duplicate Order IDs
SELECT
    order_id,
    COUNT(*) AS order_count
FROM sales
GROUP BY order_id
HAVING COUNT(*) > 1;


-- Check for invalid quantities
SELECT *
FROM sales
WHERE quantity <= 0;


-- Check for invalid sales values
SELECT *
FROM sales
WHERE sales <= 0;


-- Check for invalid discounts
SELECT *
FROM sales
WHERE discount < 0 OR discount > 100;


-- Check if profit is greater than sales
SELECT *
FROM sales
WHERE profit > sales;



-- 02. BASIC DATA CHECK


-- Preview the dataset
SELECT *
FROM sales
LIMIT 10;


-- Total number of orders
SELECT
    COUNT(*) AS total_orders
FROM sales;



-- 03. OVERALL KPIs


SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin
FROM sales;



-- 04. SALES BY PRODUCT


SELECT
    product,
    ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY product
ORDER BY total_sales DESC;



-- 05. SALES BY CATEGORY


SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY category
ORDER BY total_sales DESC;



-- 06. SALES BY REGION


SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY region
ORDER BY total_sales DESC;



-- 07. MONTHLY SALES TREND


SELECT
    DATE_TRUNC('month', order_date) AS month,
    ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY month
ORDER BY month;



-- 08. PROFIT BY CATEGORY


SELECT
    category,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY category
ORDER BY total_profit DESC;



-- 09. TOP 10 CUSTOMERS BY SALES


SELECT
    customer_id,
    ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 10;



-- 10. SALES VS PROFIT BY PRODUCT


SELECT
    product,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY product
ORDER BY total_sales DESC;



-- 11. PROFIT MARGIN BY PRODUCT


SELECT
    product,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin
FROM sales
GROUP BY product
ORDER BY profit_margin DESC;



-- 12. LOW-MARGIN PRODUCTS
 

SELECT
    product,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin
FROM sales
GROUP BY product
HAVING
    SUM(profit) / NULLIF(SUM(sales), 0) * 100 < 20
ORDER BY profit_margin ASC;

SELECT
    category,
    SUM(profit) AS total_profit
FROM sales
GROUP BY category
ORDER BY total_profit DESC;

SELECT
      customer_id,
	  SUM(sales) AS total_sales
	  FROM sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 10;
--SALES VS PROFIT--
SELECT
    product,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales
GROUP BY product
ORDER BY total_sales DESC
LIMIT 10;


SELECT
    product,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(profit) / SUM(sales) * 100 AS profit_margin
FROM sales
GROUP BY product
ORDER BY profit_margin DESC;

SELECT
    product,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100) AS profit_margin
FROM sales
GROUP BY product
ORDER BY profit_margin DESC;

--HAVING--

SELECT
    product,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin
FROM sales
GROUP BY product
HAVING SUM(profit) / SUM(sales) * 100 < 20
ORDER BY profit_margin ASC;

--KPI--
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin
FROM sales;


