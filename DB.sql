

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
  last_update DATETIME NOT NULL,
  PRIMARY KEY(School_id)
);

CREATE TABLE School_Library_Operator (
  Library_Operator_id INT NOT NULL AUTO_INCREMENT,
  School_id INT NOT NULL,
  Books_given INT NOT NULL,
  last_update DATETIME NOT NULL,
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
  reviews INT NOT NULL,
  last_update DATETIME NOT NULL,
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
  last_update DATETIME NOT NULL
);


CREATE TABLE Author (
  Author_id INT NOT NULL AUTO_INCREMENT,
  First_Name VARCHAR(255) NOT NULL,
  Last_Name VARCHAR(255) NOT NULL,
  Age INT NOT NULL,
  Num_of_books_written INT NOT NULL,
  last_update DATETIME NOT NULL,
  PRIMARY KEY(Author_id)
);

CREATE TABLE Book_Author(
  Author_id INT NOT NULL,
  Book_id INT NOT NULL,
  PRIMARY KEY(Book_id,Author_id),
  FOREIGN KEY(Book_id) REFERENCES Book(Book_id),
  FOREIGN KEY(Author_id) REFERENCES Author(Author_id),
  last_update DATETIME

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
  books_taken_total INT NOT NULL,
  Delayed_Book BOOLEAN NOT NULL,
  Approved BOOLEAN NOT NULL,
  books_taken_temp INT NOT NULL,
  FOREIGN KEY(School_id) REFERENCES School(School_id),
  PRIMARY KEY(User_id,School_id)
);

CREATE TABLE Admin(
Admin_id INT NOT NULL AUTO_INCREMENT,
User_id INT NOT NULL,
PRIMARY KEY(Admin_id),
FOREIGN KEY(User_id) REFERENCES User(User_id)
);

CREATE TABLE Approve (
  User_id INT NOT NULL,
  Name VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Username VARCHAR(255) NOT NULL,
  Password VARCHAR(255) NOT NULL,
  last_update DATETIME NOT NULL,
  FOREIGN KEY(User_id) REFERENCES User(User_id)
);

CREATE TABLE Reservation (
  Reservation_id INT NOT NULL AUTO_INCREMENT,
  School_id INT NOT NULL,
  User_id INT NOT NULL,
  Book_id INT NOT NULL,
  date_created DATETIME NOT NULL,
  date_expired DATETIME NOT NULL,
  PRIMARY KEY(Reservation_id),
  FOREIGN KEY (School_id) REFERENCES School(School_id),
  FOREIGN KEY (User_id) REFERENCES User(User_id),
  FOREIGN KEY (Book_id) REFERENCES Book(Book_id),
  last_update DATETIME
);

CREATE TABLE Loan (
  Loan_id INT NOT NULL AUTO_INCREMENT,
  Library_Operator_id INT NOT NULL,
  User_id INT NOT NULL,
  Book_id INT NOT NULL,
  date_borrowed DATETIME NOT NULL,
  date_returned DATETIME NOT NULL,
  PRIMARY KEY(Loan_id),
  FOREIGN KEY (User_id) REFERENCES User(User_id),
  FOREIGN KEY (Book_id) REFERENCES Book(Book_id),
  FOREIGN KEY (Library_Operator_id) REFERENCES School_Library_Operator(Library_Operator_id),
  last_update DATETIME NOT NULL
);

CREATE TABLE Review (
  Review_id INT NOT NULL,
  Rating INT NOT NULL,
  Book_id INT NOT NULL,
  Text TEXT NOT NULL,
  User_id INT NOT NULL,
  PRIMARY KEY (Review_id),
  FOREIGN KEY (Book_id) REFERENCES Book(Book_id),
  FOREIGN KEY (User_id) REFERENCES User(User_id),
  last_update DATETIME NOT NULL
);


INSERT INTO book(Title,Publisher,ISBN,Number_of_Pages,Summary,Image,Thematic_Category,Language,Keywords,times_taken,reviews) VALUES ("Test","Yolo",1231,10,"fsdfsd","fsdfsdfsd","comedy","en","ffsd",13,7);
INSERT INTO book(Title,Publisher,ISBN,Number_of_Pages,Summary,Image,Thematic_Category,Language,Keywords,times_taken,reviews) VALUES ("fsdfs","fdsfsd",1243231,110,"bvcbx","fsdfsdbcxbxcbxcbfsd","thriller","en","fdfsf",11,4);
INSERT INTO book(Title,Publisher,ISBN,Number_of_Pages,Summary,Image,Thematic_Category,Language,Keywords,times_taken,reviews) VALUES ("s23dvas","r32fdss",1231,10,"AADSAVCX","SDFS","comedy","en","ffsd",25,1);
INSERT INTO copies(Number_of_Available_Copies,School_id,Book_id) VALUES(5,1,1);
INSERT INTO copies(Number_of_Available_Copies,School_id,Book_id) VALUES(7,2,2);
INSERT INTO school(School_Name,Address,City,Phone_Number,Email,Full_Name_of_School_Director,times_loaned) VALUES("13o EPAL","Kypselh","Athens",234243,"google@microsoft.com","Elenh",3);
INSERT INTO author(First_Name,Last_Name,Age,Num_of_books_written) VALUES("Thanasis","Konstantopoulos",35,1);
INSERT INTO book_author(Author_id,Book_id) VALUES(1,1);
INSERT INTO category(Name) VALUES("comedy");
INSERT INTO book_category(Category_id,Book_id) VALUES(1,1);