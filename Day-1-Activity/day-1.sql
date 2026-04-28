-- Create Database // Activity - 1
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

-- PART 1 : SELECT QUERIES // Activity - 2

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

-- CREATE DATABASE // Activity - 3

CREATE DATABASE companydb;
USE companydb;

-- CREATE EMPLOYEES TABLE

CREATE TABLE employees(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(100),
password VARCHAR(100),
emp_dept VARCHAR(50),
city VARCHAR(50),
salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(101,'Vishal','vishal@123','IT','Ghaziabad',50000),
(102,'Ravi','ravi@123','Finance','Delhi',60000),
(103,'Aman','aman@123','HR','Noida',45000),
(104,'Priya','priya@123','Finance','Pune',80000),
(105,'Neha','neha@123','Training','Delhi',67000);

SELECT * FROM employees;

UPDATE employees
SET password='Hello@123'
WHERE emp_id=102;

-- JDBC Parameterized Query
-- UPDATE employees SET password=? WHERE emp_id=?;

UPDATE employees
SET city='Pune'
WHERE emp_name='Ravi';

-- DELETE QUERIES

DELETE FROM employees
WHERE emp_id=103;

-- JDBC Parameterized Query
-- DELETE FROM employees WHERE emp_id=?;
-- SELECT QUERIES

SELECT emp_id,emp_name,salary FROM employees;

SELECT emp_name,salary
FROM employees
WHERE emp_id=101;

SELECT * FROM employees
WHERE emp_id=101;

-- Employees in Finance Department
SELECT * FROM employees
WHERE emp_dept='Finance';

-- Salary above 60000
SELECT * FROM employees
WHERE salary > 60000;

SELECT emp_id,emp_name,salary
FROM employees
ORDER BY emp_id DESC;

-- Highest salary first
SELECT emp_name,salary
FROM employees
ORDER BY salary DESC;

-- Top 2 highest salary
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 2;

-- 3rd highest salary
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

-- ALTER COMMANDS

-- Add new column
ALTER TABLE employees
ADD joiningdate DATETIME;

-- Update joining dates
UPDATE employees
SET joiningdate=NOW()
WHERE salary=50000;

UPDATE employees
SET joiningdate='2026-04-10 15:31:58'
WHERE salary=60000;

UPDATE employees
SET joiningdate='2026-04-15 15:31:58'
WHERE salary=80000;

-- Rename table
RENAME TABLE employees TO emp_data;

-- Modify column
ALTER TABLE emp_data
MODIFY COLUMN emp_id INT AUTO_INCREMENT PRIMARY KEY;

-- Insert new employee
INSERT INTO emp_data
(emp_name,password,emp_dept,city,salary,joiningdate)
VALUES
('Bhargavi','bhargav@123','Training','Hyderabad',67000,'2026-05-01 15:31:58');

-- Rename column
ALTER TABLE emp_data
RENAME COLUMN joiningdate TO joining_date;

-- Drop column
ALTER TABLE emp_data
DROP COLUMN joining_date;

-- DROP / TRUNCATE / DELETE PRACTICE

CREATE TABLE users(
emp_id INT,
username VARCHAR(30),
role_name VARCHAR(30)
);

INSERT INTO users VALUES
(101,'A','superadmin'),
(102,'B','admin');

SELECT * FROM users;

DELETE FROM users WHERE emp_id=102;

TRUNCATE TABLE users;

DROP TABLE users;

SELECT * FROM emp_data;
DESC emp_data;