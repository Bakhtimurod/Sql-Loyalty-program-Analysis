/*
                        SQL Project: Retail Loyalty Program Analysis

        ########################################################################
        #                                                                      #
        #   Structure:                                                         #
        # - Section 1 - Loading data                                           #
        # - Section 2 - General SQL Queries                                    #
        # - Section 3 - Business Questions                                     #
        # -------------------------------------------------------------------- #
                                                     
        ########################################################################

                                  Introduction
In this test, We will be working with a retail loyalty program database using SQL.
The goal is to master knowledge of databases, data loading, merging, and querying.
There will be some business questions asked by the CEO regarding sales performance.
The table schemas for the transaction files are provided in the `exercise files`  tab.
Files in data folder
-Data: Dataset download link: https://weclouddata.s3.amazonaws.com/datasets/bootcamp/loyalty_quiz.zip
location.csv
product.csv
trans_fact_1.csv
trans_fact_2.csv
trans_fact_3.csv
trans_fact_4.csv
trans_fact_5.csv
trans_fact_6.csv
trans_fact_7.csv
trans_fact_8.csv
trans_fact_9.csv
trans_fact_10.csv
*/

set global local_infile = 'ON';
# Questions
########################################################################################################################
#                            Section 1 - Loading data
########################################################################################################################

# In this section you will:
# - Create a database called `loyalty`
# - Combine the transaction data into one table

    create database loyalty;


     select database(); -- checking database


# 1. Create a table called location with the appropriate data types and load the data from location.csv
# Hint:
# - Take a look at the header of the CSV file to get column names
# - Take a look at the values in the CSV file to set appropriate data types
# - Don't include the header as a row
# - Remove any surrounding `double quotes` from the data


   CREATE TABLE location (
    store_location_key INT PRIMARY KEY,
    region VARCHAR(100),
    province VARCHAR(50),
    city VARCHAR(50),
    postal_code VARCHAR(20),
    banner VARCHAR(10),
    store_num INT
);

-- loading data infile

    LOAD DATA LOCAL infile 'D:\\DATA_SCIENCE_BOOTCAMP\\Files_guides\\quiz_data\\location.csv'
    INTO TABLE location
    Fields TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    ignore 1 lines
        (store_location_key,region,province,
                   city,postal_code,banner,store_num);
SELECT *
from location;

describe location; -- just checking table  is created and empty

# 2. Similar to the previous question, create a table called product with the appropriate data types and load the data from product.csv
    CREATE TABLE product (
    product_key INT PRIMARY KEY,
    sku VARCHAR(2) NOT NULL,
    upc BIGINT NOT NULL,
    item_name VARCHAR(50) NOT NULL,
    item_description TEXT,
    department VARCHAR(50),
    category VARCHAR(50)
);

select *
from product;


LOAD DATA LOCAL infile 'D:\\DATA_SCIENCE_BOOTCAMP\\Files_guides\\quiz_data\\product.csv'
    INTO TABLE product
    Fields TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    ignore 1 lines;

select *
from product; -- checking it is loaded correctly




# 3: Create the transactions table


# After creating the 10 tables called txn1 to txn10, one for each file trans_fact_1.csv to trans_fact_10.csv.
# Load the data from the appropriate file to the appropriate table.
# After all 10 tables have been loaded, create and combine all 10 `txn` tables into one larger table called transactions.
# Hint:
# - If you prefer, you can just create one table and load all 10 CSV files into it


    CREATE TABLE transactions (
    store_location_key INT,
    product_key BIGINT,
    collector_key BIGINT,
    trans_dt DATE,
    sales DECIMAL(10, 2),
    units INT,
    trans_key BIGINT
);


SELECT *
from transactions; -- checking the empty transaction table
describe transactions;


###############################  --1--########################################

-- transaction table is created and now we can load all the 10 csv files into this table.
-- let's load all the ten csv files one by one...
     LOAD DATA LOCAL infile 'D:\\DATA_SCIENCE_BOOTCAMP\\Files_guides\\quiz_data\\trans_fact_1.csv'
    INTO TABLE transactions
    Fields TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    ignore 1 lines;


-- check the first csv file is loaded successfully...

    select count(*) as count_rows
    from transactions; -- yes, 20000 rows available now.

    ############################    ___2___ ##################################
    -- let's load second one...

    LOAD DATA LOCAL infile 'D:\\DATA_SCIENCE_BOOTCAMP\\Files_guides\\quiz_data\\trans_fact_2.csv'
    INTO TABLE transactions
    Fields TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    ignore 1 lines;


-- TO MAKE SURE EVERYTHING IS GOING PLANNED WE NEED TO CHECK IF THE NUMBER OF ROWS IS INCREASING AS WE LOAD MORE CSV FILES EVERY TIME

    select count(*) as count_rows
    from transactions; -- YES IT IS 40000 ROWS NOW...


###############################________3________#############################

       LOAD DATA LOCAL infile 'D:\\DATA_SCIENCE_BOOTCAMP\\Files_guides\\quiz_data\\trans_fact_3.csv'
    INTO TABLE transactions
    Fields TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    ignore 1 lines;

 -- CHECKING

      select count(*) as count_rows
       from transactions;   -- YES 60000 NOW


    ##############################          4          ####################

     LOAD DATA LOCAL infile 'D:\\DATA_SCIENCE_BOOTCAMP\\Files_guides\\quiz_data\\trans_fact_4.csv'
    INTO TABLE transactions
    Fields TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    ignore 1 lines;


-- CHECKING

      select count(*) as count_rows
       from transactions;    -- YES 80000 ROWS


##################################______________5__________________##################

    LOAD DATA LOCAL infile 'D:\\DATA_SCIENCE_BOOTCAMP\\Files_guides\\quiz_data\\trans_fact_5.csv'
    INTO TABLE transactions
    Fields TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    ignore 1 lines;


###################______________________6_______________________####################

     LOAD DATA LOCAL infile 'D:\\DATA_SCIENCE_BOOTCAMP\\Files_guides\\quiz_data\\trans_fact_6.csv'
    INTO TABLE transactions
    Fields TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    ignore 1 lines;

#################################____________7________________######################

    LOAD DATA LOCAL infile 'D:\\DATA_SCIENCE_BOOTCAMP\\Files_guides\\quiz_data\\trans_fact_7.csv'
    INTO TABLE transactions
    Fields TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    ignore 1 lines;


################################_________________8______________###########################

    LOAD DATA LOCAL infile 'D:\\DATA_SCIENCE_BOOTCAMP\\Files_guides\\quiz_data\\trans_fact_8.csv'
    INTO TABLE transactions
    Fields TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    ignore 1 lines;

#########################___________9________________#####################

    LOAD DATA LOCAL infile 'D:\\DATA_SCIENCE_BOOTCAMP\\Files_guides\\quiz_data\\trans_fact_9.csv'
    INTO TABLE transactions
    Fields TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    ignore 1 lines;

############################_______________10_____________################


     LOAD DATA LOCAL infile 'D:\DATA_SCIENCE_BOOTCAMP\\Files_guides\\quiz_data\\trans_fact_10.csv'
    INTO TABLE transactions
    Fields TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    ignore 1 lines;

  select count(*) as count_rows
       from transactions;

-- all 200000 rows and ten csv files are combined into one table- transactions


########################################################################################################################
#                            Section 2 - General SQL Queries
########################################################################################################################

# 1. How many sales are exactly 0?

    SELECT count(sales) as Count_0_sales
    from transactions
    where sales = 0;


# 2. How many transactions have negative sales and negative units?
    SELECT count(*)
    FROM transactions
    Where sales <0 or units <0;


# 3. How many years does the transaction table span (start and end year)?

    SELECT  max(year(trans_dt)) as end_year,
            min(year(trans_dt)) as starting_year
    FROM transactions
    where trans_dt>0; -- I had to add condition because there is 0 available in trans_dt column.


# 4. Create a table to show the total sales year-over-year growth
    SELECT
        year(trans_dt) as year,
        sum(sales) as total_sales
    FROM transactions
    group by year
    order by year;





# 5. Create a table to show the total sales for each month of each year

    SELECT
        year(trans_dt) as year,
        month(trans_dt) as month,
        sum(sales) as total_sales
    FROM transactions
    group by month, year
    order by year;



# 6. Create a **pivot table** to show the total sales for each month of each year
    SELECT
    year(trans_dt) as year,
    SUM(case when month(trans_dt) = 1 then sales else 0 end) as Jan,
    sum(case when month(trans_dt) = 2 then sales else 0 end) as Feb,
    sum(case when month(trans_dt) = 3 then sales else 0 end) as Mar,
    sum(case when month(trans_dt) = 4 then sales else 0 end) as Apr,
    sum(case when month(trans_dt) = 5 then sales else 0 end) as May,
    sum(case when month(trans_dt) = 6 then sales else 0 end) as Jun,
    sum(case when month(trans_dt) = 7 then sales else 0 end) as Jul,
    sum(case when month(trans_dt) = 8 then sales else 0 end) as Aug,
    sum(case when month(trans_dt) = 9 then sales else 0 end) as Sep,
    sum(case when month(trans_dt)= 10 then sales else 0 end) as Oct,
    SUM(case when month(trans_dt) = 11 then sales else 0 end) as Nov,
    sum(case when month(trans_dt) = 12 then sales else 0 end) as Dece


    FROM transactions
    GROUP BY year
    ORDER BY year;





# 7. Which month of which year had the largest total sales?
    SELECT year(trans_dt) as year,
           month(trans_dt) as month,
      sum(sales) as total_sales
    from transactions
    where year(trans_dt) >0 --  I had to add contions because 0 is available in trans_dt column.
    group by year, month
    order by total_sales desc

    LIMIT 1;


# 8. Create a table to show total sales for each province

# columns -- sales (from transactions table), province (from location table) primary_key is store_location_key

    CREATE TABLE Total_sale_by_Province as (

                SELECT province,
                       sum(sales) as total_sales

                FROM location
                JOIN transactions t on location.store_location_key = t.store_location_key
                GROUP BY province          );


    SELECT *
    FROM Total_sale_by_Province;  -- just checking the table just created





# 9. Create a table to show total sales for each product key

#   columns -- sales (from transaction), product_key (from product)
    CREATE TABLE Total_sales_by_productKey as (
                SELECT product_key,
                       sum(sales) as total_sales

                FROM transactions
                JOIN product using (product_key)
                GROUP BY product_key
                ORDER BY total_sales desc     );



    SELECT *
    FROM Total_sales_by_productKey;


# 10. Create a table to show the average sales for customers in the loyalty program vs customers that are not.
# Hints: Collector key = -1 (nonloyal) - Collector Key > -1 (loyal)

#  columns -- sales (from transaction) ,
    CREATE TABLE loyalty_program_avgSales AS (
            SELECT
                CASE
                    WHEN collector_key = -1 THEN 'Non-Loyal'
                        ELSE  'Loyal'
                    END AS customer_type,
                avg(sales) as avg_sales

            FROM transactions
            GROUP BY customer_type            );


    SELECT *
    FROM loyalty_program_avgSales; -- checking new table created


    SELECT *
    from location;
# 11. Calculate the year-over-year growth in sales for each province
    # province (from location table), sales (from transaction table)

    CREATE TABLE sales_growth_by_province AS (

            SELECT
                    province,
                    total_sales,
                    year,
                    LAG(total_sales) OVER (partition by province ORDER BY year) as previous_year_sales,
                    (total_sales - LAG(total_sales) OVER (PARTITION BY province ORDER BY year) ) AS annual_change

            FROM (
                            SELECT province,
                                   year(trans_dt) as year,
                                  sum(sales) as total_sales
                            FROM location
                            JOIN transactions as t on location.store_location_key = t.store_location_key
                            GROUP BY province, year          ) as yearly_sales_byProvince

            ORDER BY province, year desc );



    SELECT *
    FROM  sales_growth_by_province;


# 12. Calculate the month-over-month growth in sales for each province


    SELECT
    province,
    year,
    month,
    total_sales,
    LAG(total_sales) OVER (PARTITION BY province ORDER BY year, month) AS previous_month_sales,
    (total_sales - LAG(total_sales) OVER (PARTITION BY province ORDER BY year, month)) AS mom_growth,
    ((total_sales - LAG(total_sales) OVER (PARTITION BY province ORDER BY year, month)) / LAG(total_sales) OVER (PARTITION BY province ORDER BY year, month)) * 100 AS mom_growth_percentage
FROM (
    SELECT
        l.province,
        YEAR(t.trans_dt) AS year,
        MONTH(t.trans_dt) AS month,
        SUM(t.sales) AS total_sales
    FROM location l
    JOIN transactions t ON l.store_location_key = t.store_location_key
    GROUP BY l.province, YEAR(t.trans_dt), MONTH(t.trans_dt)
) AS monthly_sales_by_province
ORDER BY province, year, month;



########################################################################################################################
#                            Section 3 - Business Questions
########################################################################################################################

# 1. The president of the company wants to understand which provinces and stores are performing well (above the average
# of each province), and how much are the top store in each province performing compared with the province average.
# How many stores are performing above average in each province and how many are performing below average?
# (find the average store sales of each province, sales of each store, and the difference)

    -- Step 1: Calculate average store sales for each province
CREATE TABLE avg_province_sales AS
SELECT
    l.province,
    AVG(t.sales) AS avg_sales
FROM transactions t
JOIN location l ON t.store_location_key = l.store_location_key
GROUP BY l.province;
-- checking the table
    SELECT *
    FROM avg_province_sales;

-- Step 2: Calculate total sales for each store
CREATE TABLE store_sales AS
SELECT
    l.province,
    l.store_location_key,
    l.store_num,
    SUM(t.sales) AS total_sales
FROM transactions t
JOIN location l ON t.store_location_key = l.store_location_key
GROUP BY l.province, l.store_location_key, l.store_num;

-- checking...
    SELECT *
    FROM store_sales;

-- Step 3: Compare each store's sales with the province's average sales
CREATE TABLE store_performance AS
SELECT
    s.province,
    s.store_location_key,
    s.store_num,
    s.total_sales,
    a.avg_sales,
    s.total_sales - a.avg_sales AS sales_difference
FROM store_sales s
JOIN avg_province_sales a ON s.province = a.province;

-- Checking...
    SELECT *
    FROM store_performance;

-- Step 4: Determine how many stores are performing above and below average in each province
SELECT
    province,
    COUNT(CASE WHEN sales_difference > 0 THEN 1 END) AS stores_above_average,
    COUNT(CASE WHEN sales_difference <= 0 THEN 1 END) AS stores_below_average
FROM store_performance
GROUP BY province;

# 2. The president further wants to know how customers in the loyalty program are performing compared to non-loyalty
# customers and what category of products is contributing to most of the sales from each group.


    -- Step 1: Classify Customers and Calculate Sales for Each Group
CREATE TABLE loyalty_sales AS (
SELECT
    CASE
        WHEN t.collector_key = -1 THEN 'Non-Loyal'
        ELSE 'Loyal'
    END AS customer_type,
    SUM(t.sales) AS total_sales
FROM transactions t
GROUP BY customer_type    ) ;

SELECT *
FROM loyalty_sales;



-- Step 2: Calculate Sales for Each Product Category for Each Group
CREATE TABLE category_sales AS
SELECT
    CASE
        WHEN t.collector_key = -1 THEN 'Non-Loyal'
        ELSE 'Loyal'
    END AS customer_type,
    p.category,
    SUM(t.sales) AS total_sales
FROM transactions t
JOIN product p ON t.product_key = p.product_key
GROUP BY customer_type, p.category;
 -- checking...
SELECT *
FROM category_sales;



-- Step 3: Identify Top Product Categories for Each Group

SELECT
    customer_type,
    category,
    total_sales
FROM (
    SELECT
        customer_type,
        category,
        total_sales,
        ROW_NUMBER() OVER (PARTITION BY customer_type ORDER BY total_sales DESC) AS ranking
    FROM category_sales
) AS ranked_category_sales
WHERE ranking = 1;




-- Step 4: Compare Sales Performance of Loyalty and Non-Loyalty Customers
SELECT
    customer_type,
    total_sales
FROM loyalty_sales;



# 3. Determine the top 5 stores by province and top 10 product categories by the department from these top-performing stores.


-- Step 1: Identify Top 5 Stores by Sales in Each Province
CREATE TABLE top_stores_by_province AS
SELECT
    province,
    store_location_key,
    store_num,
    total_sales
FROM (
    SELECT
        l.province,
        l.store_location_key,
        l.store_num,
        SUM(t.sales) AS total_sales,
        ROW_NUMBER() OVER (PARTITION BY l.province ORDER BY SUM(t.sales) DESC) AS ranking
    FROM transactions t
    JOIN location l ON t.store_location_key = l.store_location_key
    GROUP BY l.province, l.store_location_key, l.store_num
) AS ranked_stores
WHERE ranking <= 5;

SELECT *
FROM top_stores_by_province;

-- Step 2: Determine Top 10 Product Categories by Department from Top Performing Stores
CREATE TABLE top_product_categories_by_department AS
SELECT
    department,
    category,
    total_sales
FROM (
    SELECT
        p.department,
        p.category,
        SUM(t.sales) AS total_sales,
        ROW_NUMBER() OVER (PARTITION BY p.department ORDER BY SUM(t.sales) DESC) AS Ranking
    FROM transactions t
    JOIN product p ON t.product_key = p.product_key
    JOIN top_stores_by_province ts ON t.store_location_key = ts.store_location_key
    GROUP BY p.department, p.category
) AS ranked_categories
WHERE ranking <= 10;

-- results
-- View the results for Top 5 Stores by Province
SELECT *
FROM top_stores_by_province;

-- View the results for Top 10 Product Categories by Department from Top Performing Stores
SELECT *
FROM top_product_categories_by_department;


--  THANKS...
