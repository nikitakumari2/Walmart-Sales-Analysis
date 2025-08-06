# Walmart-Sales-Analysis

This project seeks to analyze Walmart sales data with the goals of identifying top-performing branches and products, examining sales trends across different product categories, and understanding customer behavior. The objective is to enhance and optimize sales strategies based on insights derived from the dataset sourced from the [Kaggle Walmart Sales Forecasting Competition](https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting).

"In this recruiting competition, job-seekers are provided with historical sales data for 45 Walmart stores located in different regions. Each store contains many departments, and participants must project the sales for each department in each store. To add to the challenge, selected holiday markdown events are included in the dataset. These markdowns are known to affect sales, but it is challenging to predict which departments are affected and the extent of the impact."[source](https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting)

# Purpose Of The Project

The goal of this project is to extract actionable insights from Walmart’s sales data, uncovering trends and factors that impact sales performance in various branches.

# About Data
The dataset was sourced from the Kaggle Walmart Sales Forecasting Competition. It includes sales transactions from three Walmart branches located in Mandalay, Yangon, and Naypyitaw. The dataset comprises 1,000 rows and 17 columns, capturing key sales metrics and transaction details.

# Analysis List

__Product Analysis__
> Conduct analysis on the data to understand the different product lines, the products lines performing best and the product lines that need to be improved.

__Sales Analysis__
> This analysis aims to answer the question of the sales trends of product. The result of this can help use measure the effectiveness of each sales strategy the business applies and what modificatoins are needed to gain more sales.

__Customer Analysis__
> This analysis aims to uncover the different customers segments, purchase trends and the profitability of each customer segment.

# Approach Used

1. __Data Wrangling__:
> This initial step involves inspecting the data to detect any NULL or missing values. Data replacement methods was used to address any such instances. It begins by building a database, creating tables, and inserting the data. Given that during table creation, each field was specified as NOT NULL, and the database inherently filters out null values.
2. __Feature Engineering__:
> a. Add a new column named time_of_day to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day most sales are made.
> b. Add a new column named month_name that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.
3. __Exploratory Data Analysis (EDA)__:
> Exploratory data analysis is done to answer the listed questions and aims of this project.

# Business Questions To Answer

### Generic Question
1. How many unique cities does the data have?
2. In which city is each branch?

### Product
1. How many unique product lines does the data have?
2. What is the most common payment method?
3. What is the most selling product line?
4. What is the total revenue by month?
5. What month had the largest COGS?
6. What product line had the largest revenue?
7. What is the city with the largest revenue?
8. What product line had the largest VAT?
9. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
10. Which branch sold more products than average product sold?
11. What is the most common product line by gender?
12. What is the average rating of each product line?

### Sales
1. Which of the customer types brings the most revenue?
2. Which city has the largest tax percent/ VAT (Value Added Tax)?
3. Which customer type pays the most in VAT?

### Customer

1. How many unique customer types does the data have?
2. How many unique payment methods does the data have?
3. What is the most common customer type?
4. Which customer type buys the most?
5. What is the gender of most of the customers?
6. What is the gender distribution per branch?
7. Which time of the day do customers give most ratings?
8. Which time of the day do customers give most ratings per branch?
9. Which day fo the month has the best avg ratings?
10. Which day of the month has the best average ratings per branch?





