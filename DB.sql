

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
  books_taken_total INT NOT NULL,
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

CREATE TABLE Approve (
  User_id INT NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY(User_id) REFERENCES User(User_id)
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
END//

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


INSERT INTO school(School_Name,Address,City,Phone_Number,Email,Full_Name_of_School_Director)VALUES("Admin","Admin","Admin",21314,"Admin@Admin","vipolus");
INSERT INTO `user` (`School_id`, `Age`, `First_Name`, `Last_Name`, `Email`, `Username`, `Password`, `Type`) VALUES
(1, 21, 'vipolus', 'vipolus', 'vipolus@vipolus', 'vipolus', '$2y$10$rWfmA5vIznkvAng3bOI0guGltLF2JdABSmKy3qBtuLTl2gVxzCHMq', 'Admin');