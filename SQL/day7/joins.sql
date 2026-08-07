CREATE DATABASE CinemaDB;
USE CinemaDB;


-- CREATE TABLES


CREATE TABLE Genres (
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(50) NOT NULL
);

CREATE TABLE Directors (
    director_id INT PRIMARY KEY AUTO_INCREMENT,
    director_name VARCHAR(100) NOT NULL
);

CREATE TABLE Actors (
    actor_id INT PRIMARY KEY AUTO_INCREMENT,
    actor_name VARCHAR(100) NOT NULL,
    movie_id INT
);

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_name VARCHAR(100) NOT NULL,
    genre_id INT,
    director_id INT,
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id),
    FOREIGN KEY (director_id) REFERENCES Directors(director_id)
);

ALTER TABLE Actors
ADD FOREIGN KEY (movie_id) REFERENCES Movies(movie_id);

CREATE TABLE Theaters (
    theater_id INT PRIMARY KEY AUTO_INCREMENT,
    theater_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

CREATE TABLE Screens (
    screen_id INT PRIMARY KEY AUTO_INCREMENT,
    screen_number INT NOT NULL,
    theater_id INT,
    FOREIGN KEY (theater_id) REFERENCES Theaters(theater_id)
);

CREATE TABLE Shows (
    show_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    screen_id INT,
    show_time DATETIME,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (screen_id) REFERENCES Screens(screen_id)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15)
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    show_id INT,
    booking_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (show_id) REFERENCES Shows(show_id)
);

CREATE TABLE Tickets (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    seat_number VARCHAR(10),
    ticket_price DECIMAL(10,2),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);


-- INSERT SAMPLE DATA


INSERT INTO Genres (genre_name) VALUES
('Action'),
('Drama'),
('Comedy'),
('Science Fiction'),
('Thriller');

INSERT INTO Directors (director_name) VALUES
('Christopher Nolan'),
('James Cameron'),
('Rajkumar Hirani'),
('Lokesh Kanagaraj'),
('Steven Spielberg');

INSERT INTO Movies (movie_name, genre_id, director_id) VALUES
('Inception', 4, 1),
('Avatar', 4, 2),
('3 Idiots', 3, 3),
('Vikram', 1, 4),
('Jurassic Park', 5, 5),
('Interstellar', 4, 1);

INSERT INTO Actors (actor_name, movie_id) VALUES
('Leonardo DiCaprio', 1),
('Sam Worthington', 2),
('Aamir Khan', 3),
('Kamal Haasan', 4),
('Sam Neill', 5),
('Matthew McConaughey', 6),
('Tom Cruise', NULL);

INSERT INTO Theaters (theater_name, location) VALUES
('PVR Cinemas', 'Chennai'),
('INOX', 'Chennai'),
('AGS Cinemas', 'Chennai');

INSERT INTO Screens (screen_number, theater_id) VALUES
(1, 1),
(2, 1),
(1, 2),
(2, 2),
(1, 3);

INSERT INTO Shows (movie_id, screen_id, show_time) VALUES
(1, 1, '2026-08-10 10:00:00'),
(2, 2, '2026-08-10 14:00:00'),
(3, 3, '2026-08-10 18:00:00'),
(4, 4, '2026-08-10 21:00:00'),
(5, 5, '2026-08-11 11:00:00');

INSERT INTO Customers (customer_name, phone) VALUES
('Arun', '9876543210'),
('Priya', '9876543211'),
('Rahul', '9876543212'),
('Sneha', '9876543213'),
('Karthik', '9876543214');

INSERT INTO Bookings (customer_id, show_id, booking_date) VALUES
(1, 1, '2026-08-07'),
(2, 2, '2026-08-07'),
(3, 3, '2026-08-07'),
(4, 4, '2026-08-07');

INSERT INTO Tickets (booking_id, seat_number, ticket_price) VALUES
(1, 'A1', 250.00),
(2, 'B5', 300.00),
(3, 'C3', 200.00),
(4, 'D7', 350.00);


-- TASK 1 


SELECT 
    m.movie_name,
    g.genre_name
FROM Movies m
INNER JOIN Genres g
ON m.genre_id = g.genre_id;


-- TASK 2 

SELECT 
    m.movie_name,
    d.director_name
FROM Movies m
INNER JOIN Directors d
ON m.director_id = d.director_id;

-- TASK 3 - INNER JOIN


SELECT 
    m.movie_name,
    a.actor_name
FROM Movies m
INNER JOIN Actors a
ON m.movie_id = a.movie_id;


-- TASK 4 - INNER JOIN


SELECT
    c.customer_name,
    m.movie_name,
    t.theater_name
FROM Customers c
INNER JOIN Bookings b
ON c.customer_id = b.customer_id
INNER JOIN Shows s
ON b.show_id = s.show_id
INNER JOIN Movies m
ON s.movie_id = m.movie_id
INNER JOIN Screens sc
ON s.screen_id = sc.screen_id
INNER JOIN Theaters t
ON sc.theater_id = t.theater_id;

-- TASK 5 - INNER JOIN


SELECT
    c.customer_name,
    m.movie_name,
    tk.ticket_price,
    tk.seat_number
FROM Customers c
INNER JOIN Bookings b
ON c.customer_id = b.customer_id
INNER JOIN Shows s
ON b.show_id = s.show_id
INNER JOIN Movies m
ON s.movie_id = m.movie_id
INNER JOIN Tickets tk
ON b.booking_id = tk.booking_id;

-- TASK 6 - LEFT JOIN


SELECT
    m.movie_name,
    b.booking_id
FROM Movies m
LEFT JOIN Shows s
ON m.movie_id = s.movie_id
LEFT JOIN Bookings b
ON s.show_id = b.show_id;


-- TASK 7 - RIGHT JOIN

SELECT
    b.booking_id,
    c.customer_name
FROM Bookings b
RIGHT JOIN Customers c
ON b.customer_id = c.customer_id;


-- TASK 8 - INNER JOIN

SELECT
    c.customer_name,
    m.movie_name,
    t.theater_name,
    s.show_time
FROM Customers c
INNER JOIN Bookings b
ON c.customer_id = b.customer_id
INNER JOIN Shows s
ON b.show_id = s.show_id
INNER JOIN Movies m
ON s.movie_id = m.movie_id
INNER JOIN Screens sc
ON s.screen_id = sc.screen_id
INNER JOIN Theaters t
ON sc.theater_id = t.theater_id;

-- TASK 9 - LEFT JOIN


SELECT
    a.actor_name,
    m.movie_name
FROM Actors a
LEFT JOIN Movies m
ON a.movie_id = m.movie_id;

-- TASK 10 - CINEMA BOOKING REPORT


SELECT
    b.booking_id,
    c.customer_name,
    m.movie_name,
    g.genre_name AS genre,
    d.director_name AS director,
    t.theater_name,
    sc.screen_number,
    s.show_time,
    tk.ticket_price
FROM Bookings b
INNER JOIN Customers c
ON b.customer_id = c.customer_id
INNER JOIN Shows s
ON b.show_id = s.show_id
INNER JOIN Movies m
ON s.movie_id = m.movie_id
INNER JOIN Genres g
ON m.genre_id = g.genre_id
INNER JOIN Directors d
ON m.director_id = d.director_id
INNER JOIN Screens sc
ON s.screen_id = sc.screen_id
INNER JOIN Theaters t
ON sc.theater_id = t.theater_id
INNER JOIN Tickets tk
ON b.booking_id = tk.booking_id
ORDER BY tk.ticket_price DESC;