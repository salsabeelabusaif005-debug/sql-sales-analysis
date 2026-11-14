-- ============================================
-- Sales Analysis Project - Database Setup
-- Tool: MySQL (run in MySQL Workbench)
-- ============================================

CREATE DATABASE IF NOT EXISTS sales_analysis;
USE sales_analysis;

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;

-- Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name        VARCHAR(50) NOT NULL,
    city        VARCHAR(50)
);

-- Products table
CREATE TABLE products (
    product_id   INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    category     VARCHAR(50),
    price        DECIMAL(8,2) NOT NULL
);

-- Orders table
CREATE TABLE orders (
    order_id    INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    product_id  INT NOT NULL,
    quantity    INT NOT NULL,
    order_date  DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id)  REFERENCES products(product_id)
);

-- Sample data
INSERT INTO customers (customer_id, name, city) VALUES
(1, 'Ahmad',  'Amman'),
(2, 'Lina',   'Irbid'),
(3, 'Omar',   'Zarqa'),
(4, 'Sara',   'Amman'),
(5, 'Khaled', 'Aqaba'),
(6, 'Mona',   'Amman');   -- this customer has no orders (used in query 7)

INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Laptop',     'Electronics', 650.00),
(2, 'Headphones', 'Electronics',  45.00),
(3, 'Notebook',   'Stationery',    2.50),
(4, 'Backpack',   'Accessories',  30.00),
(5, 'Mouse',      'Electronics',  12.00);

INSERT INTO orders (customer_id, product_id, quantity, order_date) VALUES
(1, 1, 1, '2026-01-05'),
(2, 2, 2, '2026-01-05'),
(3, 3, 10, '2026-01-12'),
(1, 5, 1, '2026-01-15'),
(4, 4, 1, '2026-01-20'),
(5, 2, 1, '2026-01-28'),
(2, 1, 1, '2026-02-02'),
(3, 5, 3, '2026-02-02'),
(4, 3, 20, '2026-02-10'),
(1, 4, 2, '2026-02-14'),
(5, 5, 2, '2026-02-18'),
(2, 3, 5, '2026-02-25'),
(4, 1, 1, '2026-03-01'),
(3, 2, 1, '2026-03-04'),
(5, 4, 1, '2026-03-09'),
(1, 2, 3, '2026-03-12'),
(2, 5, 4, '2026-03-15'),
(3, 1, 1, '2026-03-20'),
(4, 2, 2, '2026-03-22'),
(5, 3, 8, '2026-03-30');
