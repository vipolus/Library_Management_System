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
/*3.1.6.Πολλά βιβλία καλύπτουν περισσότερες από μια κατηγορίες. Ανάμεσα σε ζεύγη πεδίων (π.χ.
ιστορία και ποίηση) που είναι κοινά στα βιβλία, βρείτε τα 3 κορυφαία (top-3) ζεύγη που
εμφανίστηκαν σε δανεισμούς.*/
SELECT bc1.Thematic_Category AS Category1, bc2.Thematic_Category AS Category2, COUNT(*) AS Loan_Count
FROM Book_Category AS bc1
JOIN Book_Category AS bc2 ON bc1.Book_id = bc2.Book_id AND bc1.Category_id < bc2.Category_id
JOIN Copies AS c ON c.Book_id = bc1.Book_id
JOIN Loan AS l ON l.Book_id = bc1.Book_id
GROUP BY bc1.Thematic_Category, bc2.Thematic_Category
ORDER BY Loan_Count DESC
LIMIT 3;

/*3.1.7.βρείτε όλους τους συγγραφείς που έχουν γράψει τουλάχιστον 5 βιβλία λιγότερα από τον
συγγραφέα με τα περισσότερα βιβλία.*/
SELECT a.Author_id, a.First_Name, a.Last_Name
FROM Author AS a
WHERE a.Num_of_books_written < (
    SELECT MAX(Num_of_books_written) - 5
    FROM Author
)


/*3.2.1.Παρουσίαση όλων των βιβλίων κατά Τίτλο, Συγγραφέα (Κριτήρια αναζήτησης: τίτλος/
κατηγορία/ συγγραφέας/ αντίτυπα).*/
SELECT
    b.Title,
    CONCAT(a.First_Name, ' ', a.Last_Name) AS Author,
    c.Name AS Category,
    COALESCE(SUM(co.Number_of_Available_Copies), 0) AS Copies
FROM
    Book AS b
JOIN
    Book_Author AS ba ON b.Book_id = ba.Book_id
JOIN
    Author AS a ON ba.Author_id = a.Author_id
JOIN
    Book_Category AS bc ON b.Book_id = bc.Book_id
JOIN
    Category AS c ON bc.Category_id = c.Category_id
LEFT JOIN
    Copies AS co ON b.Book_id = co.Book_id
GROUP BY
    b.Book_id
ORDER BY
    b.Title ASC;


/*3.2.2.Εύρεση όλων των δανειζόμενων που έχουν στην κατοχή τους τουλάχιστον ένα βιβλίο και
έχουν καθυστερήσει την επιστροφή του. (Κριτήρια αναζήτησης: Όνομα, Επώνυμο, Ημέρες
Καθυστέρησης).*/
SELECT
    u.First_Name,
    u.Last_Name,
    DATEDIFF(NOW(), l.date_returned) AS Delay_Days
FROM
    User AS u
JOIN
    Loan AS l ON u.User_id = l.User_id
WHERE
    u.Delayed_Book = TRUE
    AND l.date_returned IS NULL

/*3.2.3.Μέσος Όρος Αξιολογήσεων ανά δανειζόμενο και κατηγορία (Κριτήρια αναζήτησης:
χρήστης/ κατηγορία)*/
SELECT
    u.First_Name,
    u.Last_Name,
    c.Name AS Category,
    AVG(r.Rating) AS Average_Rating
FROM
    User AS u
JOIN
    Review AS r ON u.User_id = r.User_id
JOIN
    Book AS b ON r.Book_id = b.Book_id
JOIN
    Book_Category AS bc ON b.Book_id = bc.Book_id
JOIN
    Category AS c ON bc.Category_id = c.Category_id
WHERE
    (u.First_Name = 'search_user' OR 'search_user' IS NULL)
    AND (c.Name = 'search_category' OR 'search_category' IS NULL)
GROUP BY
    u.User_id, c.Category_id


/*3.3.1.Όλα τα βιβλία που έχουν καταχωριστεί (Κριτήρια αναζήτησης: τίτλος/ κατηγορία/
συγγραφέας), δυνατότητα επιλογής βιβλίου και δημιουργία αιτήματος κράτησης.*/
SELECT * FROM Book WHERE Title = '%search_title' OR Category = '%search_category' OR Author = '%search_author'

/*3.3.2.Λίστα όλων των βιβλίων που έχει δανειστεί ο συγκεκριμένος χρήστης.*/
SELECT Book.Title
FROM Loan
INNER JOIN User ON Loan.User_id = User.User_id
INNER JOIN Book ON Loan.Book_id = Book.Book_id
WHERE User.Username = :username




