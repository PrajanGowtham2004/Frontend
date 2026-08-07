CREATE DATABASE teashop;
USE teashop;

CREATE TABLE teaemp (
    empid INT PRIMARY KEY,
    empname VARCHAR(50),
    empdepart VARCHAR(50),
    empsalary DECIMAL(10,2)
);

INSERT INTO teaemp
(empid, empname, empdepart, empsalary)
VALUES
(1, 'Rahul Singh', 'Sales', 45000),
(2, 'Arun Kumar', 'Sales', 35000),
(3, 'Priya Sharma', 'HR', 40000),
(4, 'Karthik Raj', 'IT', 55000),
(5, 'Sneha Patel', 'IT', 50000),
(6, 'Vijay Kumar', 'Finance', 30000),
(7, 'Anjali Rao', 'HR', 38000),
(8, 'Ravi Sharma', 'Finance', 42000),
(9, 'Meena Devi', 'Sales', 32000),
(10, 'Ajay Singh', 'IT', 60000);

SELECT * FROM teaemp;

-- Task 1
SELECT *
FROM teaemp
WHERE empsalary > (
    SELECT AVG(empsalary)
    FROM teaemp
);

-- Task 2
SELECT *
FROM teaemp
WHERE empsalary = (
    SELECT MAX(empsalary)
    FROM teaemp
);

-- Task 3
SELECT *
FROM teaemp
WHERE empsalary = (
    SELECT MIN(empsalary)
    FROM teaemp
);

-- Task 4
SELECT *
FROM teaemp
WHERE empdepart = (
    SELECT empdepart
    FROM teaemp
    WHERE empname = 'Rahul Singh'
);

-- Task 5
SELECT *
FROM teaemp
WHERE empdepart IN (
    SELECT empdepart
    FROM teaemp
    WHERE empsalary > 40000
);

-- Bonus Query 1
SELECT *
FROM teaemp
WHERE empsalary < (
    SELECT MAX(empsalary)
    FROM teaemp
);

-- Bonus Query 2
SELECT *
FROM teaemp
WHERE empsalary > (
    SELECT MIN(empsalary)
    FROM teaemp
);
