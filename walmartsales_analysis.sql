SELECT * FROM walmartsales;

-- ----------------------------------------------------------------------------------------------------
-- -----------------------------------Feature engineering----------------------------------
-- time_of_day
SELECT time,
	 (CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END) AS time_of_day
FROM walmartsales;

ALTER TABLE walmartsales ADD COLUMN time_of_day VARCHAR(20);
SELECT * FROM walmartsales;

SET SQL_SAFE_UPDATES = 0;
UPDATE walmartsales
SET time_of_day = (CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END);
SET SQL_SAFE_UPDATES = 1;
-- -----------------------------------------
-- ------------------------------------------
-- month_name
SELECT date, MONTHNAME(date)
FROM walmartsales;

ALTER TABLE walmartsales ADD COLUMN month_name VARCHAR(10);

SET SQL_SAFE_UPDATES = 0;
UPDATE walmartsales
SET month_name = MONTHNAME(date);
SET SQL_SAFE_UPDATES = 1; 

SELECT * FROM walmartsales;

-- -----------------------------------------------------------------------------------------------
-- --------------------------------------Generic Questions----------------------------------------
-- How many unique cities does the data have?

SELECT DISTINCT city
FROM walmartsales;

-- In which city is each branch?

SELECT DISTINCT city, branch
FROM walmartsales;

-- -----------------------------------------------------------------------------------------------
-- -------------------------------------- Product ------------------------------------------------
-- How many unique product lines does the data have?
SELECT DISTINCT product_line
FROM walmartsales; 

-- What is the most common payment method?
SELECT payment, COUNT(payment)
FROM walmartsales
GROUP BY payment;

-- What is the most selling product line?
SELECT SUM(quantity) AS qty,product_line
FROM walmartsales
GROUP BY product_line
ORDER BY product_line DESC;

-- What is the total revenue by month? 
SELECT month_name AS month, SUM(total) AS total_revenue
FROM walmartsales
GROUP BY month_name
ORDER BY total_revenue;

-- What month had the largest COGS?
SELECT month_name AS month, MAX(cogs) AS cogs
FROM walmartsales
GROUP BY month_name
ORDER BY cogs;

-- What product line had the largest revenue?
SELECT product_line, SUM(total) AS total_revenue
FROM walmartsales
GROUP BY product_line
ORDER BY total_revenue DESC;

-- What is the city with the largest revenue?
SELECT city,SUM(total) AS total_revenue
FROM walmartsales
GROUP BY city
ORDER BY total_revenue DESC;

-- What product line had the largest VAT?
SELECT product_line,AVG(tax) AS avg_tax
FROM walmartsales
GROUP BY product_line
ORDER BY avg_tax DESC; 

-- Fetch each product line and add a column to those product line 
-- showing "Good", "Bad" Good if its greater than average sales
SELECT AVG(quantity) AS avg_qnty
FROM walmartsales;

SELECT product_line,
	(CASE
		WHEN AVG(quantity) > 6 THEN "Good"
        ELSE "Bad"
    END) AS remark
FROM walmartsales
GROUP BY product_line;

-- Which branch sold more products than average product sold?
SELECT branch,SUM(quantity) AS qnty
FROM walmartsales
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM walmartsales);

-- What is the most common product line by gender?
SELECT gender,product_line,COUNT(gender) AS total_cnt
FROM walmartsales
GROUP BY gender,product_line
ORDER BY total_cnt DESC; 

-- What is the average rating of each product line?
SELECT ROUND(AVG(rating), 2) as avg_rating,product_line
FROM walmartsales
GROUP BY product_line
ORDER BY avg_rating DESC;

-- --------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------ SALES -------------------------------------------------------------
-- Which of the customer types brings the most revenue?
SELECT customer_type, SUM(total) AS total_revenue
FROM walmartsales
GROUP BY customer_type
ORDER BY total_revenue;

-- Which city has the largest tax percent/ VAT (Value Added Tax)?
SELECT city,ROUND(AVG(tax), 2) AS avg_tax_pct
FROM walmartsales
GROUP BY city 
ORDER BY avg_tax_pct DESC;

-- Which customer type pays the most in VAT?
SELECT customer_type,AVG(tax) AS total_tax
FROM walmartsales
GROUP BY customer_type
ORDER BY total_tax;

-- --------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------ CUSTOMER -------------------------------------------------------------
-- How many unique customer types does the data have?
SELECT DISTINCT customer_type
FROM walmartsales;

-- How many unique payment methods does the data have?
SELECT DISTINCT payment
FROM walmartsales; 

-- What is the most common customer type?
SELECT customer_type, count(customer_type) as count
FROM walmartsales
GROUP BY customer_type
ORDER BY count DESC;

-- Which customer type buys the most?
SELECT customer_type,COUNT(*)
FROM walmartsales
GROUP BY customer_type;

-- What is the gender of most of the customers?
SELECT gender,COUNT(*) as gender_cnt
FROM walmartsales
GROUP BY gender
ORDER BY gender_cnt DESC;

-- What is the gender distribution per branch?
SELECT gender,COUNT(*) as gender_cnt
FROM walmartsales
WHERE branch = "C"
GROUP BY gender
ORDER BY gender_cnt DESC;
-- Which time of the day do customers give most ratings? 
SELECT time_of_day, AVG(rating) AS avg_rating
FROM walmartsales
GROUP BY time_of_day
ORDER BY avg_rating DESC; 

-- Which time of the day do customers give most ratings per branch?
SELECT time_of_day,AVG(rating) AS avg_rating
FROM walmartsales
WHERE branch = "A"
GROUP BY time_of_day
ORDER BY avg_rating DESC;

SELECT time_of_day,AVG(rating) AS avg_rating
FROM walmartsales
WHERE branch = "B"
GROUP BY time_of_day
ORDER BY avg_rating DESC;

SELECT time_of_day,AVG(rating) AS avg_rating
FROM walmartsales
WHERE branch = "C"
GROUP BY time_of_day
ORDER BY avg_rating DESC;

-- Which month has the best avg ratings?
SELECT month_name,AVG(rating) AS avg_rating
FROM walmartsales
GROUP BY month_name 
ORDER BY avg_rating DESC;

-- Which day of the week has the best average ratings per branch?
SELECT month_name,COUNT(day_name) AS total_sales
FROM walmartsales
WHERE branch = "C"
GROUP BY month_name
ORDER BY total_sales DESC;