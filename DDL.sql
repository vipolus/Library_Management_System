
USE library_system;

CREATE TABLE School (
  School_id INT NOT NULL AUTO_INCREMENT,
  School_Name VARCHAR(255) NOT NULL,
  Address VARCHAR(255) NOT NULL,
  City VARCHAR(255) NOT NULL,
  Phone_Number VARCHAR(20) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Full_Name_of_School_Director VARCHAR(255) NOT NULL,
  times_loaned INT NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY(School_id)
);

CREATE TABLE School_Library_Operator (
  Library_Operator_id INT NOT NULL AUTO_INCREMENT,
  School_id INT NOT NULL,
  Books_given INT NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY(Library_Operator_id),
  FOREIGN KEY (School_id) REFERENCES School(School_id)
);


CREATE TABLE Book (
  Book_id INT NOT NULL AUTO_INCREMENT,
  Title VARCHAR(255) NOT NULL,
  Publisher VARCHAR(255) NOT NULL,
  ISBN VARCHAR(255) NOT NULL,
  Number_of_Pages INT NOT NULL,
  Summary TEXT NOT NULL,
  Image VARCHAR(255),
  Thematic_Category VARCHAR(255) NOT NULL,
  Language VARCHAR(255) NOT NULL,
  Keywords VARCHAR(255) NOT NULL,
  times_taken INT NOT NULL,
  times_requested INT NOT NULL,
  reviews INT NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY(Book_id)
);


CREATE TABLE Category (
  Category_id INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(255) NOT NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY(Category_id)
);

CREATE TABLE Book_Category(
Book_Category_Id INT NOT NULL AUTO_INCREMENT,
Category_id INT NOT NULL,
Book_id INT NOT NULL,
PRIMARY KEY(Book_Category_Id),
FOREIGN KEY (Category_id) REFERENCES Category(Category_id),
FOREIGN KEY (Book_id) REFERENCES Book(Book_id)
);

CREATE TABLE Copies (
  Copies_id INT NOT NULL AUTO_INCREMENT,
  Number_of_Available_Copies INT NOT NULL,
  School_id INT NOT NULL,
  Book_id INT NOT NULL,
  PRIMARY KEY(Copies_id),
  FOREIGN KEY (School_id) REFERENCES School(School_id),
  FOREIGN KEY (Book_id) REFERENCES Book(Book_id),
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE Author (
  Author_id INT NOT NULL AUTO_INCREMENT,
  First_Name VARCHAR(255) NOT NULL,
  Last_Name VARCHAR(255) NOT NULL,
  Num_of_books_written INT NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY(Author_id)
);

CREATE TABLE Book_Author(
  Author_id INT NOT NULL,
  Book_id INT NOT NULL,
  PRIMARY KEY(Book_id,Author_id),
  FOREIGN KEY(Book_id) REFERENCES Book(Book_id),
  FOREIGN KEY(Author_id) REFERENCES Author(Author_id),
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

);


CREATE TABLE User (
  User_id INT NOT NULL AUTO_INCREMENT,
  School_id INT NOT NULL,
  Age INT NOT NULL,  
  First_Name VARCHAR(255) NOT NULL,
  Last_Name VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Username VARCHAR(255) NOT NULL,
  Password VARCHAR(255) NOT NULL,
  Type VARCHAR(255) NOT NULL,
  Borrow_Limit INT NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  Number_of_loans INT NOT NULL,
  reservations INT NOT NULL,
  Delayed_Book BOOLEAN NOT NULL,
  Approved BOOLEAN NOT NULL,
  books_taken_temp INT NOT NULL,
  FOREIGN KEY(School_id) REFERENCES School(School_id),
  PRIMARY KEY(User_id, School_id)
);

CREATE TABLE Admin(
Admin_id INT NOT NULL AUTO_INCREMENT,
User_id INT NOT NULL,
PRIMARY KEY(Admin_id),
FOREIGN KEY(User_id) REFERENCES User(User_id),
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE Reservation (
  Reservation_id INT NOT NULL AUTO_INCREMENT,
  School_id INT NOT NULL,
  User_id INT NOT NULL,
  Book_id INT NOT NULL,
  Approved INT NOT NULL,
  date_created DATETIME NOT NULL,
  date_expired DATETIME NOT NULL,
  PRIMARY KEY(Reservation_id),
  FOREIGN KEY (School_id) REFERENCES School(School_id),
  FOREIGN KEY (User_id) REFERENCES User(User_id),
  FOREIGN KEY (Book_id) REFERENCES Book(Book_id),
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Loan (
  Loan_id INT NOT NULL AUTO_INCREMENT,
  Library_Operator_id INT NOT NULL,
  User_id INT NOT NULL,
  Book_id INT NOT NULL,
  date_borrowed DATETIME NOT NULL,
  date_returned DATETIME NOT NULL,
  fullfilled BOOLEAN NOT NULL,
  PRIMARY KEY(Loan_id),
  FOREIGN KEY (User_id) REFERENCES User(User_id),
  FOREIGN KEY (Book_id) REFERENCES Book(Book_id),
  FOREIGN KEY (Library_Operator_id) REFERENCES School_Library_Operator(Library_Operator_id),
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Review (
  Review_id INT NOT NULL AUTO_INCREMENT,
  Rating INT NOT NULL,
  Book_id INT NOT NULL,
  Text TEXT NOT NULL,
  User_id INT NOT NULL,
  Approved BOOLEAN NOT NULL,
  PRIMARY KEY (Review_id),
  FOREIGN KEY (Book_id) REFERENCES Book(Book_id),
  FOREIGN KEY (User_id) REFERENCES User(User_id),
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);



DELIMITER //
CREATE TRIGGER `Admin` AFTER INSERT ON `User`
FOR EACH ROW
BEGIN
    IF NEW.Type = 'Admin' THEN
        INSERT INTO Admin (User_id) VALUES (NEW.User_id);
    END IF;
END;
            
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
  CREATE TRIGGER `book_taken` AFTER INSERT ON `Loan`
  FOR EACH ROW
BEGIN
    UPDATE Book
    SET times_taken = times_taken + 1
    WHERE Book_id = NEW.Book_id;
END//
    DELIMITER;


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

CREATE TRIGGER `update_book_reviews` AFTER INSERT ON `Review`
FOR EACH ROW
BEGIN
    UPDATE Book
    SET reviews = reviews + 1
    WHERE Book_id = NEW.Book_id;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER `Num_of_Books_Author` AFTER UPDATE ON `book_author`
 FOR EACH ROW BEGIN
	UPDATE author SET Num_of_books_written=Num_of_books_written+1 WHERE Author_id=NEW.Author_id;
    
   END//
   DELIMITER ;
   
CREATE INDEX user_det ON User(School_id);
CREATE INDEX user_det2 ON User(First_Name);
CREATE INDEX user_det3 ON User(Last_Name);
CREATE INDEX loan_det ON Loan(User_id);
CREATE INDEX loan_det2 ON Loan(Book_id);
CREATE INDEX reserv_det ON Reservation(User_id);
CREATE INDEX reserv_det2 ON Reservation(Book_id);
CREATE INDEX book_det ON Book(Title);
CREATE INDEX copies ON Copies(School_id);