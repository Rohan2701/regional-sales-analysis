CREATE DATABASE project_1;
USE project_1;

CREATE TABLE regions(
region_id INT auto_increment PRIMARY KEY,
suburb VARCHAR(255),
city VARCHAR(100),
postcode VARCHAR(20),
longitude DECIMAL(20,15),
latitude DECIMAL(20,15),
full_address VARCHAR(255)
);

CREATE TABLE customers(
customer_id INT PRIMARY KEY AUTO_increment,
cust_name VARCHAR(100)
);

CREATE TABLE sales_order(
sales_id INT PRIMARY KEY AUTO_INCREMENT,
order_no VARCHAR(50),
order_date DATE,
ship_date DATE,
cust_name_index INT,
channel ENUM('Wholesale','Export','Distributor'),
currency_code ENUM('USD','NZD','AUD','GBP','EUR'),
warehouse_code VARCHAR(50),
delivery_reg_id INT,
product_desc_id INT,
order_quantity INT,
unit_price DOUBLE,
total_unit_cost DOUBLE,
total_revenue DOUBLE,
total_revenue_usd DOUBLE
);

SHOW VARIABLES LIKE 'secure_file_priv';

SELECT * FROM sales_order;
DROP TABLE sales_order;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Sales Analysis Report.csv'
INTO TABLE sales_order
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_no, order_date, ship_date, cust_name_index, channel, 
currency_code, warehouse_code, delivery_reg_id, product_desc_id,
order_quantity, unit_price, total_unit_cost, total_revenue, total_revenue_usd);