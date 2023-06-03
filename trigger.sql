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
 CREATE TRIGGER `User_Reservations` AFTER INSERT ON `Reservation`
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
    UPDATE Copies
    SET Number_of_Available_Copies = Number_of_Available_Copies - 1
    WHERE Book_id = NEW.Book_id AND School_id = NEW.School_id;
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
        WHERE Book_id = NEW.Book_id AND School_id = NEW.School_id;
    END IF;
END//
DELIMITER ;