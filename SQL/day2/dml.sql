USE frontenddb;

CREATE TABLE emptable(
empid INT ,
empname varchar(50),
empdepartment varchar(50),
salary INT,
city VARCHAR(50)


);

ALTER TABLE emptable
ADD created_by VARCHAR(50) DEFAULT 'Admin',
ADD created_at date,
ADD updated_by VARCHAR(50),
ADD updated_at date
;



INSERT INTO emptable
VALUES
(1,'Prajan', 'CSE', '70000', 'Theni'),
(2,'Gowtham', 'CSE', '40000', 'Chennai'),
(3,'Harsha', 'EEE', '20000', 'Bangalore'),
(4,'Bala', 'ECE', '25000', 'Coimbatore'),
(5,'Prakash', 'CA', '50000', 'Hyderabad'),
(6,'Harish', 'EEE', '50000', 'Gurgagon'),
(7,'Kumar', 'ECE', '60000', 'Kochi'),
(8,'Vijay', 'Mech', '40000', 'Chennai');

SELECT * FROM emptable;

DESC emptable;

SET SQL_SAFE_UPDATES = 0;

UPDATE emptable set salary = 75000 where empid = 3;

SELECT * FROM emptable where empid = 3;

UPDATE emptable set empdepartment = 'Team Lead', city = 'Bangalore' WHERE empid=2;

select * FROM emptable WHERE empid = 2;

DELETE FROM emptable WHERE empid = 5;

SELECT * FROM emptable;



UPDATE emptable set salary = salary + 10000 WHERE empdepartment = 'CSE';

SELECT * FROM emptable WHERE empdepartment = 'CSE';

UPDATE emptable SET city = 'Coimbatore' WHERE city = 'chennai';

SELECT * FROM emptable WHERE city = 'coimbatore';

ALTER TABLE emptable ADD age INT;

UPDATE emptable SET age = 22 WHERE empid = 1;
UPDATE emptable SET age = 18 WHERE empid = 2;
UPDATE emptable SET age = 19 WHERE empid = 3;
UPDATE emptable SET age = 26 WHERE empid = 4;
UPDATE emptable SET age = 25 WHERE empid = 6;
UPDATE emptable SET age = 19 WHERE empid = 7;
UPDATE emptable SET age = 29 WHERE empid = 8;

DELETE FROM emptable WHERE age < 20; 


