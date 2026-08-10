

CREATE DATABASE IF NOT EXISTS CompanyDB;
USE CompanyDB;


-- TASK 1: CREATE EMPLOYEES

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    City VARCHAR(50),
    JoiningDate DATE
);


-- TASK 3: ALTER EMPLOYEES


ALTER TABLE Employees
ADD Email VARCHAR(100);


ALTER TABLE Employees
MODIFY EmployeeName VARCHAR(100);


ALTER TABLE Employees
RENAME COLUMN EmployeeName TO FullName;


ALTER TABLE Employees
DROP COLUMN Email;


-- TASK 4: RENAME, TRUNCATE, DROP


RENAME TABLE Employees TO EmployeeDetails;

TRUNCATE TABLE EmployeeDetails;

DROP TABLE EmployeeDetails;

-- TASK 2: CREATE DEPARTMENT, CITY AND EMPLOYEE TABLES


CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

CREATE TABLE City (
    CityID INT PRIMARY KEY,
    CityName VARCHAR(50) NOT NULL
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    CityID INT,
    Salary DECIMAL(10,2),
    JoiningDate DATE,

    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID),

    FOREIGN KEY (CityID)
        REFERENCES City(CityID)
);


-- INSERT DEPARTMENTS


INSERT INTO Department
VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Sales');


-- INSERT CITIES

INSERT INTO City
VALUES
(1, 'Chennai'),
(2, 'Salem'),
(3, 'Madurai'),
(4, 'Coimbatore'),
(5, 'Bangalore');


-- TASK 5: INSERT 15 EMPLOYEES


INSERT INTO Employee
(EmployeeID, EmployeeName, DepartmentID, CityID, Salary, JoiningDate)
VALUES
(101, 'Arun',   1, 1, 55000, '2024-01-10'),
(102, 'Rahul',  2, 1, 42000, '2023-05-15'),
(103, 'Karan',  1, 2, 65000, '2022-08-20'),
(104, 'Anand',  3, 3, 48000, '2024-02-12'),
(105, 'Varun',  4, 1, 38000, '2023-11-01'),
(106, 'Priya',  2, 4, 52000, '2022-06-18'),
(107, 'Arjun',  1, 3, 72000, '2021-09-25'),
(108, 'Kiran',  3, 1, 46000, '2024-03-10'),
(109, 'Mohan',  4, 2, 30000, '2023-07-14'),
(110, 'Akhil',  1, 1, 58000, '2022-12-05'),
(111, 'Sanjay', 2, 3, 27000, '2024-04-22'),
(112, 'Harish', 3, 4, 61000, '2021-03-19'),
(113, 'Aarav',  1, 2, 49000, '2023-10-11'),
(114, 'Divya',  4, 1, 44000, '2022-01-30'),
(115, 'Rohan',  2, 5, 35000, '2024-05-16');


-- TASK 6:

UPDATE Employee
SET Salary = Salary + 5000
WHERE DepartmentID = (
    SELECT DepartmentID
    FROM Department
    WHERE DepartmentName = 'IT'
);


-- TASK 7:


UPDATE Employee
SET CityID = (
    SELECT CityID
    FROM City
    WHERE CityName = 'Chennai'
)
WHERE DepartmentID = (
    SELECT DepartmentID
    FROM Department
    WHERE DepartmentName = 'HR'
);


-- =========================
-- TASK 8:
-- DELETE SALARY < 20000
-- =========================

DELETE FROM Employee
WHERE Salary < 20000;


-- TASK 9:


SELECT e.*
FROM Employee e
INNER JOIN City c
ON e.CityID = c.CityID
WHERE e.Salary > 40000
AND e.Salary < 60000
AND c.CityName = 'Chennai';



-- TASK 10:


SELECT *
FROM Employee
ORDER BY Salary DESC
LIMIT 5;


-- TOP 3 LOWEST PAID


SELECT *
FROM Employee
ORDER BY Salary ASC
LIMIT 3;



-- TASK 11:

SELECT *
FROM Employee
WHERE EmployeeName LIKE 'A%';




SELECT *
FROM Employee
WHERE EmployeeName LIKE '%n';




SELECT *
FROM Employee
WHERE EmployeeName LIKE '%ar%';



-- TASK 12:


SELECT e.*
FROM Employee e
INNER JOIN City c
ON e.CityID = c.CityID
WHERE c.CityName IN ('Chennai', 'Salem', 'Madurai');


-- TASK 13:

SELECT
    COUNT(*) AS TotalEmployees,
    SUM(Salary) AS TotalSalary,
    AVG(Salary) AS AverageSalary,
    MAX(Salary) AS HighestSalary,
    MIN(Salary) AS LowestSalary
FROM Employee;


-- TASK 14:

SELECT
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Department d
INNER JOIN Employee e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName;


-- TASK 15:


SELECT
    c.CityName,
    AVG(e.Salary) AS AverageSalary
FROM City c
INNER JOIN Employee e
ON c.CityID = e.CityID
GROUP BY c.CityID, c.CityName;



-- TASK 16:

SELECT
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Department d
INNER JOIN Employee e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName
HAVING COUNT(e.EmployeeID) > 3;



-- TASK 17:


SELECT
    c.CityName,
    AVG(e.Salary) AS AverageSalary
FROM City c
INNER JOIN Employee e
ON c.CityID = e.CityID
GROUP BY c.CityID, c.CityName
HAVING AVG(e.Salary) > 45000;



-- TASK 18:

SELECT *
FROM Employee
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employee
);



-- TASK 19:


SELECT *
FROM Employee
WHERE DepartmentID = (
    SELECT DepartmentID
    FROM Employee
    WHERE EmployeeName = 'Rahul'
);



-- TASK 20:


SELECT
    e.EmployeeName,
    d.DepartmentName,
    c.CityName
FROM Employee e
INNER JOIN Department d
ON e.DepartmentID = d.DepartmentID
INNER JOIN City c
ON e.CityID = c.CityID;



-- TASK 21:


CREATE TABLE HospitalDepartment (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100),
    DepartmentID INT,
    Phone VARCHAR(15),

    FOREIGN KEY (DepartmentID)
        REFERENCES HospitalDepartment(DepartmentID)
);

CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(100) NOT NULL,
    DOB DATE,
    Gender VARCHAR(10),
    Phone VARCHAR(15)
);

CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    AppointmentTime TIME,

    FOREIGN KEY (PatientID)
        REFERENCES Patient(PatientID),

    FOREIGN KEY (DoctorID)
        REFERENCES Doctor(DoctorID)
);

CREATE TABLE Treatment (
    TreatmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    TreatmentDate DATE,
    Description VARCHAR(255),

    FOREIGN KEY (PatientID)
        REFERENCES Patient(PatientID),

    FOREIGN KEY (DoctorID)
        REFERENCES Doctor(DoctorID)
);

CREATE TABLE Billing (
    BillID INT PRIMARY KEY,
    PatientID INT,
    Amount DECIMAL(10,2),
    BillDate DATE,
    PaymentStatus VARCHAR(30),

    FOREIGN KEY (PatientID)
        REFERENCES Patient(PatientID)
);


-- TASK 22:


CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    CustomerPhone VARCHAR(15)
);

CREATE TABLE Tea (
    TeaID INT PRIMARY KEY,
    TeaName VARCHAR(100),
    TeaPrice DECIMAL(10,2)
);

CREATE TABLE TeaOrders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,

    FOREIGN KEY (CustomerID)
        REFERENCES Customer(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderID INT,
    TeaID INT,
    Quantity INT,

    PRIMARY KEY (OrderID, TeaID),

    FOREIGN KEY (OrderID)
        REFERENCES TeaOrders(OrderID),

    FOREIGN KEY (TeaID)
        REFERENCES Tea(TeaID)
);



-- TASK 23:

CREATE TABLE EmployeeBackup (
    BackupID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    DepartmentID INT,
    CityID INT,
    Salary DECIMAL(10,2),
    JoiningDate DATE,
    BackupDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DELIMITER //

CREATE TRIGGER after_employee_insert
AFTER INSERT ON Employee
FOR EACH ROW
BEGIN

    INSERT INTO EmployeeBackup
    (
        EmployeeID,
        EmployeeName,
        DepartmentID,
        CityID,
        Salary,
        JoiningDate
    )
    VALUES
    (
        NEW.EmployeeID,
        NEW.EmployeeName,
        NEW.DepartmentID,
        NEW.CityID,
        NEW.Salary,
        NEW.JoiningDate
    );

END //

DELIMITER ;



INSERT INTO Employee
VALUES
(116, 'Vijay', 1, 1, 50000, '2026-08-10');

SELECT *
FROM EmployeeBackup;


-- TASK 24:


START TRANSACTION;

UPDATE Employee
SET Salary = Salary + 2000
WHERE EmployeeID = 101;

SAVEPOINT salary_update;

UPDATE Employee
SET Salary = Salary + 3000
WHERE EmployeeID = 102;

ROLLBACK TO SAVEPOINT salary_update;

COMMIT;


-- TASK 25:


CREATE USER 'companyuser'@'localhost'
IDENTIFIED BY 'Company@123';

GRANT SELECT, INSERT
ON CompanyDB.*
TO 'companyuser'@'localhost';

SHOW GRANTS FOR 'companyuser'@'localhost';

REVOKE INSERT
ON CompanyDB.*
FROM 'companyuser'@'localhost';

SHOW GRANTS FOR 'companyuser'@'localhost';
