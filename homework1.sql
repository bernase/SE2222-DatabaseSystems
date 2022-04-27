-- SE2222 - Database Systems - Lab Homework 1 (Oct 25 - Nov 6, 2021)
-- 18070001027 Melek Berna ŞERIT

DROP DATABASE IF EXISTS library;
CREATE DATABASE library;
USE library;

CREATE TABLE Author (
    `Name` VARCHAR(10) CHARACTER SET utf8,
    `Surname` VARCHAR(10) CHARACTER SET utf8,
    `Gender` VARCHAR(6) CHARACTER SET utf8,
    `Age` INT NOT NULL,
    `DateOfBirth` DATETIME,
    PRIMARY KEY (Name, Surname)
);

CREATE TABLE Book (
    `Title` VARCHAR(20) CHARACTER SET utf8,
    `NumberOfPages` INT NOT NULL,
    `DatePublished` INT,
    `Name` VARCHAR(10) CHARACTER SET utf8,
    `Surname` VARCHAR(10) CHARACTER SET utf8,
    PRIMARY KEY (Title),
    FOREIGN KEY (Name, Surname) REFERENCES Author(Name, Surname)
);

INSERT INTO Author Values
('Clarissa','Estes','Female',76,'1945-01-27 00:00:00'),
('Stefan','Zweig','Male',140,'1881-10-28 00:00:00'),
('Nina','Berberova','Female',120,'1901-06-26 00:00:00'),
('Mehmet','Rauf','Male',146,'1875-08-12 00:00:00'),
('Ayşe','Kulin','Female',80,'1941-01-01 00:00:00'),
('Moris','Farhi','Male',86,'1935-08-12 00:00:00'),
('George','Orwell','Male',118,'1903-06-25 00:00:00'),
('Susanna','Clarke','Female',62,'1959-10-01 00:00:00'),
('Thomas','Mann','Male',146,'1875-06-06 00:00:00'),
('Leo','Tolstoy','Male',193,'1828-09-09 00:00:00');

INSERT INTO Book Values
('Kurtlarla Koşan K',544,2006,'Clarissa','Estes'),
('Amok Koşucusu',64,2006,'Stefan','Zweig'),
('Mozartin Dirilişi',64,1994,'Nina','Berberova'),
('Bir Hastaligin ilaci',48,2021,'Mehmet','Rauf'),
('Kanadi Kirik Kuslar',392,2016,'Ayşe','Kulin'),
('Young Turk',391,2004,'Moris','Farhi'),
('Animal Farm',141,1996,'George','Orwell'),
('Piranesi',245,2020,'Susanna','Clarke'),
('Death in Venice',116,1971,'Thomas','Mann'),
('What Men Live By',94,1885,'Susanna','Clarke');
-- -------------------------------------------------
ALTER TABLE Book 
ADD lended INT default '0'; -- 1 for Yes, 0 for No

SELECT AVG(NumberOfPages)
FROM Book;

SELECT *
FROM Book
ORDER BY NumberOfPages DESC;

SELECT Name
FROM Author
ORDER BY Name ASC;

DROP DATABASE Library;