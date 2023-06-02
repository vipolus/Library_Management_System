CREATE TRIGGER insert_reservation_trigger AFTER INSERT ON Reservation
FOR EACH ROW
BEGIN
  INSERT INTO Reservation (School_id, User_id, Book_id, date_created, date_expired) 
  SELECT :school_id, NEW.User_id, NEW.Book_id, CURRENT_TIMESTAMP, DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 7 DAY)
  FROM dual
  WHERE NOT EXISTS (
    SELECT 1
    FROM Reservation
    WHERE User_id = NEW.User_id AND Book_id = NEW.Book_id
  );
END;





/* Thanasis*/

CREATE TRIGGER `Lib_Op` AFTER INSERT ON `user`
 FOR EACH ROW IF NEW.Type = 'Library Operator' THEN
                            INSERT INTO School_Library_Operator (School_id) VALUES (NEW.School_id);
                        END IF


 CREATE TRIGGER `User_Reservations` AFTER INSERT ON `reservation`
 FOR EACH ROW BEGIN
    UPDATE User
    SET reservations = reservations + 1
    WHERE User_id = NEW.User_id;
END


CREATE TRIGGER `Approve_History` AFTER UPDATE ON `user`
FOR EACH ROW
BEGIN
    IF NEW.Approved = '1' THEN
        INSERT INTO `Approve` (User_id) VALUES (NEW.User_id);
    END IF;
END 
