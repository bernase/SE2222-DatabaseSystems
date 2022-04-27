-- SE2222 - Database Systems - Labwork 3 (Nov 26 - 27, 2021)
-- 18070001027 Melek Berna ŞERIT

SELECT * FROM se2222week13.passenger;

-- Question #1 
-- Create a procedure that lists all start cities alphabetically and call it.

DELIMITER //

CREATE PROCEDURE Get_Startcity_Alphabetically()
BEGIN
 	SELECT startcity FROM passenger ORDER BY startcity ASC; -- GROUP BY startcity eklesem mi bilemedim, 1 ülkeden 1 tana olsun demiyor soru.
 END //

DELIMITER ;

CALL Get_Startcity_Alphabetically();

-- Question #2
-- Create a procedure that inserts the same two new rows with the given parameters.
DELIMITER $$

CREATE PROCEDURE Insert_row(
 	IN name1 text, 
 	IN surname1 text,
 	IN age1 int unsigned, 
 	IN gender1 text,
 	IN phonenumber1 text,
 	IN startcity1 text,
 	IN destinationcity1 text
)
BEGIN
 	DECLARE x INT;
	SET x = 0;
	loopy1: LOOP
    if x < 2 THEN
		INSERT INTO passenger
 		VALUES (name1,surname1,age1,gender1,phonenumber1,startcity1,destinationcity1);
    END if;
     if x = 2 THEN
		LEAVE loopy1;
	END if;
	SET x = x + 1;
 	END LOOP;
 END $$

 DELIMITER ;
-- Question #3
-- Insert anything to the table without any procedure and with the procedure at question #2.

CALL Insert_row('Kardelen', 'Varli', 26, 'Female', '(536) 677-1032', 'Nairobi', 'Montevideo');

-- Question #4
-- Create a trigger such that when a new row is added to the passenger table, the same rows are added three times into the «passenger_backup» table.
DELIMITER $$

CREATE TRIGGER Question4
AFTER INSERT ON passenger
FOR EACH ROW
BEGIN
	DECLARE x INT;
    SET x = 0;
    loopy2: LOOP
    if x < 3 THEN
		INSERT INTO passenger_backup
 		VALUES (new.name,new.surname,new.age,new.gender,new.phonenumber,new.startcity,new.destinationcity);
    END if;
    if x = 3 THEN
		LEAVE loopy2;
	END if;
	SET x = x + 1;
 	END LOOP; 
END $$

DELIMITER ;
-- Question #5
-- Try the previous trigger and observe the change (show every rows before and after trigger triggered).
-- bir onceki soruda reference kullanamadgim icin bu sekilde oncesi ve sonrasinda bastirdim, neden reference old table new table kullanamadigimizi da anlamadm
-- BEFORE TRIGGER
SELECT * FROM passenger;
SELECT * FROM passenger_backup;

CALL Insert_row('Mark', 'Bark', 33, 'Male', '(536) 677-1002', 'Montevideo', 'Nairobi'); -- to trigger

-- AFTER TRIGGER
SELECT * FROM passenger;
SELECT * FROM passenger_backup;