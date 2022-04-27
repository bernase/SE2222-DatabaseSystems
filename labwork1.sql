-- -------------------------------------------------------------------------- --
--                      SE2222 Labwork 1 Student Answers                      --
-- -------------------------------------------------------------------------- --

--   I have never exhibited any unethical behavior such as giving or receiving 
-- answers to questions, helping others, posting questions on another website, 
-- or cheating.

--    Student Name: Melek Berna
-- Student Surname: Şerit
--  Student Number: 18070001027
--                                                           November 5, 2021

USE week06_labwork1;

-- -------------------------------------------------------------------------- --

--   Question 1: Show the names and e-mail addresses of the players whose names 
-- start with 'J' and end with 'y'. Sort by age from smallest to largest.

--   Answer 1: 

SELECT name, Email_Address FROM Player WHERE name like 'J%y' order by Age asc;

-- -------------------------------------------------------------------------- --

--   Question 2: Find the average age of players whose last purchased game was 
-- any Assassin's Creed game.

--   Answer 2: 

SELECT AVG(Age) 
FROM Player
WHERE LastGamePurchase like '%Assassin''s Creed%';

-- -------------------------------------------------------------------------- --

--   Question 3: Find the average age of the female players without using any 
-- function that finds the average.

--   Answer 3: 

SELECT SUM(Age) / COUNT(Age) 
FROM Player 
WHERE Gender = 'Female';

-- -------------------------------------------------------------------------- --

--   Question 4: Increase everyone's age by one.

--   Answer 4: 

UPDATE Player 
SET Age = Age + 1;

-- -------------------------------------------------------------------------- --

--   Question 5: Create a new column named "YearOfBirth" and fill in the year 
-- of birth there.

--   Answer 5: 

ALTER TABLE Player
ADD YearOfBirth year;

UPDATE Player SET YearOfBirth = (2021 - Age);

-- -------------------------------------------------------------------------- --

--   Question 6: Show the names, surnames, and phone numbers of the players who 
-- purchased any Dark Souls game and registered before 2010, sort by 
-- registration date and then time.

--   Answer 6: 

SELECT Name, Lastname, PhoneNumber 
FROM Player
WHERE LastGamePurchase like '%Dark Souls%' 
AND RegistrationDate < '2010-01-01 00:00:00'
Order by RegistrationDate, RegistrationTime;

-- -------------------------------------------------------------------------- --

--   Question 7: Find the ratio of people who either ordered Pokemon or Persona 
-- game to the number of females who purchased an Assassin's Creed game.
-- Hint: You need to use two separate select statements to get each number and 
-- add them to a variable. One example of how to use variables is below:
-- SELECT @numberOfRecords := COUNT(*) FROM Player;
-- SELECT @numberOfRecords;
-- will add the number of all records to "numberOfRecords" variable, and the 
-- select statement below will display its value.

--   Answer 7: 

SELECT @numberOfRecords := COUNT(*) -- 8
FROM Player
WHERE LastGamePurchase like '%Pokemon%' OR LastGamePurchase like '%Persona%';

SELECT @numberOfRecords / COUNT(*) -- 8/6 = 1.33
FROM Player
WHERE Gender = 'Female' AND LastGamePurchase like '%Assassin''s Creed%';

-- -------------------------------------------------------------------------- --


--   Question 8: Find the average age of male players who ordered a game before 
-- 2010 (RegDate < 2010) as well as find the average of female players who 
-- ordered a game after 2012 (RegDate > 2012) and display the ratio between the 
-- two labelings it as "finalRatio".

--   Answer 8: 

SELECT @numberOfAvgAgeM := AVG(Age) -- 27
FROM Player
WHERE LastGamePurchase like '%Dark Souls%' 
AND RegistrationDate < '2010-01-01 00:00:00';

SELECT @numberOfAvgAgeM / AVG(Age) AS finalRatio -- 1.02
FROM Player
WHERE RegistrationDate > '2012-01-01 00:00:00';

-- -------------------------------------------------------------------------- --

--   Question 9: Add a column full Name and populate the column with 
-- first name + space + second name like if the name is "Matteo" and the last 
-- name is "Downs" full name should be "Matteo Downs".

--   Answer 9: 

ALTER TABLE Player
ADD FullName VARCHAR(30);

UPDATE Player SET FullName = (
    select CONCAT(Name,' ',Lastname)  
);

-- -------------------------------------------------------------------------- --

--   Question 10: Add a column "timeSinceRegistration" and calculate for each 
-- player for how many days they have been registered. then find the oldest 
-- member by using this newly created "timeSinceRegistration".
-- Hint: You can use the predefined DATEDIFF() and NOW() function to calculate 
-- values. 

--   Answer 10: 

ALTER TABLE Player
ADD timeSinceRegistration INT ;

UPDATE Player SET timeSinceRegistration = DATEDIFF(NOW(), RegistrationDate);

SELECT *
FROM Player
order by timeSinceRegistration desc limit 1;

-- -------------------------------------------------------------------------- --