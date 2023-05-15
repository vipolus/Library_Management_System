<?php
require_once('config.php');

session_start();
   

    $username = $_SESSION['username'];

    if($username==NULL)
        header('Location: '.'http://localhost/login.php');
  
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
       
       
       $school_id_query = 'SELECT School_id FROM user WHERE Username = ?';

       $stmt = $pdo->prepare($school_id_query);
       $stmt->bindParam(1, $username, PDO::PARAM_STR);
       $stmt->execute();
       
       $row = $stmt->fetch(PDO::FETCH_ASSOC);
       $id = $row['School_id'];
       //$user_id = $_SESSION['user_id'];

       
       $sql = 'SELECT b.Book_id, b.Title, b.Publisher, b.ISBN, b.Number_of_Pages, b.Summary, b.Thematic_Category, b.Language, b.Keywords, c.Number_of_Available_Copies
       FROM Book AS b
       INNER JOIN Copies AS c ON b.Book_id = c.Book_id
       WHERE c.School_id = ?';
        
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(1, $id, PDO::PARAM_STR);

        $stmt->execute();
        




        
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
                        
                        // Add a button to lend the book
                        if(selectedBook.Number_of_Available_Copies > 0)
                        {
                            var takeButton = document.createElement('button');
                            takeButton.innerHTML = 'Lend book';
                            takeButton.onclick = function() {
                                //alert("hello");
                                //function takebook(selectedBookId);
                                //$sql = "UPDATE Copies SET Number_of_Available_Copies = 0 WHERE Copies_id = 1 ;"
                                //alert("Successful loan");
                                /* $username = $_SESSION['username'];

                                    }*/
                                    // Send an Ajax request to update the database
                               

                                var xmlhttp = new XMLHttpRequest();
                                xmlhttp.onreadystatechange = function() {
                                    if (this.readyState == 4 && this.status == 200) {
                                        // Handle the server response here
                                        
                                    }
                                };
                                
                                xmlhttp.open("POST", "update_book.php", true);
                                xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                xmlhttp.send("Book_id" + selectedBookId);
                           
                            };
                            detailsDiv.appendChild(takeButton)
                        }
                        else
                        {
                            var p10 = document.createElement('p');
                            p10.innerHTML = 'No copies available';
                            detailsDiv.appendChild(p10);
                        }
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

?>
        

       
       
                                
                            
