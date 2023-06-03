DELIMITER //

CREATE TRIGGER `Admin` AFTER INSERT ON `User`
 FOR EACH ROW IF NEW.Type = 'Admin' THEN
                            INSERT INTO Admin (Admin_id) VALUES (NEW.User_id);
                        END IF//
                      
DELIMITER ;

                       
DELIMITER //

CREATE TRIGGER `Lib_Op` AFTER INSERT ON `User`
 FOR EACH ROW IF NEW.Type = 'Library Operator' THEN
                            INSERT INTO School_Library_Operator (Library_operator_id,School_id) VALUES (NEW.User_id,NEW.School_id);
                        END IF//
                      
DELIMITER ;



DELIMITER //
 CREATE TRIGGER `User_Reservations_increase` AFTER INSERT ON `Reservation`
 FOR EACH ROW BEGIN
    UPDATE User
    SET reservations = reservations + 1
    WHERE User_id = NEW.User_id;
END//
DELIMITER ;


DELIMITER //
CREATE TRIGGER `Approve_History` AFTER UPDATE ON `User`
FOR EACH ROW
BEGIN
    IF NEW.Approved = '1' THEN
        INSERT INTO `Approve` (User_id) VALUES (NEW.User_id);
    END IF;
END//
DELIMITER ;
/*************ELENI***********/
DELIMITER //
CREATE TRIGGER `copies_decr` AFTER INSERT ON `Loan`
FOR EACH ROW
BEGIN  
    DECLARE schoolId INT;
        SELECT School_id INTO schoolId FROM User WHERE User_id = NEW.User_id;
        UPDATE Copies
    SET Number_of_Available_Copies = Number_of_Available_Copies - 1
    WHERE Book_id = NEW.Book_id AND School_id = schoolId;
END//
DELIMITER ;


DELIMITER //
CREATE TRIGGER `books_taken_temp` AFTER INSERT ON `Loan`
FOR EACH ROW
BEGIN  
    UPDATE User
    SET books_taken_temp = books_taken_temp + 1
    WHERE User_id = NEW.User_id;
    END//
DELIMITER ;




DELIMITER //
CREATE TRIGGER `res` AFTER INSERT ON `Loan`
FOR EACH ROW
BEGIN  
    UPDATE User
    SET reservations = reservations - 1
    WHERE User_id = NEW.User_id;
    END//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `Number_of_loans` AFTER INSERT ON `Loan`
FOR EACH ROW
BEGIN  
    UPDATE User
    SET Number_of_loans = Number_of_loans + 1
    WHERE User_id = NEW.User_id;
    END//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `copies_incr` AFTER UPDATE ON `Loan`
FOR EACH ROW
BEGIN
    IF NEW.fullfilled = '1' THEN
        UPDATE Copies
        SET Number_of_Available_Copies = Number_of_Available_Copies + 1
        WHERE Book_id = NEW.Book_id AND School_id = (
            SELECT School_id FROM User WHERE User_id = NEW.User_id
        );
    END IF;
END//
DELIMITER ;

DELIMITER //

CREATE TRIGGER `Num_of_Books_Author` AFTER UPDATE ON `book_author`
 FOR EACH ROW BEGIN
	UPDATE author SET Num_of_books_written=Num_of_books_written+1 WHERE Author_id=NEW.Author_id;
    
   END//
   DELIMITER;