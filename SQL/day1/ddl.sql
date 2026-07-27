CREATE DATABASE frontenddb;

USE frontenddb;

CREATE TABLE  student(
uderid int primary key auto_increment,
username varchar(50) ,
userage int,
useremail varchar(100) unique,
userpassword varchar(50),

created_by varchar(200) default "Admin",
created_at date,
updated_by varchar(100),
updated_at date
);

ALTER TABLE student ADD userdob datetime; 

ALTER TABLE student MODIFY userage varchar(10);

ALTER TABLE student CHANGE userage age int;

ALTER TABLE student RENAME COLUMN useremail to email;

ALTER TABLE student DROP column userpassword;

RENAME TABLE student to studentinfo;

truncate table studentinfo;

drop table studentinfo;

drop database frontenddb;