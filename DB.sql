DROP DATABASE library_system;
CREATE DATABASE library_system;

USE library_system;

CREATE TABLE School (
  School_id INT PRIMARY KEY,
  School_Name VARCHAR(255),
  Address VARCHAR(255),
  City VARCHAR(255),
  Phone_Number VARCHAR(20),
  Email VARCHAR(255),
  Full_Name_of_School_Director VARCHAR(255),
  Full_Name_of_Responsible_School_Library_Operator VARCHAR(255),
  FOREIGN KEY (Library_Operator_id) REFERENCES School(Library_Operator_id),
  times_loaned INT,
  last_update DATETIME
);

CREATE TABLE School_Library_Operator (
  Library_Operator_id INT PRIMARY KEY
  Name VARCHAR(255),
  First_Name VARCHAR(255),
  Last_Name VARCHAR(255),
  Age INT,
  email VARCHAR(255),
  Username VARCHAR(255),
  Password VARCHAR(255),
  FOREIGN KEY (School_id) REFERENCES School(School_id),
  Books_given INT,
  Approved BOOLEAN,
  last_update DATETIME
);

CREATE TABLE Book (
  Book_id INT PRIMARY KEY,
  Title VARCHAR(255),
  Publisher VARCHAR(255),
  ISBN VARCHAR(255),
  Number_of_Pages INT,
  Summary TEXT,
  Image VARCHAR(255),
  Thematic_Category VARCHAR(255),
  Language VARCHAR(255),
  Keywords VARCHAR(255),
  times_taken INT,
  reviews INT,
  last_update DATETIME
);

CREATE TABLE Category (
  Category_id INT PRIMARY KEY,
  Name VARCHAR(255),
  last_update DATETIME
);

CREATE TABLE Book_Category(
Book_Category_Id INT,
Category_id INT,
Book_id INT,
FOREIGN KEY (Category_id) REFERENCES Category(Category_id),
FOREIGN KEY (Book_id) REFERENCES Book(Book_id)
);

CREATE TABLE Copies (
  Copies_id INT PRIMARY KEY,
  Number_of_Available_Copies INT,
  School_id INT,
  Book_id INT,
  FOREIGN KEY (School_id) REFERENCES School(School_id),
  FOREIGN KEY (Book_id) REFERENCES Book(Book_id),
  last_update DATETIME
);


CREATE TABLE Author (
  Author_id INT PRIMARY KEY,
  First_Name VARCHAR(255),
  Last_Name VARCHAR(255),
  Age INT,
  Num_of_books_written INT,
  last_update DATETIME
);

CREATE TABLE Book_Author(
  Author_id INT,
  Book_id INT,
  PRIMARY KEY(Book_id,Author_id),
  FOREIGN KEY(Book_id) REFERENCES Book(Book_id),
  FOREIGN KEY(Author_id) REFERENCES Author(Author_id),
  last_update DATETIME

);
CREATE TABLE Approve (
  User_id INT,
  Name VARCHAR(255),
  Email VARCHAR(255),
  Username VARCHAR(255),
  Password VARCHAR(255),
  last_update DATETIME
  
);

CREATE TABLE User (
  User_id INT,
  School_id INT,
  Age INT,
  PRIMARY KEY(User_id,School_id),
  First_Name VARCHAR(255),
  Last_Name VARCHAR(255),
  Name VARCHAR(255),
  Email VARCHAR(255),
  Username VARCHAR(255),
  Password VARCHAR(255),
  Type VARCHAR(255),
  Borrow_Limit INT,
  last_update INT,
  FOREIGN KEY(School_id) REFERENCES School(School_id),
  Number_of_loans INT,
  books_taken INT,
  Delayed_Book BOOLEAN,
  Approved BOOLEAN
);

CREATE TABLE Reservation (
  Reservation_id INT PRIMARY KEY,
  School_id INT,
  User_id INT,
  Book_id INT,
  date_created DATETIME,
  date_expired DATETIME,
  FOREIGN KEY (School_id) REFERENCES School(School_id),
  FOREIGN KEY (User_id) REFERENCES User(User_id),
  FOREIGN KEY (Book_id) REFERENCES Book(Book_id),
  last_update DATETIME
);

CREATE TABLE Loan (
  Loan_id INT PRIMARY KEY,
  User_id INT,
  Book_id INT,
  date_borrowed DATETIME,
  date_returned DATETIME,
  FOREIGN KEY (User_id) REFERENCES User(User_id),
  FOREIGN KEY (Book_id) REFERENCES Book(Book_id),
  FOREIGN KEY (Library_Operator_id) REFERENCES School_Library_Operator(Library_Operator_id)
  last_update DATETIME
);

CREATE TABLE Review (
  Review_id INT,
  Rating INT,
  Text TEXT,
  User_id INT,
  PRIMARY KEY (Review_id),
  FOREIGN KEY (Book_id) REFERENCES Book(Book_id),
  FOREIGN KEY (User_id) REFERENCES User(User_id),
  last_update DATETIME
);