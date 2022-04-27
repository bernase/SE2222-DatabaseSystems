-- SE2222 Database Systems - Project (Jan 3, 2022) --
-- 18070001027 - Melek Berna Serit --

-- MySQL Workbench Forward Engineering

DROP DATABASE IF EXISTS library;
CREATE DATABASE library;
USE library;

-- -----------------------------------------------------
-- Table People
-- -----------------------------------------------------
DROP TABLE IF EXISTS People ;

CREATE TABLE IF NOT EXISTS People (
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `bookRead` INT NOT NULL,
  `yearRead` INT NOT NULL,
  `birthdate` DATE NOT NULL,
  `Book_Author_AuthorID` INT NOT NULL,
  `Book_Publisher_PublisherID` INT NOT NULL,
  PRIMARY KEY (`name`, `surname`, `birthdate`),
  INDEX `fk_People_Book1_idx` (`Book_Author_AuthorID` ASC, `Book_Publisher_PublisherID` ASC, `bookRead` ASC) VISIBLE,
  CONSTRAINT `fk_People_Book1`
    FOREIGN KEY (`Book_Author_AuthorID` , `Book_Publisher_PublisherID` , `bookRead`)
    REFERENCES `mydb`.`Book` (`Author_AuthorID` , `Publisher_PublisherID` , `ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table Author
-- -----------------------------------------------------
DROP TABLE IF EXISTS Author;

CREATE TABLE IF NOT EXISTS Author (
  `AuthorID` INT NOT NULL,
  `bookWritten` INT NOT NULL,
  `gender` CHAR(1) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `People_name` VARCHAR(45) NOT NULL,
  `People_surname` VARCHAR(45) NOT NULL,
  `People_birthdate` DATE NOT NULL,
  PRIMARY KEY (`AuthorID`), -- `People_name`, `People_surname`, `People_birthdate`
  CONSTRAINT chk1 CHECK (gender = 'F' OR gender = 'M'),
  INDEX `fk_Author_People_idx` (`People_name` ASC, `People_surname` ASC, `People_birthdate` ASC) VISIBLE,
  CONSTRAINT `fk_Author_People`
    FOREIGN KEY (`People_name` , `People_surname` , `People_birthdate`)
    REFERENCES People (`name` , `surname` , `birthdate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table Publisher
-- -----------------------------------------------------
DROP TABLE IF EXISTS Publisher ;

CREATE TABLE IF NOT EXISTS Publisher (
  `PublisherID` INT NOT NULL,
  `PublisherName` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PublisherID`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table Book
-- -----------------------------------------------------
DROP TABLE IF EXISTS Book ;

CREATE TABLE IF NOT EXISTS Book (
  `ISBN` INT NOT NULL,
  `Title` VARCHAR(45) NOT NULL,
  `Category` VARCHAR(45) NOT NULL,
  `NumberOfPages` INT NOT NULL,
  `Author_AuthorID` INT NOT NULL,
  `Publisher_PublisherID` INT NOT NULL,
  PRIMARY KEY (`ISBN`, `Author_AuthorID`, `Publisher_PublisherID`),
  INDEX `fk_Book_Author1_idx` (`Author_AuthorID` ASC) VISIBLE,
  INDEX `fk_Book_Publisher1_idx` (`Publisher_PublisherID` ASC) VISIBLE,
  CONSTRAINT `fk_Book_Author1`
    FOREIGN KEY (`Author_AuthorID`)
    REFERENCES Author (`AuthorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Book_Publisher1`
    FOREIGN KEY (`Publisher_PublisherID`)
    REFERENCES Publisher (`PublisherID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------
-- Insert values to tables
-- -----------------------

INSERT INTO People Values
('name1','surname1',00000000,2010,'1945-01-27 00:00:00',12345,123451),
('name2','surname2',11111111,2011,'1945-01-25 00:00:00',12346,123441),
('name3','surname3',22222222,2012,'1945-01-22 00:00:00',12347,123431),
('name4','surname4',33333333,2013,'1945-01-20 00:00:00',12348,123421),
('name5','surname5',44444444,2014,'1999-09-09 00:00:00',12349,123411),
('name6','surname6',55555555,2015,'1999-09-19 00:00:00',12340,112233),
('name7','surname7',66666666,2016,'1999-09-09 00:00:00',12341,111111);

INSERT INTO Author Values
(12345,0000000,'F','USA','name1','surname1','1945-01-27 00:00:00'),
(12346,1111111,'M','Canada','name2','surname2','1945-01-25 00:00:00'),
(12347,2222222,'F','Sweden','name3','surname3','1945-01-22 00:00:00'),
(12348,3333333,'M','Norway','name4','surname4','1945-01-20 00:00:00'),
(12349,4444444,'M','Russia','name5','surname5','1999-09-09 00:00:00');

INSERT INTO Publisher Values
(123421,'name8','111 47 Stockholm'),
(123431,'name9','111 37 Stockholm'),
(123441,'name10','111 27 Stockholm'),
(123451,'name11','111 17 Stockholm'),
(123411,'name12','111 07 Stockholm');

INSERT INTO Book Values
(00000000,'title1','category1',10,12345,123451),
(11111111,'title2','category2',20,12346,123441),
(22222222,'title3','category3',30,12347,123431),
(33333333,'title4','category4',40,12348,123421),
(44444444,'title5','category5',50,12349,123411);

-- -------
-- Queries
-- -------

-- 1
SELECT name,surname 
FROM Author, People
WHERE People.name LIKE 'n%' AND People.surname LIKE 's%' AND AuthorID = People.Book_Author_AuthorID ;
-- 2
SELECT Title 
FROM Book 
WHERE Author_AuthorID = 12345;
-- 3
SELECT DISTINCT Title, name, surname, country, publisherName, address
FROM Author, People, Publisher, Book
WHERE bookRead = 00000000 AND bookWritten = 00000000 AND Book_Publisher_PublisherID = PublisherID Limit 1;
-- 4
SELECT COUNT(bookRead) 
FROM People 
WHERE BookRead = 00000000;
-- 5

-- 6
UPDATE Publisher
SET address = '4773 Toronto'
WHERE PublisherID = 123411;
-- 7
INSERT INTO IF NOT EXISTS Book
-- 8
DELETE 
