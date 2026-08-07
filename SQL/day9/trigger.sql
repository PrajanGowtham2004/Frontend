USE teashop;

-- =========================================
-- TASK 1 - AFTER INSERT TRIGGER
-- =========================================

CREATE TABLE emp_insert_backup (
    empid INT,
    empname VARCHAR(50),
    empdepart VARCHAR(50),
    empsalary DECIMAL(10,2)
);

DELIMITER //

CREATE TRIGGER trg_emp_after_insert
AFTER INSERT ON teaemp
FOR EACH ROW
BEGIN
    INSERT INTO emp_insert_backup
    VALUES (
        NEW.empid,
        NEW.empname,
        NEW.empdepart,
        NEW.empsalary
    );
END //

DELIMITER ;


-- =========================================
-- TASK 2 - AFTER UPDATE TRIGGER
-- =========================================

CREATE TABLE emp_update_backup (
    empid INT,
    empname VARCHAR(50),
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2)
);

DELIMITER //

CREATE TRIGGER trg_emp_after_update
AFTER UPDATE ON teaemp
FOR EACH ROW
BEGIN
    INSERT INTO emp_update_backup
    VALUES (
        OLD.empid,
        OLD.empname,
        OLD.empsalary,
        NEW.empsalary
    );
END //

DELIMITER ;


-- =========================================
-- TASK 3 - AFTER DELETE TRIGGER
-- =========================================

CREATE TABLE emp_delete_backup (
    empid INT,
    empname VARCHAR(50),
    empdepart VARCHAR(50),
    empsalary DECIMAL(10,2)
);

DELIMITER //

CREATE TRIGGER trg_emp_after_delete
AFTER DELETE ON teaemp
FOR EACH ROW
BEGIN
    INSERT INTO emp_delete_backup
    VALUES (
        OLD.empid,
        OLD.empname,
        OLD.empdepart,
        OLD.empsalary
    );
END //

DELIMITER ;


-- =========================================
-- TASK 4 - BEFORE INSERT TRIGGER
-- Minimum Salary = 15000
-- =========================================

DELIMITER //

CREATE TRIGGER trg_emp_before_insert
BEFORE INSERT ON teaemp
FOR EACH ROW
BEGIN
    IF NEW.empsalary < 15000 THEN
        SET NEW.empsalary = 15000;
    END IF;
END //

DELIMITER ;


-- =========================================
-- TASK 9 - PRODUCT BACKUP
-- =========================================

CREATE TABLE teaproduct (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

CREATE TABLE product_backup (
    product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10,2),
    stock INT,
    backup_time DATETIME
);

DELIMITER //

CREATE TRIGGER trg_product_update
AFTER UPDATE ON teaproduct
FOR EACH ROW
BEGIN
    INSERT INTO product_backup
    VALUES (
        OLD.product_id,
        OLD.product_name,
        OLD.price,
        OLD.stock,
        NOW()
    );
END //

DELIMITER ;


-- =========================================
-- TASK 10 - CUSTOMER AUDIT
-- =========================================

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE customer_audit (
    customer_id INT,
    customer_name VARCHAR(50),
    operation VARCHAR(10),
    activity_time DATETIME
);


-- INSERT TRIGGER

DELIMITER //

CREATE TRIGGER trg_customer_insert
AFTER INSERT ON customer
FOR EACH ROW
BEGIN
    INSERT INTO customer_audit
    VALUES (
        NEW.customer_id,
        NEW.customer_name,
        'INSERT',
        NOW()
    );
END //

DELIMITER ;


-- UPDATE TRIGGER

DELIMITER //

CREATE TRIGGER trg_customer_update
AFTER UPDATE ON customer
FOR EACH ROW
BEGIN
    INSERT INTO customer_audit
    VALUES (
        NEW.customer_id,
        NEW.customer_name,
        'UPDATE',
        NOW()
    );
END //

DELIMITER ;


-- DELETE TRIGGER

DELIMITER //

CREATE TRIGGER trg_customer_delete
AFTER DELETE ON customer
FOR EACH ROW
BEGIN
    INSERT INTO customer_audit
    VALUES (
        OLD.customer_id,
        OLD.customer_name,
        'DELETE',
        NOW()
    );
END //

DELIMITER ;


-- Task 1
INSERT INTO teaemp
VALUES (11, 'Suresh Kumar', 'IT', 45000);

SELECT * FROM emp_insert_backup;


-- Task 2
UPDATE teaemp
SET empsalary = 65000
WHERE empid = 11;

SELECT * FROM emp_update_backup;


-- Task 3
DELETE FROM teaemp
WHERE empid = 11;

SELECT * FROM emp_delete_backup;


-- Task 4
INSERT INTO teaemp
VALUES (12, 'Ramesh', 'Sales', 10000);

SELECT * FROM teaemp
WHERE empid = 12;

-- Salary will automatically become 15000


-- Task 9
INSERT INTO teaproduct
VALUES (1, 'Tea', 20, 100);

UPDATE teaproduct
SET price = 25
WHERE product_id = 1;

SELECT * FROM product_backup;


-- Task 10
INSERT INTO customer
VALUES (1, 'Arun');

UPDATE customer
SET customer_name = 'Arun Kumar'
WHERE customer_id = 1;

DELETE FROM customer
WHERE customer_id = 1;

SELECT * FROM customer_audit;