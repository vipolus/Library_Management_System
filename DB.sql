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
  Full_Name_of_Responsible_School_Library_Operator VARCHAR(255)
);

CREATE TABLE School_Library_Operator (
  School_id INT,
  Name VARCHAR(255),
  email VARCHAR(255),
  Username VARCHAR(255),
  Password VARCHAR(255),
  PRIMARY KEY (School_id, Name),
  FOREIGN KEY (School_id) REFERENCES School(School_id)
);

CREATE TABLE Book (
  Book_id INT PRIMARY KEY,
  Title VARCHAR(255),
  Publisher VARCHAR(255),
  ISBN INT,
  Number_of_Pages INT,
  Summary TEXT,
  Image VARCHAR(255),
  Thematic_Category VARCHAR(255),
  Language VARCHAR(255),
  Keywords VARCHAR(255)
);

CREATE TABLE Copies (
  Copies_id INT PRIMARY KEY,
  School_Name VARCHAR(255),
  ISBN INT,
  Number_of_Available_Copies INT,
  FOREIGN KEY (School_Name) REFERENCES School(School_Name),
  FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);

CREATE TABLE Author (
  ISBN INT,
  First_Name VARCHAR(255),
  Last_Name VARCHAR(255),
  PRIMARY KEY (ISBN, First_Name, Last_Name),
  FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);

CREATE TABLE Category (
  Name VARCHAR(255) PRIMARY KEY
);

CREATE TABLE User (
  User_id INT PRIMARY KEY,
  Name VARCHAR(255),
  Email VARCHAR(255),
  Username VARCHAR(255),
  Password VARCHAR(255),
  Type VARCHAR(255),
  Borrow_Limit INT,
  Review_Approval_Required BOOLEAN
);

CREATE TABLE Reservation (
  Reservation_id INT PRIMARY KEY,
  School_Name VARCHAR(255),
  User_id INT,
  ISBN VARCHAR(255),
  date_created INT,
  date_expired INT,
  FOREIGN KEY (School_Name) REFERENCES School(School_Name),
  FOREIGN KEY (User_id) REFERENCES User(User_id),
  FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);

CREATE TABLE Loan (
  Loan_id INT PRIMARY KEY,
  User_id INT,
  Type VARCHAR(255),
  ISBN VARCHAR(255),
  date_borrowed INT,
  date_returned INT,
  FOREIGN KEY (User_id) REFERENCES User(User_id),
  FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);

CREATE TABLE Review (
  ISBN INT,
  Rating INT,
  Text TEXT,
  Name VARCHAR(255),
  PRIMARY KEY (ISBN, Name),
  FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);
