USE frontenddb;

CREATE TABLE Employeesdata (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50)
);

INSERT INTO Employeesdata (name, department, salary, city)
VALUES
('Arun',    'Developer', 70000, 'Chennai'),
('Bala',    'Developer', 65000, 'Madurai'),
('Charan',  'Tester',    45000, 'Salem'),
('Divya',   'HR',        50000, 'Chennai'),
('Eswar',   'Manager',   90000, 'Coimbatore'),
('Farhana', 'Developer', 75000, 'Trichy'),
('Gokul',   'Tester',    48000, 'Madurai'),
('Hari',    'HR',        52000, 'Salem'),
('Indhu',   'Manager',   95000, 'Chennai'),
('Jeeva',   'Developer', 68000, 'Coimbatore'),
('Karthik', 'Support',   40000, 'Trichy'),
('Lavanya', 'Support',   42000, 'Chennai'),
('Manoj',   'Developer', 72000, 'Madurai'),
('Nisha',   'Tester',    47000, 'Salem'),
('Praveen', 'HR',        55000, 'Coimbatore'),
('Queen',   'Support',   41000, 'Madurai'),
('Rahul',   'Manager',   98000, 'Trichy'),
('Sneha',   'Developer', 78000, 'Chennai'),
('Tamil',   'Tester',    46000, 'Coimbatore'),
('Uma',     'HR',        53000, 'Madurai');

SELECT * FROM Employeesdata; 

SELECT department, count(department) NoOfEmployees FROM Employeesdata GROUP BY department;

SELECT city, count(city) TotalEmployees FROM Employeesdata GROUP BY city;

SELECT department, sum(salary) DepartmentTotalSalary FROM Employeesdata GROUP BY department;

SELECT city, sum(salary) CityTotalSalary FROM Employeesdata GROUP BY city;

SELECT department, avg(salary) AvgTotalSalary FROM Employeesdata GROUP BY department;

SELECT department, max(salary) HighestTotalSalary FROM Employeesdata GROUP BY department;

SELECT department, min(salary) LowestTotalSalary FROM Employeesdata GROUP BY department;

SELECT city, avg(salary) CityAvgSalary FROM Employeesdata GROUP BY city;

SELECT department, count(name) TotalEmp, sum(salary) CountTotSalary FROM Employeesdata GROUP BY department;

SELECT city, count(name) TotalEmp, max(salary) CitymaxSalary, min(salary) CityminSalary FROM Employeesdata GROUP BY city;

SELECT department, count(department) NumOfDepartment, sum(salary) TotSalary, avg(salary) AvgSalary, max(salary) MaxSalary , min(salary) MinSalary FROM Employeesdata GROUP BY department;

SELECT city, count(city) TotCity, sum(salary) TotSalary, avg(salary) AvgSalary FROM Employeesdata GROUP BY city;