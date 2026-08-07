CREATE DATABASE ElectionDB;
USE ElectionDB;

-- 1. VOTERS TABLE
CREATE TABLE voters (
    voter_id INT PRIMARY KEY,
    voter_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    address VARCHAR(100),
    booth_id INT
);

-- 2. CANDIDATES TABLE
CREATE TABLE candidates (
    candidate_id INT PRIMARY KEY,
    candidate_name VARCHAR(50),
    party_name VARCHAR(50),
    symbol VARCHAR(50)
);

-- 3. POLLING BOOTHS TABLE
CREATE TABLE polling_booths (
    booth_id INT PRIMARY KEY,
    booth_name VARCHAR(50),
    location VARCHAR(100)
);

-- Add Foreign Key
ALTER TABLE voters
ADD FOREIGN KEY (booth_id)
REFERENCES polling_booths(booth_id);

-- 4. VOTES TABLE
CREATE TABLE votes (
    vote_id INT PRIMARY KEY,
    voter_id INT UNIQUE,
    candidate_id INT,
    booth_id INT,
    
    FOREIGN KEY (voter_id)
    REFERENCES voters(voter_id),

    FOREIGN KEY (candidate_id)
    REFERENCES candidates(candidate_id),

    FOREIGN KEY (booth_id)
    REFERENCES polling_booths(booth_id)
);


-- INSERT POLLING BOOTHS
INSERT INTO polling_booths VALUES
(101, 'Booth A', 'Chennai'),
(102, 'Booth B', 'Madurai'),
(103, 'Booth C', 'Coimbatore'),
(104, 'Booth D', 'Trichy'),
(105, 'Booth E', 'Salem');


-- INSERT VOTERS
INSERT INTO voters VALUES
(1, 'Arun Kumar', 25, 'Male', 'Chennai', 101),
(2, 'Priya', 22, 'Female', 'Chennai', 101),
(3, 'Rahul', 30, 'Male', 'Madurai', 102),
(4, 'Sneha', 28, 'Female', 'Madurai', 102),
(5, 'Karthik', 35, 'Male', 'Coimbatore', 103),
(6, 'Anjali', 24, 'Female', 'Coimbatore', 103),
(7, 'Vijay', 40, 'Male', 'Trichy', 104),
(8, 'Meena', 32, 'Female', 'Trichy', 104),
(9, 'Suresh', 29, 'Male', 'Salem', 105),
(10, 'Divya', 26, 'Female', 'Salem', 105);


-- INSERT CANDIDATES
INSERT INTO candidates VALUES
(1, 'Ravi Kumar', 'People Party', 'Sun'),
(2, 'Suresh Raj', 'National Party', 'Star'),
(3, 'Arun Singh', 'Democratic Party', 'Tree'),
(4, 'Kumar Das', 'Progress Party', 'Flower');


-- INSERT VOTES
INSERT INTO votes VALUES
(1, 1, 1, 101),
(2, 2, 2, 101),
(3, 3, 1, 102),
(4, 4, 3, 102),
(5, 5, 2, 103),
(6, 6, 1, 103),
(7, 7, 4, 104),
(8, 8, 1, 104),
(9, 9, 2, 105),
(10, 10, 1, 105);


-- DISPLAY TABLES
SELECT * FROM voters;

SELECT * FROM candidates;

SELECT * FROM polling_booths;

SELECT * FROM votes;