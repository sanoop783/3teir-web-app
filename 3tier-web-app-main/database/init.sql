-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS shopping_db;

-- Switch to the database
USE shopping_db;

-- Create the products table if it doesn't exist
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- Insert sample data if table is empty
INSERT INTO products (name, description, price)
SELECT * FROM (SELECT 'Laptop', 'A high-performance laptop.', 999.99) AS tmp
WHERE NOT EXISTS (SELECT name FROM products WHERE name = 'Laptop')
LIMIT 1;

INSERT INTO products (name, description, price)
SELECT * FROM (SELECT 'Smartphone', 'A sleek and powerful smartphone.', 699.99) AS tmp
WHERE NOT EXISTS (SELECT name FROM products WHERE name = 'Smartphone')
LIMIT 1;

INSERT INTO products (name, description, price)
SELECT * FROM (SELECT 'Headphones', 'Noise-cancelling over-ear headphones.', 199.99) AS tmp
WHERE NOT EXISTS (SELECT name FROM products WHERE name = 'Headphones')
LIMIT 1;

