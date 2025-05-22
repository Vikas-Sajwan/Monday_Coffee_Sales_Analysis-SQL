-- MONDAY COFFEE SALES ANALYSIS


SELECT * FROM city;
SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM sales;


-- Q1. List all products with their total sales revenue greater than $5000, ordered by total revenue descending?

SELECT 
    p.product_name, 
    SUM(s.total) AS total_revenue
FROM 
    sales s
JOIN 
    products p ON s.product_id = p.product_id
GROUP BY 
    p.product_name
HAVING 
    SUM(s.total) > 5000
ORDER BY 
    total_revenue DESC;


-- Q2. Find the top 3 cities with the highest number of customers?

SELECT 
    c.city_name, 
    COUNT(customer_id) AS customer_count
FROM 
    customers
JOIN 
    city c ON c.city_id = c.city_id
GROUP BY 
    c.city_name
ORDER BY 
    customer_count DESC
LIMIT 3;


-- Q3.Which customers have made purchases totalling over $2000?

SELECT 
    cu.customer_name, 
    SUM(s.total) AS total_spent
FROM 
    sales s
JOIN 
    customers cu ON s.customer_id = cu.customer_id
GROUP BY 
    cu.customer_name
HAVING 
    SUM(s.total) > 2000;


-- Q4. Find the average rating of each product?

SELECT 
    p.product_name, 
    AVG(s.rating) AS avg_rating
FROM 
    sales s
JOIN 
    products p ON s.product_id = p.product_id
GROUP BY 
    p.product_name;
    
    
-- Q5. List cities where the average customer rating is above 4?

SELECT 
    c.city_name, 
    AVG(s.rating) AS avg_city_rating
FROM 
    sales s
JOIN 
    customers cu ON s.customer_id = cu.customer_id
JOIN 
    city c ON cu.city_id = c.city_id
GROUP BY 
    c.city_name
HAVING 
    AVG(s.rating) > 4;
    
    
-- Q6. Find products that were never sold?

SELECT 
    p.product_name
FROM 
    products p
LEFT JOIN 
    sales s ON p.product_id = s.product_id
WHERE 
    s.sale_id IS NULL;
    

-- Q7. Which cities have both a population greater than 1 million and estimated rent above 2000?

SELECT 
    city_name, population, estimated_rent
FROM 
    city
WHERE 
    population > 1000000 AND estimated_rent > 2000;


-- Q8. Get the name of the customer(s) with the highest total spending?


SELECT 
    cu.customer_name
FROM 
    sales s
JOIN 
    customers cu ON s.customer_id = cu.customer_id
GROUP BY 
    cu.customer_id
ORDER BY 
    SUM(s.total) DESC
LIMIT 1;


-- Q9. Find the top 5 most frequently sold products?

SELECT 
    p.product_name, 
    COUNT(s.sale_id) AS sales_count
FROM 
    sales s
JOIN 
    products p ON s.product_id = p.product_id
GROUP BY 
    p.product_name
ORDER BY 
    sales_count DESC
LIMIT 5;


-- Q10. Which cities have the lowest city rank (top 5)?

SELECT 
    city_name, city_rank
FROM 
    city
ORDER BY 
    city_rank ASC
LIMIT 5;


-- Q11. List the customers who gave an average rating lower than 3?

SELECT 
    cu.customer_name, 
    AVG(s.rating) AS avg_rating
FROM 
    sales s
JOIN 
    customers cu ON s.customer_id = cu.customer_id
GROUP BY 
    cu.customer_name
HAVING 
    AVG(s.rating) < 3;
    
    
-- Q12. Find total revenue and number of sales for each city?

SELECT 
    ci.city_name, 
    COUNT(s.sale_id) AS total_sales, 
    SUM(s.total) AS total_revenue
FROM 
    sales s
JOIN 
    customers cu ON s.customer_id = cu.customer_id
JOIN 
    city ci ON cu.city_id = ci.city_id
GROUP BY 
    ci.city_name;


-- Q13. Get the product with the highest average rating?

SELECT 
    p.product_name, 
    AVG(s.rating) AS avg_rating
FROM 
    sales s
JOIN 
    products p ON s.product_id = p.product_id
GROUP BY 
    p.product_name
ORDER BY 
    avg_rating DESC
LIMIT 1;


-- Q14. List all customers who haven't made any purchases?

SELECT 
    cu.customer_name
FROM 
    customers cu
LEFT JOIN 
    sales s ON cu.customer_id = s.customer_id
WHERE 
    s.sale_id IS NULL;
    

-- THE END

