-- Task 1
CREATE DATABASE CompanyDB;
USE CompanyDB;


-- Task 2
CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50)
);


-- Task 3
ALTER TABLE Employees ADD email VARCHAR(100);

ALTER TABLE Employees MODIFY salary DECIMAL(12,2);

ALTER TABLE Employees RENAME COLUMN city TO location;


-- Task 4
INSERT INTO Employees (id, name, department, salary, location, email)
VALUES
(1, 'Arun', 'Developer', 55000, 'Chennai', 'arun@gmail.com'),
(2, 'Priya', 'Tester', 45000, 'Bangalore', 'priya@gmail.com'),
(3, 'Karthik', 'Developer', 65000, 'Chennai', 'karthik@gmail.com'),
(4, 'Divya', 'HR', 40000, 'Mumbai', 'divya@gmail.com'),
(5, 'Rahul', 'Sales', 60000, 'Chennai', 'rahul@gmail.com'),
(6, 'Sneha', 'Developer', 75000, 'Bangalore', 'sneha@gmail.com'),
(7, 'Vijay', 'Tester', 48000, 'Chennai', 'vijay@gmail.com'),
(8, 'Meena', 'Sales', 70000, 'Mumbai', 'meena@gmail.com'),
(9, 'Ajay', 'Developer', 80000, 'Chennai', 'ajay@gmail.com'),
(10, 'Anu', 'HR', 42000, 'Bangalore', 'anu@gmail.com');


-- Task 5
UPDATE Employees
SET salary = 60000
WHERE id = 1;

UPDATE Employees
SET department = 'Developer'
WHERE id = 2;

UPDATE Employees
SET salary = 65000, department = 'Sales'
WHERE id = 4;


-- Task 6
DELETE FROM Employees
WHERE id = 10;

DELETE FROM Employees
WHERE location = 'Hyderabad';


-- Task 7
SELECT * FROM Employees;

SELECT name, salary
FROM Employees;

SELECT DISTINCT department
FROM Employees;

SELECT *
FROM Employees
WHERE salary > 40000;


-- Task 8
SELECT *
FROM Employees
WHERE department = 'Developer' AND salary > 50000;

SELECT *
FROM Employees
WHERE department = 'Developer' OR department = 'Tester';

SELECT *
FROM Employees
WHERE department IN ('Developer', 'Tester', 'Sales');

SELECT *
FROM Employees
WHERE department NOT IN ('HR', 'Tester');

SELECT *
FROM Employees
WHERE salary BETWEEN 40000 AND 70000;

SELECT *
FROM Employees
WHERE name LIKE 'A%';


-- Task 9
SELECT *
FROM Employees
ORDER BY salary DESC
LIMIT 1;

SELECT *
FROM Employees
ORDER BY salary ASC
LIMIT 1;

SELECT *
FROM Employees
ORDER BY salary DESC
LIMIT 5;

SELECT *
FROM Employees
ORDER BY id DESC
LIMIT 3;


-- Task 10
SELECT COUNT(*) AS TotalEmployees
FROM Employees;

SELECT SUM(salary) AS TotalSalary
FROM Employees;

SELECT AVG(salary) AS AverageSalary
FROM Employees;

SELECT MAX(salary) AS HighestSalary
FROM Employees;

SELECT MIN(salary) AS LowestSalary
FROM Employees;


-- Task 11
SELECT department, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY department;

SELECT department, SUM(salary) AS TotalSalary
FROM Employees
GROUP BY department;

SELECT location, AVG(salary) AS AverageSalary
FROM Employees
GROUP BY location;

SELECT department, MAX(salary) AS HighestSalary
FROM Employees
GROUP BY department;


-- Task 12
SELECT department, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY department
HAVING COUNT(*) > 2;

SELECT location, AVG(salary) AS AverageSalary
FROM Employees
GROUP BY location
HAVING AVG(salary) > 50000;

SELECT department, SUM(salary) AS TotalSalary
FROM Employees
GROUP BY department
HAVING SUM(salary) > 200000;


-- Task 13
SELECT UPPER(name) FROM Employees;

SELECT LOWER(name) FROM Employees;

SELECT LENGTH(name) FROM Employees;

SELECT CONCAT(name, ' - ', department) FROM Employees;

SELECT SUBSTRING(name, 1, 3) FROM Employees;

SELECT REPLACE(department, 'Developer', 'Software Developer')
FROM Employees;

SELECT LEFT(name, 3) FROM Employees;

SELECT RIGHT(name, 3) FROM Employees;

SELECT REVERSE(name) FROM Employees;

SELECT TRIM(name) FROM Employees;


-- Task 14
SELECT CURDATE();

SELECT NOW();

SELECT YEAR(CURDATE());

SELECT MONTH(CURDATE());

SELECT DAY(CURDATE());

SELECT DATE_FORMAT(CURDATE(), '%d-%m-%Y');

SELECT DATEDIFF(CURDATE(), '2026-01-01');


-- Task 15
SELECT
    department,
    COUNT(*) AS EmployeeCount,
    SUM(salary) AS TotalSalary,
    AVG(salary) AS AverageSalary,
    MAX(salary) AS HighestSalary,
    MIN(salary) AS LowestSalary
FROM Employees
GROUP BY department
ORDER BY TotalSalary DESC;


-- Task 16
SELECT
    location AS City,
    COUNT(*) AS EmployeeCount,
    AVG(salary) AS AverageSalary
FROM Employees
WHERE salary > 40000
GROUP BY location
HAVING COUNT(*) > 2;


-- Task 17
SELECT
    department,
    SUM(salary) AS TotalSalary,
    MAX(salary) AS HighestSalary,
    MIN(salary) AS LowestSalary
FROM Employees
GROUP BY department
HAVING AVG(salary) > 60000;


-- Task 18
SELECT
    department,
    location AS City,
    COUNT(*) AS EmployeeCount,
    SUM(salary) AS TotalSalary
FROM Employees
GROUP BY department, location
ORDER BY EmployeeCount DESC;


-- Task 19
SELECT
    department,
    COUNT(*) AS EmployeeCount,
    SUM(salary) AS TotalSalary,
    AVG(salary) AS AverageSalary
FROM Employees
WHERE salary > 35000
AND location = 'Chennai'
GROUP BY department
HAVING COUNT(*) > 2
AND AVG(salary) > 50000
ORDER BY TotalSalary DESC
LIMIT 3;


-- Task 20
CREATE DATABASE EmployeeManagementDB;
USE EmployeeManagementDB;

CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50)
);

ALTER TABLE Employees ADD email VARCHAR(100);

ALTER TABLE Employees ADD joining_date DATE;

INSERT INTO Employees
(id, name, department, salary, city, email, joining_date)
VALUES
(1, 'Arun', 'Developer', 55000, 'Chennai', 'arun@gmail.com', '2024-01-10'),
(2, 'Priya', 'Tester', 45000, 'Bangalore', 'priya@gmail.com', '2024-02-15'),
(3, 'Karthik', 'Developer', 65000, 'Chennai', 'karthik@gmail.com', '2023-05-20'),
(4, 'Divya', 'HR', 50000, 'Mumbai', 'divya@gmail.com', '2024-03-12'),
(5, 'Rahul', 'Sales', 60000, 'Chennai', 'rahul@gmail.com', '2023-08-18'),
(6, 'Sneha', 'Developer', 75000, 'Bangalore', 'sneha@gmail.com', '2022-11-05'),
(7, 'Vijay', 'Tester', 48000, 'Chennai', 'vijay@gmail.com', '2024-04-25'),
(8, 'Meena', 'Sales', 70000, 'Mumbai', 'meena@gmail.com', '2023-09-14'),
(9, 'Ajay', 'Developer', 80000, 'Chennai', 'ajay@gmail.com', '2022-06-30'),
(10, 'Anu', 'HR', 42000, 'Bangalore', 'anu@gmail.com', '2024-05-11'),
(11, 'Surya', 'Developer', 68000, 'Chennai', 'surya@gmail.com', '2023-02-17'),
(12, 'Nisha', 'Tester', 52000, 'Mumbai', 'nisha@gmail.com', '2024-01-28'),
(13, 'Ravi', 'Sales', 72000, 'Chennai', 'ravi@gmail.com', '2022-12-09'),
(14, 'Pooja', 'HR', 58000, 'Bangalore', 'pooja@gmail.com', '2023-07-23'),
(15, 'Manoj', 'Developer', 85000, 'Chennai', 'manoj@gmail.com', '2022-04-16');

UPDATE Employees
SET salary = 60000
WHERE id = 1;

UPDATE Employees
SET department = 'Developer'
WHERE id = 7;

UPDATE Employees
SET salary = 65000, city = 'Chennai'
WHERE id = 4;

DELETE FROM Employees
WHERE id = 10;

SELECT *
FROM Employees
WHERE salary > 50000;

SELECT *
FROM Employees
ORDER BY salary DESC;

SELECT *
FROM Employees
ORDER BY salary DESC
LIMIT 5;

SELECT
    COUNT(*) AS TotalEmployees,
    SUM(salary) AS TotalSalary,
    AVG(salary) AS AverageSalary,
    MAX(salary) AS HighestSalary,
    MIN(salary) AS LowestSalary
FROM Employees;

SELECT department, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY department;

SELECT department, AVG(salary) AS AverageSalary
FROM Employees
GROUP BY department
HAVING AVG(salary) > 50000;

SELECT
    UPPER(name),
    LOWER(name),
    LENGTH(name),
    CONCAT(name, ' - ', department)
FROM Employees;

SELECT
    name,
    joining_date,
    YEAR(joining_date),
    MONTH(joining_date),
    DAY(joining_date),
    DATEDIFF(CURDATE(), joining_date)
FROM Employees;

SELECT
    department,
    COUNT(*) AS EmployeeCount,
    SUM(salary) AS TotalSalary,
    AVG(salary) AS AverageSalary,
    MAX(salary) AS HighestSalary,
    MIN(salary) AS LowestSalary
FROM Employees
GROUP BY department
ORDER BY TotalSalary DESC;