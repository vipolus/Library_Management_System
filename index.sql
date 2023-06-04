
CREATE INDEX user_det ON User(User_id, First_Name, Last_Name, School_id);
CREATE INDEX loan_det ON Loan(Library_Operator_id,User_id,Book_id);
CREATE INDEX reserv_det ON Reservation(School_id,User_id,Book_id);
CREATE INDEX book_det ON Book(Book_id,Title);