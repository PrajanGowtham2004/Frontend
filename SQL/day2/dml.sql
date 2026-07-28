USE frontenddb;

CREATE TABLE emptable(
empid INT,
empname varchar(50),
empdepartment varchar(50),
salary INT,
city VARCHAR(50)

);

INSERT INTO emptable
VALUES
(1,'Prajan', 'CSE', '30000', 'Theni'),
(2,'Gowtham', 'CSE', '30000', 'Theni'),
(3,'Harsha', 'EEE', '30000', 'Theni'),
(4,'Bala', 'ECE', '30000', 'Theni'),
(5,'Prakash', 'CSE', '30000', 'Theni'),
(6,'Harish', 'CSE', '30000', 'Theni'),
(7,'Kumar', 'CSE', '30000', 'Theni'),
(8,'Anil', 'CSE', '30000', 'Theni');