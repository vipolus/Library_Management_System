
/*INSERT INTO School(School_Name,Address,City,Phone_Number,Email,Full_Name_of_School_Director,times_loaned) VALUES("13o EPAL","Kypselh","Athens",209243,"google@microsoft.com","Elenh",3);
INSERT INTO School(School_Name,Address,City,Phone_Number,Email,Full_Name_of_School_Director,times_loaned) VALUES("1o Gel","Glyfada","Athens",2324243,"google@microsoft.com","Bulldoza",2);
INSERT INTO School(School_Name,Address,City,Phone_Number,Email,Full_Name_of_School_Director,times_loaned) VALUES("7o Gel","Menidi","Athens",2628223,"google@microsoft.com","Mickey Mouse",9);*/
/*INSERT INTO Admin (Admin_id, User_id) VALUES (1, 1);*/
INSERT INTO Category(Name) VALUES("comedy");
INSERT INTO Category(Name) VALUES("thriller");
INSERT INTO Author(First_Name,Last_Name,Num_of_books_written) VALUES("Thanasis","Konstantopoulos",1);

INSERT INTO Book(Title,Publisher,ISBN,Number_of_Pages,Summary,Image,Thematic_Category,Language,Keywords,times_requested,times_taken,reviews) VALUES ("Test","Yolo",1231,10,"fsdfsd","fsdfsdfsd","comedy","en","ffsd",0,13,7);
INSERT INTO Book(Title,Publisher,ISBN,Number_of_Pages,Summary,Image,Thematic_Category,Language,Keywords,times_requested,times_taken,reviews) VALUES ("fsdfs","fdsfsd",1243231,110,"bvcbx","fsdfsdbcxbxcbxcbfsd","thriller","en","fdfsf",0,11,4);
INSERT INTO Book(Title,Publisher,ISBN,Number_of_Pages,Summary,Image,Thematic_Category,Language,Keywords,times_taken,reviews) VALUES ("s23dvas","r32fdss",1231,10,"AADSAVCX","SDFS","comedy","en","ffsd",25,1);
INSERT INTO Copies(Number_of_Available_Copies,School_id,Book_id) VALUES(5,1,1);
INSERT INTO Copies(Number_of_Available_Copies,School_id,Book_id) VALUES(5,1,1);
INSERT INTO Copies(Number_of_Available_Copies,School_id,Book_id) VALUES(7,2,2);
INSERT INTO Book_author(Author_id,Book_id) VALUES(1,1);
INSERT INTO Book_category(Category_id,Book_id) VALUES(1,1);

/*
INSERT INTO School(School_Name,Address,City,Phone_Number,Email,Full_Name_of_School_Director,times_loaned) VALUES("13o EPAL","Kypselh","Athens",234243,"google@microsoft.com","Elenh",3);
INSERT INTO User (School_id, Age, First_Name, Last_Name, Email, Username, Password, Type, Borrow_Limit, Number_of_loans, books_taken_total, Delayed_Book, Approved, books_taken_temp) VALUES (1, 25, 'John', 'Doe', 'john.doe@example.com', 'johndoe', 'password123', 'student', 5, 0, 0, 0, 1, 0);
INSERT INTO School(School_Name,Address,City,Phone_Number,Email,Full_Name_of_School_Director,times_loaned) VALUES("13o EPAL","Kypselh","Athens",234243,"google@microsoft.com","Elenh",3);
INSERT INTO Author(First_Name,Last_Name,Age,Num_of_books_written) VALUES("Thanasis","Konstantopoulos",35,1);
INSERT INTO Book(Title,Publisher,ISBN,Number_of_Pages,Summary,Image,Thematic_Category,Language,Keywords,times_requested,times_taken,reviews) VALUES ("Test","Yolo",1231,10,"fsdfsd","fsdfsdfsd","comedy","en","ffsd",0,13,7);
INSERT INTO Copies(Number_of_Available_Copies,School_id,Book_id) VALUES(5,1,1);
INSERT INTO Category(Name) VALUES("comedy");
INSERT INTO Category(Name) VALUES("thriller");
INSERT INTO School_library_operator(School_id,Books_given) VALUES(1,10);
INSERT INTO Book(Title,Publisher,ISBN,Number_of_Pages,Summary,Image,Thematic_Category,Language,Keywords,times_requested,times_taken,reviews) VALUES ("fsdfs","fdsfsd",1243231,110,"bvcbx","fsdfsdbcxbxcbxcbfsd","thriller","en","fdfsf",0,11,4);
INSERT INTO Book(Title,Publisher,ISBN,Number_of_Pages,Summary,Image,Thematic_Category,Language,Keywords,times_taken,reviews) VALUES ("s23dvas","r32fdss",1231,10,"AADSAVCX","SDFS","comedy","en","ffsd",25,1);
INSERT INTO Copies(Number_of_Available_Copies,School_id,Book_id) VALUES(5,1,1);
INSERT INTO Copies(Number_of_Available_Copies,School_id,Book_id) VALUES(7,2,2);
INSERT INTO Book_author(Author_id,Book_id) VALUES(1,1);
INSERT INTO Book_category(Category_id,Book_id) VALUES(1,1);
INSERT INTO Loan(Library_Operator_id,User_id,Book_id,date_borrowed,date_returned) VALUES(1,1,1,"2023-1-2","2023-7-7");
INSERT INTO Reservation(Reservation_id, School_id,User_id, Book_id, date_created,
  date_expired) VALUES(1,1,1, 1,"2023-1-2","2023-7-7");
*/