-- MONDAY COFFEE SALES SCHEMAS

CREATE DATABASE coffee_sales;
USE coffee_sales;


DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS customes;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS city;



-- CITY's TABLE

CREATE TABLE city
(
	city_id int primary key,
    city_name varchar(20),
    population bigint,
    estimated_rent float,
    city_rank int
);

-- CUSTOMER's TABLE

CREATE TABLE customers
(
	customer_id int primary key,
    customer_name varchar(20),
    city_id int,
    CONSTRAINT fk_city FOREIGN KEY (city_id) REFERENCES city(city_id)
);

-- PRODUCT's TABLE

CREATE TABLE products
(
		product_id int primary key,
        product_name varchar(40),
        price float
);

-- SALE's TABLE

CREATE TABLE sales
(
	sale_id int primary key,
    sale_date date,
    product_id int,
    customer_id int,
    total float,
    rating int,
    CONSTRAINT fk_products FOREIGN KEY (product_id) REFERENCES products(product_id),
	CONSTRAINT fk_customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
);


-- END OF SCHEMAS







