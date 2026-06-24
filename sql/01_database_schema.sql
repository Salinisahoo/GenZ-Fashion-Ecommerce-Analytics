CREATE DATABASE genz_fashion;

USE genz_fashion;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    age INT,
    gender VARCHAR(20),
    city VARCHAR(50),
    customer_type VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    style VARCHAR(50),
    price DECIMAL(10,2),
    cost_price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    discount DECIMAL(5,2),
    payment_mode VARCHAR(30),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

SHOW TABLES;
SELECT COUNT(*)

SELECT * FROM customers
LIMIT 5;

SELECT COUNT(*)
FROM products;

SELECT *
FROM products
LIMIT 5;

SELECT COUNT(*)
FROM orders;

SELECT *
FROM orders
LIMIT 5;

SELECT 
    o.order_id,
    c.city,
    p.product_name,
    p.style,
    o.quantity,
    o.order_date
FROM orders o
JOIN customers c 
    ON o.customer_id = c.customer_id
JOIN products p 
    ON o.product_id = p.product_id
LIMIT 10;


SELECT customer_id, COUNT(*)
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;
