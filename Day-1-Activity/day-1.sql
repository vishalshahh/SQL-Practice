-- Create Database
CREATE DATABASE zomatodb;

-- Use Database
USE zomatodb;

-- 1. Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);

-- 2. Restaurants Table
CREATE TABLE Restaurants (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine_type VARCHAR(50),
    city VARCHAR(50)
);

-- 3. Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    order_amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

-- Insert Customers Data
INSERT INTO Customers VALUES
(1,'Vishal','hi@vishy.dev','Uttar Pradesh'),
(2,'Aaysha','aaysha@gmail.com','Madhya Pradesh'),
(3,'Aditya','aditya@gmail.com','Pakistan');

-- Insert Restaurants Data
INSERT INTO Restaurants VALUES
(101,'Pizza Hut','Italian','Ghaziabad'),
(102,'Dominos','Farm Fresh','Bhopal'),
(103,'Burger Singh','Burger','Lahore');

-- Insert Orders Data
INSERT INTO Orders VALUES
(1001,1,102,450.00,'2026-04-28'),
(1002,2,101,799.00,'2026-04-28'),
(1003,3,103,1200.00,'2026-04-28');

-- View Data
SELECT * FROM Customers;
SELECT * FROM Restaurants;
SELECT * FROM Orders;

-- PART 1 : SELECT QUERIES

SELECT * FROM Customers;

SELECT * FROM Customers
WHERE city='Pakistan';

SELECT * FROM Orders
WHERE order_amount > 100;

SELECT * FROM Orders
WHERE order_date='2026-04-28';

SELECT * FROM Orders
ORDER BY order_amount DESC;

SELECT * FROM Orders
ORDER BY order_amount DESC
LIMIT 2;

-- PART 2 : UPDATE QUERIES

UPDATE Customers
SET city='Delhi'
WHERE name='Aditya';

UPDATE Restaurants
SET cuisine_type='Italian'
WHERE name='Pizza Hut';

UPDATE Orders
SET order_amount=550
WHERE order_id=1001;

-- PART 3 : DELETE QUERIES

DELETE FROM Customers
WHERE customer_id=3;

DELETE FROM Orders
WHERE order_id=1001;

DELETE FROM Restaurants
WHERE city='Bhopal';

SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Restaurants;

-- Update data
UPDATE Customers
SET city='Ghaziabad'
WHERE customer_id=1;

-- Parameterized Query (JDBC)
-- UPDATE Customers SET city=? WHERE customer_id=?;

-- Delete data
DELETE FROM Customers
WHERE customer_id=2;

-- Parameterized Query (JDBC)
-- DELETE FROM Customers WHERE customer_id=?;

-- Sorting Data
SELECT * FROM Orders
ORDER BY order_amount DESC;

-- Top 2 highest orders
SELECT * FROM Orders
ORDER BY order_amount DESC
LIMIT 2;

-- 2nd highest order
SELECT * FROM Orders
ORDER BY order_amount DESC
LIMIT 1 OFFSET 1;

-- Difference between DROP / TRUNCATE / DELETE

CREATE TABLE temp_users (
id INT,
username VARCHAR(30),
role_name VARCHAR(30)
);

INSERT INTO temp_users VALUES
(1,'A','Admin'),
(2,'B','User');

SELECT * FROM temp_users;

DELETE FROM temp_users WHERE id=2;

TRUNCATE TABLE temp_users;

DROP TABLE temp_users;

-- ALTER Commands

-- Add new column
ALTER TABLE Customers
ADD mobile VARCHAR(15);

-- Modify column
ALTER TABLE Customers
MODIFY mobile VARCHAR(20);

-- Rename column
ALTER TABLE Customers
RENAME COLUMN mobile TO phone_number;

-- Drop column
ALTER TABLE Customers
DROP COLUMN phone_number;

-- Rename table
RENAME TABLE Customers TO Customer_Data;

-- View final structure
DESC Customer_Data;