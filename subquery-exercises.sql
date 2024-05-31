CREATE DATABASE subquery_exercises;
USE subquery_exercises;

/* Criação das tabelas */

CREATE TABLE customers 
(
    id INT PRIMARY KEY,
    `name`  VARCHAR(100),
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
    FOREIGN KEY (category_id) REFERENCES categories(id),
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
INSERT INTO orders (id, order_date, customer_id) VALUES (11, '2024-05-26', 3);
INSERT INTO orders (id, order_date, customer_id) VALUES (12, '2024-05-27', 4);
INSERT INTO orders (id, order_date, customer_id) VALUES (13, '2024-05-28', 5);
INSERT INTO orders (id, order_date, customer_id) VALUES (14, '2024-05-29', 6);
INSERT INTO orders (id, order_date, customer_id) VALUES (15, '2024-05-30', 7);
INSERT INTO orders (id, order_date, customer_id) VALUES (16, '2024-05-31', 8);
INSERT INTO orders (id, order_date, customer_id) VALUES (17, '2024-06-01', 9);
INSERT INTO orders (id, order_date, customer_id) VALUES (18, '2024-06-02', 10);
INSERT INTO orders (id, order_date, customer_id) VALUES (19, '2024-06-03', 1);
INSERT INTO orders (id, order_date, customer_id) VALUES (20, '2024-06-04', 2);

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
INSERT INTO order_items (order_id, product_id, Quantity) VALUES (11, 1, 2);
INSERT INTO order_items (order_id, product_id, Quantity) VALUES (11, 2, 3);
INSERT INTO order_items (order_id, product_id, Quantity) VALUES (12, 3, 4);
INSERT INTO order_items (order_id, product_id, Quantity) VALUES (12, 4, 5);
INSERT INTO order_items (order_id, product_id, Quantity) VALUES (13, 5, 6);
INSERT INTO order_items (order_id, product_id, Quantity) VALUES (13, 6, 7);
INSERT INTO order_items (order_id, product_id, Quantity) VALUES (14, 7, 8);
INSERT INTO order_items (order_id, product_id, Quantity) VALUES (14, 8, 9);
INSERT INTO order_items (order_id, product_id, Quantity) VALUES (15, 9, 10);
INSERT INTO order_items (order_id, product_id, Quantity) VALUES (15, 10, 11);

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

/* Inserção de subqueries entre as tabelas */

SELECT o.id AS `Order`, 
	(SELECT p.`name` FROM products p
    WHERE p.id = (
		SELECT oi.product_id FROM order_items oi
		WHERE oi.order_id = o.id)) AS Product
FROM orders o
WHERE NOT EXISTS (
	SELECT * FROM order_items oi
    WHERE o.id = oi.order_id)
GROUP BY `Order`
ORDER BY Product;
    
SELECT c.`name` AS Customer FROM customers c
WHERE c.id IN (
	SELECT o.customer_id FROM orders o
    WHERE o.id IN (
		SELECT oi.order_id FROM order_items oi
        WHERE oi.product_id IN (
			SELECT p.id FROM products p
            WHERE p.id IN (
				SELECT pc.product_id FROM product_categories pc
                WHERE pc.category_id IN (
					SELECT ca.id FROM categories ca
					WHERE ca.`name` = 'Category A')))));

SELECT c.`name` AS Customer, (
	SELECT MIN(o.id) FROM orders o 
    WHERE o.customer_id = c.id) AS `Order`, (
		SELECT MAX(oi.quantity) FROM order_items oi 
        WHERE oi.order_id IN (
			SELECT o.id FROM orders o 
            WHERE o.customer_id = c.id) 
            AND oi.quantity > 1
            LIMIT 1) AS Quantity 
FROM customers c ORDER BY `Order`;