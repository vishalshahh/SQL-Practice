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
(1, 'Vishal', 'hi@vishy.dev', 'Uttar Pradesh'),
(2, 'Aaysha', 'aaysha@gmail.com', 'Madhya Pradesh'),
(3, 'Aditya', 'aditya@gmail.com', 'Pakistan');

-- Insert Restaurants Data
INSERT INTO Restaurants VALUES
(101, 'Pizza Hut', 'Italian', 'Ghaziabad'),
(102, 'Dominos', 'Farm Fresh', 'Bhopal'),
(103, 'Burger Singh', 'Burger', 'Lahore');

-- Insert Orders Data
INSERT INTO Orders VALUES
(1001, 1, 102, 450.00, '2026-04-28'),
(1002, 2, 101, 799.00, '2026-04-28'),
(1003, 3, 103, 1200.00, '2026-04-28');

-- View Data
SELECT * FROM Customers;
SELECT * FROM Restaurants;
SELECT * FROM Orders;

-- Use Database
USE zomatodb;

-- PART 1 : SELECT QUERIES

-- Use Case 1: View all customers
SELECT * FROM Customers;

-- Use Case 2: Customers from Delhi
SELECT * FROM Customers
WHERE city = 'Pakistan';

-- Use Case 3: High-value salary (order amount above 60000)
SELECT * FROM Orders
WHERE order_amount > 100;

-- Use Case 4: Orders placed on specific date
SELECT * FROM Orders
WHERE order_date = '2026-04-28';

-- Use Case 5: Sort orders by highest amount
SELECT * FROM Orders
ORDER BY order_amount DESC;

-- Use Case 6: Top 2 highest orders
SELECT * FROM Orders
ORDER BY order_amount DESC
LIMIT 2;


-- PART 2 : UPDATE QUERIES

-- Use Case 7: Ravi moved Delhi to Pune
UPDATE Customers
SET city = 'Delhi'
WHERE name = 'Aditya';

-- Use Case 8: Pizza World now Fast Food
UPDATE Restaurants
SET cuisine_type = 'Italian'
WHERE name = 'Pizza Hut';

-- Use Case 9: Order 1001 amount corrected
UPDATE Orders
SET order_amount = 550
WHERE order_id = 1001;


-- PART 3 : DELETE QUERIES

-- Use Case 10: Delete customer ID 3
DELETE FROM Customers
WHERE customer_id = 3;

-- Use Case 11: Cancel order 1002
DELETE FROM Orders
WHERE order_id = 1001;

-- Use Case 12: Remove restaurants from Bangalore
DELETE FROM Restaurants
WHERE city = 'Bhopal';


-- Always check before delete
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Restaurants;