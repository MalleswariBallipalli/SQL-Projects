CREATE DATABASE banking;
USE banking;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    city VARCHAR(50)
);
CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO customers (name, city) VALUES
('Janani','Chennai'),
('Arun','Coimbatore'),
('Priya','Madurai'),
('Karthik','Salem');
INSERT INTO accounts (customer_id, account_type, balance) VALUES
(1,'Savings',50000),
(1,'Current',20000),
(2,'Savings',30000),
(3,'Savings',15000),
(4,'Current',40000);
SELECT * FROM customers;
SELECT * FROM accounts;
SELECT *
FROM accounts
WHERE balance > 20000;
SELECT *
FROM customers
WHERE city = 'Chennai';
SELECT *
FROM accounts
WHERE balance BETWEEN 20000 AND 50000;
SELECT *
FROM customers
WHERE name LIKE 'J%';
SELECT *
FROM accounts
WHERE account_type IN ('Savings', 'Current');
SELECT *
FROM accounts
WHERE account_type <> 'Savings';
SELECT *
FROM customers
WHERE name LIKE '%a%';
SELECT *
FROM accounts
WHERE balance <= 30000;
SELECT *
FROM customers
WHERE city <> 'Madurai';
SELECT *
FROM accounts
WHERE balance NOT BETWEEN 10000 AND 40000;
SELECT *
FROM customers
WHERE name LIKE '%i';
SELECT *
FROM accounts
WHERE balance = 50000;
SELECT *
FROM customers
WHERE city IN ('Chennai', 'Salem');
SELECT *
FROM accounts
WHERE balance > 10000
  AND balance < 40000;
  SELECT *
FROM accounts
WHERE account_type NOT IN ('Current');
SELECT *
FROM accounts
ORDER BY balance ASC;
SELECT *
FROM accounts
ORDER BY balance DESC;
SELECT *
FROM accounts
ORDER BY account_type ASC, balance DESC;
SELECT SUM(balance) AS total_balance
FROM accounts;
SELECT AVG(balance) AS average_balance
FROM accounts;
SELECT MAX(balance) AS maximum_balance
FROM accounts;
SELECT MIN(balance) AS minimum_balance
FROM accounts;
SELECT COUNT(*) AS total_accounts
FROM accounts;
SELECT account_type, COUNT(*) AS total_accounts
FROM accounts
GROUP BY account_type;
SELECT account_type, SUM(balance) AS total_balance
FROM accounts
GROUP BY account_type;
SELECT account_type, SUM(balance) AS total_balance
FROM accounts
GROUP BY account_type
HAVING SUM(balance) > 50000;
SELECT account_type, COUNT(*) AS total_accounts
FROM accounts
GROUP BY account_type
HAVING COUNT(*) > 1;
SELECT account_type, AVG(balance) AS average_balance
FROM accounts
GROUP BY account_type;
SELECT customers.name, accounts.balance
FROM customers
JOIN accounts
ON customers.customer_id = accounts.customer_id;
SELECT customers.name, accounts.account_id, accounts.account_type, accounts.balance
FROM customers
LEFT JOIN accounts
ON customers.customer_id = accounts.customer_id;
SELECT accounts.account_id,
       accounts.account_type,
       accounts.balance,
       customers.name,
       customers.city
FROM accounts
JOIN customers
ON accounts.customer_id = customers.customer_id;
SELECT customers.name, accounts.account_type
FROM customers
JOIN accounts
ON customers.customer_id = accounts.customer_id
WHERE accounts.balance > 20000;
SELECT customers.name,
       SUM(accounts.balance) AS total_balance
FROM customers
JOIN accounts
ON customers.customer_id = accounts.customer_id
GROUP BY customers.customer_id, customers.name;
SELECT customers.name,
       accounts.balance
FROM customers
JOIN accounts
ON customers.customer_id = accounts.customer_id
ORDER BY accounts.balance;
SELECT customers.city,
       COUNT(accounts.account_id) AS total_accounts
FROM customers
JOIN accounts
ON customers.customer_id = accounts.customer_id
GROUP BY customers.city;
SELECT *
FROM accounts
WHERE balance > (
    SELECT AVG(balance)
    FROM accounts
);
SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM accounts
);
SELECT *
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM accounts
);
SELECT *
FROM accounts
WHERE balance = (
    SELECT MAX(balance)
    FROM accounts
);
SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM accounts
    GROUP BY customer_id
    HAVING SUM(balance) > 40000
);
SELECT *
FROM bookings
WHERE fare > 400;
SELECT *
FROM bookings
WHERE status <> 'Confirmed';
SHOW TABLES;
USE banking;

SHOW TABLES;
CREATE TABLE trains (
    train_id INT PRIMARY KEY AUTO_INCREMENT,
    train_name VARCHAR(50),
    source VARCHAR(50),
    destination VARCHAR(50)
);
CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    train_id INT,
    passenger_name VARCHAR(50),
    fare DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (train_id) REFERENCES trains(train_id)
);
INSERT INTO trains (train_name, source, destination) VALUES
('Express1', 'Chennai', 'Madurai'),
('Express2', 'Coimbatore', 'Salem'),
('Express3', 'Madurai', 'Chennai');
INSERT INTO bookings (train_id, passenger_name, fare, status) VALUES
(1, 'Janani', 500, 'Confirmed'),
(1, 'Arun', 500, 'Waiting'),
(2, 'Priya', 300, 'Confirmed'),
(3, 'Karthik', 450, 'Cancelled'),
(2, 'Meena', 300, 'Confirmed');
SELECT *
FROM bookings
WHERE fare > 400;
SELECT *
FROM bookings
WHERE status <> 'Confirmed';
SELECT *
FROM trains
WHERE source = 'Chennai';
SELECT *
FROM bookings
WHERE fare BETWEEN 300 AND 500;
SELECT *
FROM bookings
WHERE passenger_name LIKE 'A%';
SELECT t.train_name, b.passenger_name
FROM trains t
JOIN bookings b
ON t.train_id = b.train_id;
SELECT train_id, COUNT(*) AS total_bookings
FROM bookings
GROUP BY train_id;
SELECT t.train_name, SUM(b.fare) AS total_fare
FROM trains t
JOIN bookings b
ON t.train_id = b.train_id
GROUP BY t.train_id, t.train_name;
SELECT *
FROM bookings
WHERE fare = (
    SELECT MAX(fare)
    FROM bookings
);
SELECT t.train_name, COUNT(b.booking_id) AS total_bookings
FROM trains t
JOIN bookings b
ON t.train_id = b.train_id
GROUP BY t.train_id, t.train_name
HAVING COUNT(b.booking_id) > 1;
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    city VARCHAR(30),
    joining_date DATE
);
INSERT INTO Employee VALUES
(101, 'John', 'IT', 60000, 'Chennai', '2022-01-15'),
(102, 'David', 'HR', 45000, 'Bangalore', '2021-03-10'),
(103, 'Smith', 'IT', 70000, 'Chennai', '2020-07-12'),
(104, 'Mary', 'Finance', 55000, 'Mumbai', '2023-01-20'),
(105, 'James', 'HR', 48000, 'Delhi', '2022-05-05'),
(106, 'Linda', 'Finance', 65000, 'Mumbai', '2021-08-18');
SELECT department, COUNT(*) AS total_employees
FROM Employee
GROUP BY department;
SELECT department, AVG(salary) AS average_salary
FROM Employee
GROUP BY department;
SELECT department, COUNT(*) AS total_employees
FROM Employee
GROUP BY department
HAVING COUNT(*) > 1;
SELECT department, COUNT(*) AS total_employees
FROM Employee
GROUP BY department
HAVING COUNT(*) > 1;
SELECT department, MAX(salary) AS highest_salary
FROM Employee
GROUP BY department;
SELECT department, MIN(salary) AS lowest_salary
FROM Employee
GROUP BY department;
SELECT department, AVG(salary) AS average_salary
FROM Employee
GROUP BY department
HAVING AVG(salary) > 50000;
SELECT department, SUM(salary) AS total_salary
FROM Employee
GROUP BY department;
SELECT *
FROM Employee
ORDER BY salary DESC;
SELECT *
FROM Employee
ORDER BY department, salary DESC;
SELECT city, COUNT(*) AS total_employees
FROM Employee
GROUP BY city
HAVING COUNT(*) > 1;
SELECT city, SUM(salary) AS total_salary
FROM Employee
GROUP BY city;
SELECT department, SUM(salary) AS total_salary
FROM Employee
GROUP BY department
ORDER BY total_salary DESC;
SELECT department, COUNT(*) AS total_employees
FROM Employee
WHERE salary > 50000
GROUP BY department;
SELECT department,
       MAX(salary) - MIN(salary) AS salary_difference
FROM Employee
GROUP BY department;
SELECT *
FROM Employee
ORDER BY salary DESC
LIMIT 3;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
SELECT customer_id, SUM(amount) AS total_order_amount
FROM Orders
GROUP BY customer_id;
SELECT customer_id, COUNT(*) AS total_orders
FROM Orders
GROUP BY customer_id
HAVING COUNT(*) > 3;
SELECT customer_id, AVG(amount) AS average_order_amount
FROM Orders
GROUP BY customer_id;

SELECT customer_id, MAX(amount) AS highest_order_amount
FROM Orders
GROUP BY customer_id;
SELECT customer_id, SUM(amount) AS total_purchase_amount
FROM Orders
GROUP BY customer_id
ORDER BY total_purchase_amount;
SELECT customer_id, SUM(amount) AS total_purchase_amount
FROM Orders
GROUP BY customer_id
HAVING SUM(amount) > 10000;
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;
SELECT customer_id, SUM(amount) AS total_purchase_amount
FROM Orders
GROUP BY customer_id
ORDER BY total_purchase_amount DESC
LIMIT 1;
SELECT customer_id, COUNT(*) AS total_orders
FROM Orders
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 1;
SELECT customer_id, AVG(amount) AS average_order_amount
FROM Orders
GROUP BY customer_id
HAVING AVG(amount) > 2000;
SELECT customer_id, SUM(amount) AS total_purchase_amount
FROM Orders
GROUP BY customer_id
ORDER BY total_purchase_amount DESC
LIMIT 5;
SELECT customer_id, MIN(amount) AS minimum_order_amount
FROM Orders
GROUP BY customer_id;
SELECT customer_id, SUM(amount) AS total_purchase_amount
FROM Orders
GROUP BY customer_id
HAVING SUM(amount) > 5000;
SELECT customer_id, SUM(amount) AS total_purchase_amount
FROM Orders
GROUP BY customer_id
HAVING SUM(amount) > 5000;
SELECT customer_id,
       COUNT(*) AS total_orders,
       SUM(amount) AS total_purchase_amount
FROM Orders
GROUP BY customer_id
HAVING COUNT(*) > 2
   AND SUM(amount) > 8000;
   SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department;
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department VARCHAR(30),
    marks INT
);
SELECT department, MAX(marks) AS highest_mark
FROM Students
GROUP BY department;
SELECT department, COUNT(*) AS total_students
FROM Students
GROUP BY department;
SELECT department, COUNT(*) AS total_students
FROM Students
GROUP BY department
HAVING COUNT(*) > 5;
SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department
ORDER BY average_marks DESC;
SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department
ORDER BY average_marks DESC
LIMIT 3;
SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department
HAVING AVG(marks) BETWEEN 70 AND 90;
SELECT department, SUM(marks) AS total_marks
FROM Students
GROUP BY department;
SELECT department, COUNT(*) AS total_students
FROM Students
GROUP BY department
ORDER BY total_students;
SELECT department, MIN(marks) AS lowest_mark
FROM Students
GROUP BY department;
SELECT department, MAX(marks) AS highest_mark
FROM Students
GROUP BY department
HAVING MAX(marks) > 90;
SELECT department, COUNT(*) AS students_above_80
FROM Students
WHERE marks > 80
GROUP BY department;
SELECT department, COUNT(*) AS students_above_75
FROM Students
WHERE marks > 75
GROUP BY department
HAVING COUNT(*) > 3;
SELECT department, MAX(marks) AS highest_mark
FROM Students
GROUP BY department
ORDER BY highest_mark DESC;