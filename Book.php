<?php
require_once('config.php');

session_start();
   

    $username = $_SESSION['username'];

    if($username==NULL)
        header('Location: '.'http://localhost/login.php');
  
        $pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
       
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

       
       
       $sql = 'SELECT b.Book_id, b.Title, b.Publisher, b.ISBN, b.Number_of_Pages, b.Summary, b.Image, b.Thematic_Category, b.Language, b.Keywords, c.Number_of_Available_Copies
       FROM Book AS b
       INNER JOIN Copies AS c ON b.Book_id = c.Book_id
       WHERE c.School_id = ?';
       
       $stmt = $pdo->prepare($sql);
       $stmt->bindParam(1, $id, PDO::PARAM_STR);
       $stmt->execute();
       
       
       if ($stmt->rowCount() > 0) {
           
           $books = $stmt->fetchAll(PDO::FETCH_ASSOC);
           
       ?>
           <!DOCTYPE html>
           <html>
           <head>
               <title>Books</title>
               <script>
                   function showBookDetails() {
                       var bookSelect = document.getElementById('book-select');
                       var selectedBookId = bookSelect.value;
                       var selectedBook = <?= json_encode($books) ?>[selectedBookId];
       
                       var detailsDiv = document.getElementById('book-details');
                       detailsDiv.innerHTML = '';
       
                       var h2 = document.createElement('h2');
                       h2.innerHTML = selectedBook['Title'];
                       detailsDiv.appendChild(h2);
       
                       var p1 = document.createElement('p');
                       p1.innerHTML = '<strong>Author:</strong> ' + selectedBook['First_Name'] + ' ' + selectedBook['Last_Name'];
                       detailsDiv.appendChild(p1);
       
                       var p2 = document.createElement('p');
                       p2.innerHTML = '<strong>Publisher:</strong> ' + selectedBook['Publisher'];
                       detailsDiv.appendChild(p2);
       
                       var p3 = document.createElement('p');
                       p3.innerHTML = '<strong>ISBN:</strong> ' + selectedBook['ISBN'];
                       detailsDiv.appendChild(p3);
       
                       var p4 = document.createElement('p');
                       p4.innerHTML = '<strong>Number of Pages:</strong> ' + selectedBook['Number_of_Pages'];
                       detailsDiv.appendChild(p4);
       
                       var p5 = document.createElement('p');
                       p5.innerHTML = '<strong>Summary:</strong> ' + selectedBook['Summary'];
                       detailsDiv.appendChild(p5);
       
                       var p6 = document.createElement('p');
                       p6.innerHTML = '<strong>Thematic Category:</strong> ' + selectedBook['Thematic_Category'];
                       detailsDiv.appendChild(p6);
       
                       var p7 = document.createElement('p');
                       p7.innerHTML = '<strong>Language:</strong> ' + selectedBook['Language'];
                       detailsDiv.appendChild(p7);
       
                       var p8 = document.createElement('p');
                       p8.innerHTML = '<strong>Keywords:</strong> ' + selectedBook['Keywords'];
                       detailsDiv.appendChild(p8);
       
                       var p9 = document.createElement('p');
                       p9.innerHTML = '<strong>Copies Available:</strong> ' + selectedBook['Number_of_Available_Copies'];
                       detailsDiv.appendChild(p9);
       
                       var img = document.createElement('img');
                      
                       img.src ='http://localhost/Book_cover/'+ selectedBook['Image'];
                       img.width = '250';
                       img.height = '250';
                       detailsDiv.appendChild(img);
       
                       var form = document.createElement('form');
                        form.method = 'post';
                        form.action = 'update_book.php?Book_id=' + selectedBook['Book_id'];

                        var button = document.createElement('button');
                        button.type = 'submit';
                        button.name = 'reserve-button';
                        button.innerHTML = 'Reserve book now!';

                        form.appendChild(button);
                        detailsDiv.appendChild(form);

                        
                        form.addEventListener('submit', function(event) {
                          
                          event.preventDefault();
                        
                          var formData = new FormData(form);
                          fetch(form.action, {
                            method: form.method,
                            body: formData
                          })
                            .then(function(response) {
                              window.location.href = '/Book.php';
                            })
                            .catch(function(error) {
                             
                              console.error('Form submission error:', error);
                            });
                        });

                   }
               </script>
           </head>
           <body>
               <h1>Books</h1>
               <label for="book-select">Select a book:</label>
               <select id="book-select" onchange="showBookDetails()">
                   <option value="">Select</option>
                   <?php
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
       
       
        $stmt = null;
        $pdo = null;

?>
        

       
       
                                
                            
