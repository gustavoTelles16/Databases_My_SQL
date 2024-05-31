CREATE DATABASE join_exercises;
USE join_exercises;

/* Criação das tabelas */

CREATE TABLE customers 
(
    id INT PRIMARY KEY,
    `name` VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE products 
(
    id INT PRIMARY KEY,
    `name` VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE orders 
(
    id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE order_items 
(
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id),
    PRIMARY KEY (order_id, product_id)
);

CREATE TABLE categories 
(
    id INT PRIMARY KEY,
    `name` VARCHAR(100)
);

CREATE TABLE product_categories 
(
    category_id INT,
    product_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(id),
    FOREIGN KEY (product_id) REFERENCES products(id),
    PRIMARY KEY (category_id, product_id)
);

/* Inserção de dados nas tabelas */

INSERT INTO customers (id, `name`, email) VALUES (1, 'John Doe', 'john.doe@example.com');
INSERT INTO customers (id, `name`, email) VALUES (2, 'Jane Smith', 'jane.smith@example.com');
INSERT INTO customers (id, `name`, email) VALUES (3, 'Alice Johnson', 'alice.johnson@example.com');
INSERT INTO customers (id, `name`, email) VALUES (4, 'Bob Williams', 'bob.williams@example.com');
INSERT INTO customers (id, `name`, email) VALUES (5, 'Charlie Brown', 'charlie.brown@example.com');
INSERT INTO customers (id, `name`, email) VALUES (6, 'David Davis', 'david.davis@example.com');
INSERT INTO customers (id, `name`, email) VALUES (7, 'Eve Evans', 'eve.evans@example.com');
INSERT INTO customers (id, `name`, email) VALUES (8, 'Frank Foster', 'frank.foster@example.com');
INSERT INTO customers (id, `name`, email) VALUES (9, 'Grace Green', 'grace.green@example.com');
INSERT INTO customers (id, `name`, email) VALUES (10, 'Harry Hall', 'harry.hall@example.com');

SELECT * FROM customers;

INSERT INTO products (id, `name`, price) VALUES (1, 'Product A', 19.99);
INSERT INTO products (id, `name`, price) VALUES (2, 'Product B', 29.99);
INSERT INTO products (id, `name`, price) VALUES (3, 'Product C', 39.99);
INSERT INTO products (id, `name`, price) VALUES (4, 'Product D', 49.99);
INSERT INTO products (id, `name`, price) VALUES (5, 'Product E', 59.99);
INSERT INTO products (id, `name`, price) VALUES (6, 'Product F', 69.99);
INSERT INTO products (id, `name`, price) VALUES (7, 'Product G', 79.99);
INSERT INTO products (id, `name`, price) VALUES (8, 'Product H', 89.99);
INSERT INTO products (id, `name`, price) VALUES (9, 'Product I', 99.99);
INSERT INTO products (id, `name`, price) VALUES (10, 'Product J', 109.99);

SELECT * FROM products;

INSERT INTO orders (id, order_date, customer_id) VALUES (1, '2024-05-16', 1);
INSERT INTO orders (id, order_date, customer_id) VALUES (2, '2024-05-17', 2);
INSERT INTO orders (id, order_date, customer_id) VALUES (3, '2024-05-18', 3);
INSERT INTO orders (id, order_date, customer_id) VALUES (4, '2024-05-19', 4);
INSERT INTO orders (id, order_date, customer_id) VALUES (5, '2024-05-20', 5);
INSERT INTO orders (id, order_date, customer_id) VALUES (6, '2024-05-21', 6);
INSERT INTO orders (id, order_date, customer_id) VALUES (7, '2024-05-22', 7);
INSERT INTO orders (id, order_date, customer_id) VALUES (8, '2024-05-23', 8);
INSERT INTO orders (id, order_date, customer_id) VALUES (9, '2024-05-24', 9);
INSERT INTO orders (id, order_date, customer_id) VALUES (10, '2024-05-25', 10);

SELECT * FROM orders;

INSERT INTO order_items (order_id, product_id, quantity) VALUES (1, 1, 2);
INSERT INTO order_items (order_id, product_id, quantity) VALUES (2, 2, 3);
INSERT INTO order_items (order_id, product_id, quantity) VALUES (3, 3, 4);
INSERT INTO order_items (order_id, product_id, quantity) VALUES (4, 4, 5);
INSERT INTO order_items (order_id, product_id, quantity) VALUES (5, 5, 6);
INSERT INTO order_items (order_id, product_id, quantity) VALUES (6, 6, 7);
INSERT INTO order_items (order_id, product_id, quantity) VALUES (7, 7, 8);
INSERT INTO order_items (order_id, product_id, quantity) VALUES (8, 8, 9);
INSERT INTO order_items (order_id, product_id, quantity) VALUES (9, 9, 10);
INSERT INTO order_items (order_id, product_id, quantity) VALUES (10, 10, 11);

SELECT * FROM order_items;

INSERT INTO categories (id, `name`) VALUES (1, 'Category A');
INSERT INTO categories (id, `name`) VALUES (2, 'Category B');
INSERT INTO categories (id, `name`) VALUES (3, 'Category C');
INSERT INTO categories (id, `name`) VALUES (4, 'Category D');
INSERT INTO categories (id, `name`) VALUES (5, 'Category E');

SELECT * FROM categories;

INSERT INTO product_categories (category_id, product_id) VALUES (1, 1);
INSERT INTO product_categories (category_id, product_id) VALUES (2, 2);
INSERT INTO product_categories (category_id, product_id) VALUES (3, 3);
INSERT INTO product_categories (category_id, product_id) VALUES (4, 4);
INSERT INTO product_categories (category_id, product_id) VALUES (5, 5);
INSERT INTO product_categories (category_id, product_id) VALUES (1, 6);
INSERT INTO product_categories (category_id, product_id) VALUES (2, 7);
INSERT INTO product_categories (category_id, product_id) VALUES (3, 8);
INSERT INTO product_categories (category_id, product_id) VALUES (4, 9);
INSERT INTO product_categories (category_id, product_id) VALUES (5, 10);

SELECT * FROM product_categories;

/* Inserção de joins entre as tabelas */

SELECT o.id AS `Order`, c.`name` AS Customer FROM orders o
LEFT JOIN customers c ON o.customer_id = c.id
WHERE c.id = 1;

SELECT c.`name` AS Customer, p.`name` AS Product FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
LEFT JOIN order_items oi ON o.id = oi.order_id
LEFT JOIN products p ON oi.product_id = p.id
WHERE c.id = 5;

SELECT c.`name` AS Customer, SUM(p.price * oi.quantity) AS Total FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
LEFT JOIN order_items oi ON o.id = oi.order_id
LEFT JOIN products p ON oi.product_id = p.id
WHERE c.id = 10;

SELECT p.`name` AS Product, c.`name` AS Customer FROM products p
LEFT JOIN order_items oi ON p.id = oi.product_id
LEFT JOIN orders o ON oi.order_id = o.id
LEFT JOIN customers c ON o.customer_id = c.id
WHERE p.id = 1;

SELECT ca.`name` AS Category, p.`name` AS Product FROM categories ca
LEFT JOIN product_categories pc ON ca.id = pc.category_id
LEFT JOIN products p ON pc.product_id = p.id
WHERE ca.id = 1;

SELECT ca.`name` AS Category, COUNT(pc.product_id) AS Qnt_Products FROM categories ca
LEFT JOIN product_categories pc ON ca.id = pc.category_id
LEFT JOIN products p ON pc.product_id = p.id
GROUP BY Category
ORDER BY Qnt_Products DESC;

SELECT c.`name` AS Customer, COUNT(o.id) AS Qnt_Orders FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
GROUP BY Customer
ORDER BY Qnt_Orders DESC;

SELECT p.`name` AS Product , COUNT(oi.product_id) AS Qnt_Products FROM products p
LEFT JOIN order_items oi ON p.id = oi.product_id
GROUP BY Product
ORDER BY Qnt_Products DESC;

SELECT o.id AS `Order`, p.`name` AS Product, ca.`name` AS Category FROM orders o
LEFT JOIN order_items oi ON o.id = oi.order_id
LEFT JOIN products p ON oi.product_id = p.id
LEFT JOIN product_categories pc ON p.id = pc.product_id
LEFT JOIN categories ca ON pc.category_id = ca.id
WHERE ca.id = 1;

SELECT Customer, AVG(Total) AS Avg_Total FROM ( 
	SELECT c.`name` AS Customer, SUM(p.price * oi.quantity) AS Total FROM customers c 
    LEFT JOIN orders o ON c.id = o.customer_id 
    LEFT JOIN order_items oi ON o.id = oi.order_id 
    LEFT JOIN products p ON oi.product_id = p.id 
    GROUP BY c.name 
    ) AS Subquery 
GROUP BY Customer;