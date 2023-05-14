/*3.1.1. Παρουσίαση λίστας με συνολικό αριθμό δανεισμών ανά σχολείο (Κριτήρια αναζήτησης:
έτος, ημερολογιακός μήνας πχ Ιανουάριος)*/
SELECT times_loaned FROM School
    WHERE MONTH(date_borrowed) = x OR YEAR(date_borrowed) = y;

/*3.1.2.Για δεδομένη κατηγορία βιβλίων (επιλέγει ο χρήστης), ποιοι συγγραφείς ανήκουν σε αυτήν
και ποιοι εκπαιδευτικοί έχουν δανειστεί βιβλία αυτής της κατηγορίας το τελευταίο έτος;*/
$query = SELECT DISTINCT Author.First_Name, Author.Last_Name, User.username
              FROM Book
              JOIN Book_Author ON Book.Book_id = Book_Author.Book_id
              JOIN Book_Category ON Book_Category.Book_id = Book.Book_id
              JOIN Category ON Book_Category.Category_id = Category.Category_id
              JOIN Copies ON Copies.Book_id = Book.Book_id
              JOIN Loan ON Loan.Book_id = Book.Book_id
              JOIN User ON User.User_id = Loan.User_id
              JOIN School ON School.School_id = User.School_id
              JOIN Author ON Author.Author_id = Book_Author.Author_id
              WHERE Category.Name = :selectedCategory AND User.Type = 'teacher'
              ORDER BY User.Number_of_loans DESC
              LIMIT 1;
/*3.1.3.Βρείτε τους νέους εκπαιδευτικούς (ηλικία < 40 ετών) που έχουν δανειστεί τα περισσότερα
βιβλία και των αριθμό των βιβλίων.*/
SELECT User.User_id, User.First_Name, User.Last_Name, COUNT(*) AS books_borrowed
FROM Loan
JOIN User ON Loan.User_id = User.User_id
WHERE User.Type = 'teacher' AND User.Age < 40
GROUP BY User.User_id
ORDER BY books_borrowed DESC
/*3.1.4.Βρείτε τους συγγραφείς των οποίων κανένα βιβλίο δεν έχει τύχει δανεισμού.*/
SELECT Author.First_Name, Author.Last_Name
FROM Author
JOIN Book_Author ON Author.Author_id = Book_Author.Author_id
JOIN Book ON Book.Book_id = Book_Author.Book_id
LEFT JOIN Loan ON Loan.Book_id = Book.Book_id
WHERE Book.times_taken = 0 
GROUP BY Author.First_Name, Author.Last_Name
/*3.1.5.Ποιοι χειριστές έχουν δανείσει τον ίδιο αριθμό βιβλίων σε διάστημα ενός έτους με
περισσότερους από 20 δανεισμούς;*/
SELECT Operator.First_Name, Operator.Last_Name
FROM Operator
JOIN Loan ON Loan.Operator_id = Operator.Operator_id
JOIN Book ON Loan.Book_id = Book.Book_id
WHERE Loan.Date_of_Loan BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY Operator.Operator_id
HAVING COUNT(DISTINCT Loan.Book_id) = (SELECT COUNT(DISTINCT Loan.Book_id)
                                       FROM Loan
                                       WHERE Loan.Operator_id = Operator.Operator_id
                                         AND Loan.Date_of_Loan BETWEEN '2023-01-01' AND '2023-12-31')
AND COUNT(*) > 20
/*3.3.1.Όλα τα βιβλία που έχουν καταχωριστεί (Κριτήρια αναζήτησης: τίτλος/ κατηγορία/
συγγραφέας), δυνατότητα επιλογής βιβλίου και δημιουργία αιτήματος κράτησης.*/
SELECT * FROM Book WHERE Title = '%search_title' OR Category = '%search_category' OR Author = '%search_author'

/*3.3.2.Λίστα όλων των βιβλίων που έχει δανειστεί ο συγκεκριμένος χρήστης.*/
SELECT Book.Title 
FROM Book
INNER JOIN Loan ON Book.Book_id = Loan.Book_id 
INNER JOIN User ON Loan.User_id = User.User_id
WHERE User.username = ""
