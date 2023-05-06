<?php
require_once('config.php');
// Check if school_id parameter is provided
if (isset($_GET['school_id'])) {
   
    $school_id = $_GET['school_id'];

    try {
        // Connect to the database using the config.php values
        $pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Prepare the SQL statement
        $sql = 'SELECT b.Book_id, b.Title, b.Publisher, b.ISBN, b.Number_of_Pages, b.Summary, b.Thematic_Category, b.Language, b.Keywords, a.First_Name, a.Last_Name, c.Number_of_Available_Copies
                FROM Book AS b
                INNER JOIN Book_Author AS ba ON b.Book_id = ba.Book_id
                INNER JOIN Author AS a ON ba.Author_id = a.Author_id
                INNER JOIN Copies AS c ON b.Book_id = c.Book_id
                WHERE c.School_id = ?';

        $stmt = $pdo->prepare($sql);
        $stmt->execute([$school_id]);
  
        // Check if there are any books available
        if ($stmt->rowCount() > 0) {
            // Fetch all the books into an associative array
            $books = $stmt->fetchAll(PDO::FETCH_ASSOC);
            ?>
            <!DOCTYPE html>
            <html>
            <head>
                <title>Books</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        margin: 20px;
                    }

                    h1 {
                        margin-bottom: 20px;
                    }

                    .book {
                        margin-bottom: 30px;
                    }

                    .book h2 {
                        margin-bottom: 10px;
                    }

                    .book p {
                        margin: 5px 0;
                    }

                    .book hr {
                        border: none;
                        border-top: 1px solid #ccc;
                        margin: 20px 0;
                    }
                </style>
                <script>
                    function showBookDetails() {
                        var bookSelect = document.getElementById('book-select');
                        var selectedBookId = bookSelect.value;
                        var selectedBook = <?= json_encode($books) ?>[selectedBookId];

                        var detailsDiv = document.getElementById('book-details');
                        detailsDiv.innerHTML = '';

                        var h2 = document.createElement('h2');
                        h2.innerHTML = selectedBook.Title;
                        detailsDiv.appendChild(h2);

                        var p1 = document.createElement('p');
                        p1.innerHTML = '<strong>Author:</strong> ' + selectedBook.First_Name + ' ' + selectedBook.Last_Name;
                        detailsDiv.appendChild(p1);

                        var p2 = document.createElement('p');
                        p2.innerHTML = '<strong>Publisher:</strong> ' + selectedBook.Publisher;
                        detailsDiv.appendChild(p2);

                        var p3 = document.createElement('p');
                        p3.innerHTML = '<strong>ISBN:</strong> ' + selectedBook.ISBN;
                        detailsDiv.appendChild(p3);

                        var p4 = document.createElement('p');
                        p4.innerHTML = '<strong>Number of Pages:</strong> ' + selectedBook.Number_of_Pages;
                        detailsDiv.appendChild(p4);

                        var p5 = document.createElement('p');
                        p5.innerHTML = '<strong>Summary:</strong> ' + selectedBook.Summary;
                        detailsDiv.appendChild(p5);

                        var p6 = document.createElement('p');
                        p6.innerHTML = '<strong>Thematic Category:</strong> ' + selectedBook.Thematic_Category;
                        detailsDiv.appendChild(p6);

                        var p7 = document.createElement('p');
                        p7.innerHTML = '<strong>Language:</strong> ' + selectedBook.Language;
                        detailsDiv.appendChild(p7);

                        var p8 = document.createElement('p');
                        p8.innerHTML = '<strong>Keywords:</strong> ' + selectedBook.Keywords;
                        detailsDiv.appendChild(p8);

                        var p9 = document.createElement('p');
                        p9.innerHTML = '<strong>Copies Available:</strong> ' + selectedBook.Number_of_Available_Copies;
                        detailsDiv.appendChild(p9);
                    }
                </script>
            </head>
            <body>
                <h1>Books</h1>
                <label for="book-select">Select a book:</label>
                <select id="book-select" onchange="showBookDetails()">
                    <option value="">Select</option>
                    <?php
                    // Generate dropdown options for each book
                    foreach ($books as $index => $book) {
                        echo '<option value="' . $index . '">' . $book['Title'] . '</option>';
                    }
                    ?>
                </select>
                <div id="book-details"></div>
            </body>
            </html>
            <?php
        } else {
            echo 'No books available for the given school.';
        }

        // Close the statement and database connection
        $stmt = null;
        $pdo = null;

    } catch (PDOException $e) {
        throw $e;
    }
}
?>
