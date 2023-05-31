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