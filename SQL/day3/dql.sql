use frontenddb;

CREATE TABLE Employees(

   id INT,

   name VARCHAR(100),

   department VARCHAR(50),

   salary INT,

   city VARCHAR(50)

);

INSERT INTO Employees
VALUES
(101,'Sudhan','Developer',65000,'Chennai'),
(102,'Rahul','Tester',40000,'Madurai'),
(103,'Karthik','Developer',55000,'Chennai'),
(104,'Ajay','HR',35000,'Salem'),
(105,'Vijay','Manager',85000,'Coimbatore'),
(106,'Arun','Developer',60000,'Bangalore'),
(107,'Priya','Tester',45000,'Chennai'),
(108,'Divya','HR',30000,'Madurai'),
(109,'Surya','Developer',70000,'Salem'),
(110,'Anitha','Manager',90000,'Chennai');

select * from Employees;

select name, department, salary from Employees;

SELECT DISTINCT city from Employees;

SELECT * FROM Employees WHERE city = 'chennai';

SELECT * FROM Employees WHERE salary > 60000 ;

SELECT * FROM Employees WHERE salary <= 45000;

SELECT * FROM Employees WHERE  department = 'Developer' AND city = 'chennai';

SELECT * FROM Employees WHERE city = 'Madurai' OR city = 'Salem';

SELECT * FROM Employees WHERE name LIKE "A%";

SELECT * FROM Employees WHERE name LIKE "%A";

SELECT * FROM Employees WHERE name LIKE "%ya%";

SELECT * FROM Employees WHERE city IN ('chennai', 'Salem') ;

SELECT * FROM Employees WHERE salary BETWEEN 45000 AND 70000;

SELECT * FROM Employees ORDER BY salary desc;

SELECT * FROM Employees ORDER BY name asc;

select name FROM Employees LIMIT 5;

SELECT salary FROM Employees ORDER BY salary desc LIMIT 5; 