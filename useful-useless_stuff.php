<?php
require_once('Book.php');

    $username = $_SESSION['username'];
    $books_alrd_took='SELECT books_taken_temp FROM User WHERE Username = ?';
    $delayed='SELECT Delayed_Book FROM User WHERE Username = ?';
    
    $user_type='SELECT Type FROM User WHERE Username = ?';
   
    
    if ($user_type == "teacher") {
        $books_alrd_took='SELECT books_taken_temp FROM User WHERE Username = ?';
        $delayed='SELECT Delayed_Book FROM User WHERE Username = ?';
        if($books_alrd_took == 1 || $delayed == TRUE){
            print("Naughty naughty!!");
        }
        else {
            //if(copies avaliable >=1)
            //{
                $sql = "UPDATE User SET books_taken_temp = books_taken_temp + 1 
                WHERE User_id=$user_id";
                $sql = "UPDATE User SET books_taken_total = books_taken_total + 1 
                WHERE User_id=$user_id";
                print("Test");
            //}
            //else
            //{
                
                //reservation_pending make true and plus 1

            //}
        }
    } else {
        #see how many they have right now
        if($books_alrd_took == 2 || $delayed == TRUE){
            print("Naughty naughty!!");
        }
        else{

            //if(copies avaliable >=1)
            //{
                $sql = "UPDATE User SET books_taken_temp = books_taken_temp + 1 
                WHERE User_id=$user_id";
                $sql = "UPDATE User SET books_taken_total = books_taken_total + 1 
                WHERE User_id=$user_id";
                print("Test");
            //}
            //else
            //{
                //reservation_pending make true and plus 1

            //}
            
        }
    }
?>
 <!DOCTYPE html>
                                    <html>
                                    <head>
                                        <title>Books</title>
                                    </head>
                                    <body>
                                        <nav>
                                            <ul>
                                                <li><a href="index.php">Home</a></li>
                                                <li><a href="Book.php">Lend Book</a></li>
                                            </ul>
                                        </nav>
                                        <h1>Books</h1>
                                        <table>
                                            <tr>
                                                <th>Title</th>
                                                <th>Author</th>
                                                <th>Publisher</th>
                                                <th>ISBN</th>
                                                <th>Number of Pages</th>
                                                <th>Summary</th>
                                                <th>Thematic Category</th>
                                                <th>Language</th>
                                                <th>Keywords</th>
                                                <th>Available Copies</th>
                                                <th>Action</th>
                                            </tr>
                                            <!DOCTYPE html>
                    <html>
                    <head>
                        <title><?php echo $book['Title']; ?></title>
                    </head>
                    <body>
                        <nav>
                            <ul>
                                <li><a href="index.php">Home</a></li>
                                <li><a href="Book.php">Books</a></li>
                                <li><a href="logout.php">Lend</a></li>
                            </ul>
                        </nav>
                        <h1><?php echo $book['Title']; ?></h1>
                        <table>
                            <tr>
                                <th>Author</th>
                                <th>Publisher</th>
                                <th>ISBN</th>
                                <th>Number of Pages</th>
                                <th>Summary</th>
                                <th>Thematic Category</th>
                                <th>Language</th>
                                <th>Keywords</th>
                                <th>Available Copies</th>
                            </tr>
                            <tr>
                                <td><?php echo $book['First_Name'] . ' ' . $book['Last_Name']; ?></td>
                                <td><?php echo $book['Publisher']; ?></td>
                                <td><?php echo $book['ISBN']; ?></td>
                                <td><?php echo $book['Number_of_Pages']; ?></td>
                                <td><?php echo $book['Summary']; ?></td>
                                <td><?php echo $book['Thematic_Category']; ?></td>
                                <td><?php echo $book['Language'];
                                /*if ($stmt->rowCount() > 0) {
                                    // Fetch all the books into an associative array
                                    $books = $stmt->fetchAll(PDO::FETCH_ASSOC);*/
                                
                                   //require_once('Book.php');
        
        /*    $username = $_SESSION['username'];
            $books_alrd_took='SELECT books_taken_temp FROM User WHERE Username = ?';
            $delayed='SELECT Delayed_Book FROM User WHERE Username = ?';
            
            $user_type='SELECT Type FROM User WHERE Username = ?';
           
            
            if ($user_type == "teacher") {
                $books_alrd_took='SELECT books_taken_temp FROM User WHERE Username = ?';
                $delayed='SELECT Delayed_Book FROM User WHERE Username = ?';
                if($books_alrd_took == 1 || $delayed == TRUE){
                    print("Naughty naughty!!");
                }
                else {
                    //if(copies avaliable >=1)
                    //{
                        $sql = "UPDATE User SET books_taken_temp = books_taken_temp + 1 
                        WHERE User_id=$user_id";
                        $sql = "UPDATE User SET books_taken_total = books_taken_total + 1 
                        WHERE User_id=$user_id";
                        print("Test");
                    //}
                    //else
                    //{
                        
                        //reservation_pending make true and plus 1
        
                    //}
                }
            } else {
                #see how many they have right now
                if($books_alrd_took == 2 || $delayed == TRUE){
                    print("Naughty naughty!!");
                }
                else{
        
                    //if(copies avaliable >=1)
                    //{
                        $sql = "UPDATE User SET books_taken_temp = books_taken_temp + 1 
                        WHERE User_id=$user_id";
                        $sql = "UPDATE User SET books_taken_total = books_taken_total + 1 
                        WHERE User_id=$user_id";
                        print("Test");
                    //}
                    //else
                    //{
                        //reservation_pending make true and plus 1
        
                    //}
                    
                }
            }*/
        
           /* $school_id_query = 'SELECT School_id FROM user WHERE Username = ?';

            $stmt = $pdo->prepare($school_id_query);
            $stmt->bindParam(1, $username, PDO::PARAM_STR);
            $stmt->execute();
            
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            $id = $row['School_id'];
            
            $sql = 'SELECT b.Book_id, b.Title, b.Publisher, b.ISBN, b.Number_of_Pages, b.Summary, b.Thematic_Category, b.Language, b.Keywords, a.First_Name, a.Last_Name, c.Number_of_Available_Copies
                    FROM Book AS b
                    INNER JOIN Book_Author AS ba ON b.Book_id = ba.Book_id
                    INNER JOIN Author AS a ON ba.Author_id = a.Author_id
                    INNER JOIN Copies AS c ON b.Book_id = c.Book_id
                    WHERE c.School_id = ?';
            
            $stmt = $pdo->prepare($sql);
            $stmt->execute([$id]);
            
            // Check if there are any books available
            if ($stmt->rowCount() > 0) {
                // Fetch all the books into an associative array
                $books = $stmt->fetchAll(PDO::FETCH_ASSOC);
                ?>
                <!DOCTYPE html>
                <html>
                <head>
                    <title>Books</title>
                </head>
                <body>
                    <nav>
                        <ul>
                            <li><a href="index.php">Home</a></li>
                            <li><a href="lend-book.php">Lend Book</a></li>
                        </ul>
                    </nav>
                    <h1>Books</h1>
                    <table>
                        <tr>
                            <th>Title</th>
                            <th>Author</th>
                            <th>Publisher</th>
                            <th>ISBN</th>
                            <th>Number of Pages</th>
                            <th>Summary</th>
                            <th>Thematic Category</th>
                            <th>Language</th>
                            <th>Keywords</th>
                            <th>Available Copies</th>
                            <th>Action</th>
                        </tr>
                        <?php
                        // Loop through the books and display each one in a row of the table
                        foreach ($books as $index => $book) {
                            echo '<tr>';
                            echo '<td>' . $book['Title'] . '</td>';
                            echo '<td>' . $book['First_Name'] . ' ' . $book['Last_Name'] . '</td>';
                            echo '<td>' . $book['Publisher'] . '</td>';
                            echo '<td>' . $book['ISBN'] . '</td>';
                            echo '<td>' . $book['Number_of_Pages'] . '</td>';
                            echo '<td>' . $book['Summary'] . '</td>';
                        }
                    }*/
       
                    //<?php
                    // Start a session
                    //session_start();
                    
                    // Include the database connection file
                    //require_once 'dbconnect.php';
                    
                    // Check if the user is logged in
                    if (!isset($_SESSION['username'])) {
                        // If the user is not logged in, redirect them to the login page
                        header('Location: login.php');
                        exit();
                    }
                    
                    // Get the username from the session
                    $username = $_SESSION['username'];
                    
                    // Get the school ID of the user from the database
                   /* $school_id_query = 'SELECT School_id FROM user WHERE Username = ?';
                    $stmt = $pdo->prepare($school_id_query);
                    $stmt->bindParam(1, $username, PDO::PARAM_STR);
                    $stmt->execute();
                    $row = $stmt->fetch(PDO::FETCH_ASSOC);
                    $id = $row['School_id'];*/
                    
                    // Get the book ID from the URL parameter
                   /* if (!isset($_GET['id'])) {
                        // If the book ID is not set, redirect to the books page
                        header('Location: Book.php');
                        exit();
                    }*/
                   // $book_id = $_GET['book_id'];
                    
                    // Get the book details from the database
                   /* $sql = 'SELECT b.Book_id, b.Title, b.Publisher, b.ISBN, b.Number_of_Pages, b.Summary, b.Thematic_Category, b.Language, b.Keywords, a.First_Name, a.Last_Name, c.Number_of_Available_Copies
                            FROM Book AS b
                            INNER JOIN Book_Author AS ba ON b.Book_id = ba.Book_id
                            INNER JOIN Author AS a ON ba.Author_id = a.Author_id
                            INNER JOIN Copies AS c ON b.Book_id = c.Book_id
                            WHERE b.Book_id = ? AND c.School_id = ?';
                    $stmt = $pdo->prepare($sql);
                    $stmt->execute([$book_id, $id]);*/
                    
                    // Check if the book exists and is available
                   /* if ($stmt->rowCount() == 0) {
                        // If the book is not available, redirect to the books page
                        header('Location: Books.php');
                        exit();
                    }*/
                    //$book = $stmt->fetch(PDO::FETCH_ASSOC);
                    ?>
                    
                    
                                         <?php
                                            // Loop through the books and display each one in a row of the table
                                            foreach ($books as $index => $book) {
                                                $book_id = $book['Book_id'];
                                                $number_of_copies = $book['Number_of_Available_Copies'];
                                                echo '<tr>';
                                                echo '<td>' . $book['Title'] . '</td>';
                                                echo '<td>' . $book['First_Name'] . ' ' . $book['Last_Name'] . '</td>';
                                                echo '<td>' . $book['Publisher'] . '</td>';
                                                echo '<td>' . $book['ISBN'] . '</td>';
                                                echo '<td>' . $book['Number_of_Pages'] . '</td>';
                                                echo '<td>' . $book['Summary'] . '</td>';
                                                echo '<td>' . $book['Thematic_Category'] . '</td>';
                                                echo '<td>' . $book['Language'] . '</td>';
                                                echo '<td>' . $book['Keywords'] . '</td>';
                                                echo '<td>' . $number_of_copies . '</td>';
                                                echo '<td>';
                                                if ($number_of_copies > 0) {
                                                    echo '<form method="post" action="Book.php">';
                                                    echo '<input type="hidden" name="book_id" value="' . $book_id . '">';
                                                    echo '<input type="submit" name="lend" value="Lend">';
                                                    echo '</form>';
                                                } else {
                                                    echo 'Not available';
                                                }
                                                echo '</td>';
                                                echo '</tr>';
                                            }
                                            ?>
                                        </table>
                                    </body>
                                    </html>
                                <?php
                               /* } else {
                                    echo '<p>No books found</p>';
                                }*/
                                
                                 //require_once('Book.php');
        
        /*  $username = $_SESSION['username'];
            $books_alrd_took='SELECT books_taken_temp FROM User WHERE Username = ?';
            $delayed='SELECT Delayed_Book FROM User WHERE Username = ?';
            
            $user_type='SELECT Type FROM User WHERE Username = ?';
           
            
            if ($user_type == "teacher") {
                $books_alrd_took='SELECT books_taken_temp FROM User WHERE Username = ?';
                $delayed='SELECT Delayed_Book FROM User WHERE Username = ?';
                if($books_alrd_took == 1 || $delayed == TRUE){
                    print("Naughty naughty!!");
                }
                else {
                    //if(copies avaliable >=1)
                    //{
                        $sql = "UPDATE User SET books_taken_temp = books_taken_temp + 1 
                        WHERE User_id=$user_id";
                        $sql = "UPDATE User SET books_taken_total = books_taken_total + 1 
                        WHERE User_id=$user_id";
                        print("Test");
                    //}
                    //else
                    //{
                        
                        //reservation_pending make true and plus 1
        
                    //}
                }
            } else {
                #see how many they have right now
                if($books_alrd_took == 2 || $delayed == TRUE){
                    print("Naughty naughty!!");
                }
                else{
        
                    //if(copies avaliable >=1)
                    //{
                        $sql = "UPDATE User SET books_taken_temp = books_taken_temp + 1 
                        WHERE User_id=$user_id";
                        $sql = "UPDATE User SET books_taken_total = books_taken_total + 1 
                        WHERE User_id=$user_id";
                        print("Test");
                    //}
                    //else
                    //{
                        //reservation_pending make true and plus 1
        
                    //}
                    
                }
            }*/
        
           /* $school_id_query = 'SELECT School_id FROM user WHERE Username = ?';

            $stmt = $pdo->prepare($school_id_query);
            $stmt->bindParam(1, $username, PDO::PARAM_STR);
            $stmt->execute();
            
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            $id = $row['School_id'];
            
            $sql = 'SELECT b.Book_id, b.Title, b.Publisher, b.ISBN, b.Number_of_Pages, b.Summary, b.Thematic_Category, b.Language, b.Keywords, a.First_Name, a.Last_Name, c.Number_of_Available_Copies
                    FROM Book AS b
                    INNER JOIN Book_Author AS ba ON b.Book_id = ba.Book_id
                    INNER JOIN Author AS a ON ba.Author_id = a.Author_id
                    INNER JOIN Copies AS c ON b.Book_id = c.Book_id
                    WHERE c.School_id = ?';
            
            $stmt = $pdo->prepare($sql);
            $stmt->execute([$id]);
            
            // Check if there are any books available
            if ($stmt->rowCount() > 0) {
                // Fetch all the books into an associative array
                $books = $stmt->fetchAll(PDO::FETCH_ASSOC);
                ?>
                <!DOCTYPE html>
                <html>
                <head>
                    <title>Books</title>
                </head>
                <body>
                    <nav>
                        <ul>
                            <li><a href="index.php">Home</a></li>
                            <li><a href="lend-book.php">Lend Book</a></li>
                        </ul>
                    </nav>
                    <h1>Books</h1>
                    <table>
                        <tr>
                            <th>Title</th>
                            <th>Author</th>
                            <th>Publisher</th>
                            <th>ISBN</th>
                            <th>Number of Pages</th>
                            <th>Summary</th>
                            <th>Thematic Category</th>
                            <th>Language</th>
                            <th>Keywords</th>
                            <th>Available Copies</th>
                            <th>Action</th>
                        </tr>
                        <?php
                        // Loop through the books and display each one in a row of the table
                        foreach ($books as $index => $book) {
                            echo '<tr>';
                            echo '<td>' . $book['Title'] . '</td>';
                            echo '<td>' . $book['First_Name'] . ' ' . $book['Last_Name'] . '</td>';
                            echo '<td>' . $book['Publisher'] . '</td>';
                            echo '<td>' . $book['ISBN'] . '</td>';
                            echo '<td>' . $book['Number_of_Pages'] . '</td>';
                            echo '<td>' . $book['Summary'] . '</td>';
                        }
                    }*/
       
                    //<?php
                    // Start a session
                    //session_start();
                    
                    // Include the database connection file
                    //require_once 'dbconnect.php';
                    
                    // Check if the user is logged in
                    if (!isset($_SESSION['username'])) {
                        // If the user is not logged in, redirect them to the login page
                        header('Location: login.php');
                        exit();
                    }
                    
                    // Get the username from the session
                    $username = $_SESSION['username'];
                    
                    // Get the school ID of the user from the database
                   /* $school_id_query = 'SELECT School_id FROM user WHERE Username = ?';
                    $stmt = $pdo->prepare($school_id_query);
                    $stmt->bindParam(1, $username, PDO::PARAM_STR);
                    $stmt->execute();
                    $row = $stmt->fetch(PDO::FETCH_ASSOC);
                    $id = $row['School_id'];*/
                    
                    // Get the book ID from the URL parameter
                   /* if (!isset($_GET['id'])) {
                        // If the book ID is not set, redirect to the books page
                        header('Location: Book.php');
                        exit();
                    }*/
                   // $book_id = $_GET['book_id'];
                    
                    // Get the book details from the database
                   /* $sql = 'SELECT b.Book_id, b.Title, b.Publisher, b.ISBN, b.Number_of_Pages, b.Summary, b.Thematic_Category, b.Language, b.Keywords, a.First_Name, a.Last_Name, c.Number_of_Available_Copies
                            FROM Book AS b
                            INNER JOIN Book_Author AS ba ON b.Book_id = ba.Book_id
                            INNER JOIN Author AS a ON ba.Author_id = a.Author_id
                            INNER JOIN Copies AS c ON b.Book_id = c.Book_id
                            WHERE b.Book_id = ? AND c.School_id = ?';
                    $stmt = $pdo->prepare($sql);
                    $stmt->execute([$book_id, $id]);*/
                    
                    // Check if the book exists and is available
                   /* if ($stmt->rowCount() == 0) {
                        // If the book is not available, redirect to the books page
                        header('Location: Books.php');
                        exit();
                    }*/
                    //$book = $stmt->fetch(PDO::FETCH_ASSOC);
                    ?>
                    
                    
                                         <?php
                                            // Loop through the books and display each one in a row of the table
                                            foreach ($books as $index => $book) {
                                                $book_id = $book['Book_id'];
                                                $number_of_copies = $book['Number_of_Available_Copies'];
                                                echo '<tr>';
                                                echo '<td>' . $book['Title'] . '</td>';
                                                echo '<td>' . $book['First_Name'] . ' ' . $book['Last_Name'] . '</td>';
                                                echo '<td>' . $book['Publisher'] . '</td>';
                                                echo '<td>' . $book['ISBN'] . '</td>';
                                                echo '<td>' . $book['Number_of_Pages'] . '</td>';
                                                echo '<td>' . $book['Summary'] . '</td>';
                                                echo '<td>' . $book['Thematic_Category'] . '</td>';
                                                echo '<td>' . $book['Language'] . '</td>';
                                                echo '<td>' . $book['Keywords'] . '</td>';
                                                echo '<td>' . $number_of_copies . '</td>';
                                                echo '<td>';
                                                if ($number_of_copies > 0) {
                                                    echo '<form method="post" action="Book.php">';
                                                    echo '<input type="hidden" name="book_id" value="' . $book_id . '">';
                                                    echo '<input type="submit" name="lend" value="Lend">';
                                                    echo '</form>';
                                                } else {
                                                    echo 'Not available';
                                                }
                                                echo '</td>';
                                                echo '</tr>';
                                            }
                                            ?>
                                        </table>
                                    </body>
                                    </html>
                                <?php
                               /* } else {
                                    echo '<p>No books found</p>';
                                }
                                ?>
                                // Call API endpoint to lend the book
            /*fetch('/lend-book.php?book_id=' + bookId)
                .then(response => {
                    if (response.ok) {
                        alert('Book lent successfully');
                        // Refresh the book details
                        showBookDetails();
                    } else {
                        alert('Unable to lend book');
                    }               
                })
                .catch(error => {
                    console.error('Error lending book:', error);
                     alert('Unable to lend book');
            });*/
            /*$servername = "localhost";
                                $username = "w";
                                $password = "w";
                                $dbname = "library_system";

                                // Create connection
                                $conn = mysqli_connect($servername, $username, $password, $dbname);

                                // Check connection
                                if (!$conn) {
                                    die("Connection failed: " . mysqli_connect_error());
                                }

                                // Construct SQL query
                                $sql = "UPDATE User SET books_taken_total = 1, books_taken_temp = 1 WHERE User_id = 3 AND School_id = 1";

                                // Execute SQL query
                                if (mysqli_query($conn, $sql)) {
                                    echo "Record updated successfully";
                                } else {
                                    echo "Error updating record: " . mysqli_error($conn);
                                }

                                // Close connection
                                mysqli_close($conn);*/
                                // function takeBook($username) {
                           // $conn = mysqli_connect("localhost", "username", "password", "database");
    
                        // Check if the user is a teacher or a student
                        //if ($user_type == "teacher") {
                        //$sql = "UPDATE user SET books_taken_total = books_taken_total + 1, books_taken_temp = books_taken_temp +1 WHERE Username = '$username'";
                        //} elseif ($user_type == "student") {
                        //$sql = "UPDATE user SET total_books = total_books + 1, book_taken_temp = 2 WHERE user_id = '$user_id'";
                       // }
    
                        /*if (mysqli_query($conn, $sql)) {
                            echo "Book taken successfully!";
                        } else {
                            echo "Error taking book: " . mysqli_error($conn);
                        }*/
    
                        //mysqli_close($conn);
                       //}   
                        //}
                           /* $username = $_SESSION['username'];
                            $books_alrd_took_stmt=$pdo->prepare('SELECT books_taken_temp FROM User WHERE Username = ?');
                            $books_alrd_took_stmt->bindParam(1, $username);
                            $books_alrd_took_stmt->execute();
                            //$books_alrd_took = $books_alrd_took_stmt->fetchColumn();
                            
                            $delayed_stmt = $pdo->prepare('SELECT Delayed_Book FROM User WHERE Username = ?');
                            $delayed_stmt->bindParam(1, $username);
                            $delayed_stmt->execute();
                            //$delayed = $delayed_stmt->fetchColumn();            
                            
                            $user_type_stmt = $pdo->prepare('SELECT Type FROM User WHERE Username = ?');
                            $user_type_stmt->bindParam(1, $username);
                            $user_type_stmt->execute();
                            //$user_type = $user_type_stmt->fetchColumn();           
            


                            if ($user_type_stmt == 'teacher') {
                                $books_alrd_took_stmt = 'SELECT books_taken_temp FROM User WHERE Username = ?';
                                $delayed_stmt = 'SELECT Delayed_Book FROM User WHERE Username = ?';
                                if ($books_alrd_took_stmt == 1 || $delayed_stmt == TRUE) {
                                    print("Naughty naughty!!");
                                } else {
                                    $sql1 = "UPDATE User SET books_taken_temp = books_taken_temp + 1 WHERE Username = ?";
                                    $stmt1 = $pdo->prepare($sql1);
                                    $stmt1->bindParam(1, $username);
                                    $stmt1->execute();

                                    $sql2 = "UPDATE User SET books_taken_total = books_taken_total + 1 WHERE Username = ?";
                                    $stmt2 = $pdo->prepare($sql2);
                                    //$books_taken = 1;
                                    $stmt2->bindParam(1, $books_alrd_took_stmt);
                                    $stmt2->bindParam(2, $username);
                                    $stmt2->execute();
                                }
                            } else {
                                $sql1 = "UPDATE User SET books_taken_temp = books_taken_temp + 1 WHERE Username = ?";
                                $stmt1 = $pdo->prepare($sql1);
                                $stmt1->bindParam(1, $username);
                                $stmt1->execute();

                                $sql2 = "UPDATE User SET books_taken_total = books_taken_total + 1 WHERE Username = ?";
                                $stmt2 = $pdo->prepare($sql2);
                                //$books_taken = 1;
                                $stmt2->bindParam(1, $books_alrd_took_stmt);
                                $stmt2->bindParam(2, $username);
                                $stmt2->execute();
                            }   
                        }*/
                        



            /*if ($user_type == "teacher") {
                $books_alrd_took='SELECT books_taken_temp FROM User WHERE Username = ?';
                $delayed='SELECT Delayed_Book FROM User WHERE Username = ?';
                if($books_alrd_took == 1 || $delayed == TRUE){
                    print("Naughty naughty!!");
                }       
                else {
                    $sql1 = "UPDATE User SET books_taken_temp = books_taken_temp + 1 WHERE Username = ?";
                    $stmt1 = $pdo->prepare($sql1);
                    $stmt1->bindParam(1, $username);
                    $stmt1->execute();


                    $sql2 = "UPDATE User SET books_taken_total = books_taken_total + 1 WHERE Username = ?";
                    $stmt2 = $pdo->prepare($sql2);
                    $stmt2->bindParam(1, $username);
                    $stmt2->execute();
                }
            } else {
                //see how many they have right now
                $sql1 = "UPDATE User SET books_taken_temp = books_taken_temp + 1 WHERE Username = ?";
                $stmt1 = $pdo->prepare($sql1);
                $stmt1->bindParam(1, $username);
                $stmt1->execute();

                $sql2 = "UPDATE User SET books_taken_total = books_taken_total + 1 WHERE Username = ?";
                $stmt2 = $pdo->prepare($sql2);
                $stmt2->bindParam(1, $username);
                $stmt2->execute();
            }*/
        //}
       