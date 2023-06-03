<?php

require_once 'config.php';
// Get the user's information, such as their user ID



$pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


session_start();
// Check if the user is logged in and has a valid session
if (!isset($_SESSION['username'])) {
    // Redirect to the login page or display an error message
    header("Location: login.php");
    exit();
}


// Retrieve the user ID from the session
    $userId = $_SESSION['username'];

    $query = "SELECT Type,School_id,Approved,User_id FROM User WHERE Username = :username";
    $userStmt = $pdo->prepare($query);
    $userStmt->bindParam(':username', $userId);
    $userStmt->execute();
    $user = $userStmt->fetch(PDO::FETCH_ASSOC);

    // Check if the user is a library operator or admin

    
    if ((($user['Type'] === 'Library Operator' && $user['Approved']) || $user['Type'] === 'Admin')  )
    $isLibraryOperator = true;
    else $isLibraryOperator = false;

    if (!$isLibraryOperator) {
        // Redirect to a page or display an error message indicating access denied
        header("Location: login.php");
        exit();
    }

    // Retrieve the school ID of the library operator
    $schoolId = $user['School_id'];


if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["action"])) {
  if ($_POST["action"] === "res_approve") {
    
    $lib_op = $user['User_id'];
    $user_Id = $_POST["userId"];
    $bookId = $_POST["bookId"];
    $loanquery = "INSERT INTO Loan (Library_Operator_id, User_id, Book_id, date_borrowed, fullfilled) 
    VALUES (:Library_Operator_id, :User_id, :Book_id, CURRENT_TIMESTAMP, 0)";

    
    $stmt = $pdo->prepare($loanquery);
    $stmt->bindParam(':Library_Operator_id', $lib_op);
    $stmt->bindParam(':User_id', $user_Id);
    $stmt->bindParam(':Book_id', $bookId);
    $stmt->execute();
  }
  


    if ($_POST["action"] === "approve") {
        $userId = $_POST["userId"];
        // Execute an UPDATE query to set Approved value to 1 for the user
        $updateQuery = "UPDATE User SET Approved = 1 WHERE User_id = :userId";
        $updateStmt = $pdo->prepare($updateQuery);
        $updateStmt->bindParam(':userId', $userId);
        $updateStmt->execute();
        header('Location: http://localhost/lib_operator.php');
    } elseif ($_POST["action"] === "reject") {
        $userId = $_POST["userId"];

        // Delete associated loan records
        $deleteLoanQuery = "DELETE FROM loan WHERE User_id = :userId";
        $deleteLoanStmt = $pdo->prepare($deleteLoanQuery);
        $deleteLoanStmt->bindParam(':userId', $userId);
        $deleteLoanStmt->execute();

        // Delete the user from the database
        $deleteUserQuery = "DELETE FROM User WHERE User_id = :userId";
        $deleteUserStmt = $pdo->prepare($deleteUserQuery);
        $deleteUserStmt->bindParam(':userId', $userId);
        $deleteUserStmt->execute();
        header('Location: http://localhost/lib_operator.php');

    } elseif ($_POST["action"] === "add_book") {
            // Retrieve the form data
            $title = $_POST["title"];
            $publisher = $_POST["publisher"];
            $author=$_POST["author"];
            $isbn = $_POST["isbn"];
            $numPages = $_POST["num_pages"];
            $summary = $_POST["summary"];
            $image = $_POST["image"];
            $category = $_POST["category"];
            $language = $_POST["language"];
            $keywords = $_POST["keywords"];
            $copies = $_POST["copies"];
    
            // Perform any necessary data validation here
    
            // Prepare the SQL statement for inserting into the Book table
            $insertBookQuery = "INSERT INTO Book (Title, Publisher, ISBN, Number_of_Pages, Summary, Image, Thematic_Category, Language, Keywords)
                                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            $insertBookStmt = $pdo->prepare($insertBookQuery);
            $insertBookStmt->execute([$title, $publisher, $isbn, $numPages, $summary, $image, $category, $language, $keywords]);
    
            // Retrieve the generated Book_id
            $bookId = $pdo->lastInsertId();

            //Insert authors in author table 
            $split_authors=explode(",",$author);
            foreach($split_authors as $Name)
            {
              $split_name=explode(" ",$Name);;
              $checkQuery="SELECT COUNT(*) FROM Author WHERE First_Name=:firstname AND Last_Name=:lastname";
              $checkStmt = $pdo->prepare($checkQuery);
              $checkStmt->bindParam(':firstname', $split_name[0]);
              $checkStmt->bindParam(':lastname', $split_name[1]);
              $checkStmt->execute();
              $count = $checkStmt->fetchColumn();

              if($count==0)
              {
                $authorsquery="INSERT INTO Author(First_Name,Last_Name) VALUES(?,?)";
              $authorsquerystmt=$pdo->prepare($authorsquery);
              $authorsquerystmt->execute([$split_name[0],$split_name[1]]);
              $authorId=$pdo->lastInsertId();
            }
            
            $authorIdQuery = "SELECT Author_id FROM Author WHERE First_Name = :firstname AND Last_Name = :lastname";
            $authorIdStmt = $pdo->prepare($authorIdQuery);
            $authorIdStmt->bindParam(':firstname', $split_name[0]);
            $authorIdStmt->bindParam(':lastname', $split_name[1]);
            $authorIdStmt->execute();
            $authorId = $authorIdStmt->fetchColumn();

            $book_author_query = "SELECT COUNT(*) FROM Book_Author WHERE Author_id = :authorid AND Book_id = :bookid";
            $book_author_querystmt = $pdo->prepare($book_author_query);
            $book_author_querystmt->bindParam(':authorid', $authorId);
            $book_author_querystmt->bindParam(':bookid', $bookId);
            $book_author_querystmt->execute();
            
            $check = $book_author_querystmt->fetchColumn();
            if ($check == 0) {
                $book_author = "INSERT INTO Book_Author(Author_id, Book_id) VALUES (?, ?)";
                $book_authorstmt = $pdo->prepare($book_author);
                $book_authorstmt->execute([$authorId, $bookId]);
            }
            

          }

         


         


          $split_categories = explode(",", $category);

            //Insert categories in category table 
            foreach ($split_categories as $categoryName) {
    $count=0;
    // Check if the category name exists in the Category table
    $checkQuery = "SELECT COUNT(*) FROM Category WHERE Name = :categoryName";
    $checkStmt = $pdo->prepare($checkQuery);
    $checkStmt->bindParam(':categoryName', $categoryName);
    $checkStmt->execute();
    $count = $checkStmt->fetchColumn();

    // If the category name doesn't exist, insert it into the Category table
    if ($count == 0) {
        $insertQuery = "INSERT INTO Category (Name) VALUES (:categoryName)";
        $insertStmt = $pdo->prepare($insertQuery);
        $insertStmt->bindParam(':categoryName', $categoryName);
        $insertStmt->execute();
    }

    $catquery="SELECT Category_id FROM Category WHERE Name=:categoryName";
    $catquerystmt=$pdo->prepare($catquery);
    $catquerystmt->bindParam(':categoryName',$categoryName);
    $catquerystmt->execute();
    $cat_id=$catquerystmt->fetchColumn();

    $book_category="SELECT COUNT(*) FROM Book_Category WHERE Category_id=:categoryid AND Book_id=:bookid";
    $book_categorystmt=$pdo->prepare($book_category);
    $book_categorystmt->bindParam(':categoryid',$cat_id);
    $book_categorystmt->bindParam(':bookid',$bookId);
    $book_categorystmt->execute();
    $result=$book_categorystmt->fetchColumn();

    if($result==0){
      $book_category="INSERT INTO Book_Category(Category_id,Book_id) VALUES(?,?)";
      $book_categorystmt=$pdo->prepare($book_category);
      $book_categorystmt->execute([$cat_id,$bookId]);

    }
}

            // Prepare the SQL statement for inserting into the Copies table
            $insertCopiesQuery = "INSERT INTO Copies (Number_of_Available_Copies, School_id, Book_id, last_update)
                              VALUES (?, ?, ?, NOW())";
        $insertCopiesStmt = $pdo->prepare($insertCopiesQuery);
        $insertCopiesStmt->execute([$copies, $schoolId, $bookId]);
 
        
       header ('Location: http://localhost/lib_operator.php');

}

}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Operator Panel</title>
    <style>
            body {
              font-family: Arial, sans-serif;
              margin: 0;
              padding: 20px;
              
            }

            h1 {
              text-align: center;
            }

            .operator-panel {
              max-width: 1500px;
              margin: 0 auto;
              padding: 20px;
              border: 1px solid #ccc;
              border-radius: 5px;
              background-color: #f9f9f9;
            }

            .operator-panel p {
              margin: 10px 0;
            }

            .operator-panel .button {
              display: inline-block;
              padding: 10px 20px;
              background-color: #4CAF50;
              color: white;
              text-decoration: none;
              border-radius: 4px;
            }

            .operator-panel .button:hover {
              background-color: #45a049;
            }

            .operator-panel table {
              width: 100%;
              border-collapse: collapse;
            }

            .operator-panel table th,
            .operator-panel table td {
              border: 1px solid #ddd;
              padding: 10px;
              text-align: left;
            }

            .operator-panel table th {
              background-color: #f2f2f2;
            }
          </style>
</head>
<body>
<div class="operator-panel">
            <h1>Operator Panel</h1>
            <p>Welcome to the operator panel. What would you like to do?</p>
            

    <!-- Display users to be approved or rejected -->
    
    <div id="users-panel">
    <h2>Pending Users</h2>
        <?php
        // Retrieve users with Approved value false from the database
        $query = "SELECT User_id, First_Name, Last_Name, Email FROM User WHERE Approved = 0 AND Type != 'Library Operator' AND School_id = :school_id";
        $stmt = $pdo->prepare($query);
        $stmt->bindParam(':school_id', $schoolId);
        $stmt->execute();
        
        
        // Display the user data in the panel
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $userId = $row['User_id'];
            $firstName = $row['First_Name'];
            $lastName = $row['Last_Name'];
            $email = $row['Email'];
        
           
            echo '<div>';
            echo '<p>Name: ' . $firstName . ' ' . $lastName . '</p>';
            echo '<p>Email: ' . $email . '</p>';
            echo '<form action="' . $_SERVER['PHP_SELF'] . '" method="POST">';
            echo '<input type="hidden" name="action" value="approve">';
            echo '<input type="hidden" name="userId" value="' . $userId . '">';
            echo '<input type="submit" value="Approve">';
            echo '</form>';
            echo '<form action="' . $_SERVER['PHP_SELF'] . '" method="POST">';
            echo '<input type="hidden" name="action" value="reject">';
            echo '<input type="hidden" name="userId" value="' . $userId . '">';
            echo '<input type="submit" value="Reject">';
            echo '</form>';
            echo '</div>';
        }
        ?>
            
            
            
           
            <style>
    .container {
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .forms-container {
      display: flex;
      width: 100%;
    }

    .add-book-form,
    .edit-book-form {
      flex: 1;
      margin-right: 20px;
    }

    .Reservations {
      width: 25%;
      margin-right: 20px; 
    }

    .Loans {
      margin-left: 300px;
    }

</style>

  </div>

  <div class="container">
  <div class="forms-container">
<div class="add-book-form">
<h2>Add Book</h2>
    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
        <input type="hidden" name="action" value="add_book">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" required>
        <br>
        <label for="publisher">Publisher:</label>
        <input type="text" id="publisher" name="publisher" required>
        <br>
        <label for="author">Author:</label>
        <input type="text" id="author" name="author" required>
        <br>
        <label for="isbn">ISBN:</label>
        <input type="text" id="isbn" name="isbn" required>
        <br>
        <label for="num_pages">Number of Pages:</label>
        <input type="number" id="num_pages" name="num_pages" required>
        <br>
        <label for="summary">Summary:</label>
        <textarea id="summary" name="summary" rows="4" required></textarea>
        <br>
        <label for="image">Image:</label>
        <input type="text" id="image" name="image">
        <br>
        <label for="category">Category:</label>
        <input type="text" id="category" name="category" value="Ex:Action,Horror" required>
        <br>
        <label for="categories">Example Categories:</label>
        
        <select id="all_categories" name="all_categories">
    <?php
   
    $query = "SELECT * FROM Category";
    $stmt = $pdo->prepare($query);
    $stmt->execute();
    $categories = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($categories as $category) {
        echo '<option value="' . $category['Category_id'] . '">' . $category['Name'] . '</option>';
    }

    ?>


</select>

    <br>
        <label for="language">Language:</label>
        <input type="text" id="language" name="language" required>
        <br>
        <label for="keywords">Keywords:</label>
        <input type="text" id="keywords" name="keywords" required>
        <br>
        <label for="copies">Number of Copies:</label>
        <input type="number" id="copies" name="copies" required>
        <br>
        <input type="submit" value="Add Book">
    </form>
</div>


<div class="edit-book-form">
    <h2>Edit</h2>
   
    <?php
    $sql = 'SELECT b.Book_id, b.Title, b.Publisher, b.ISBN, b.Number_of_Pages, b.Summary, b.Image, b.Thematic_Category, b.Language, b.Keywords, c.Number_of_Available_Copies
    FROM Book AS b
    INNER JOIN Copies AS c ON b.Book_id = c.Book_id
    WHERE c.School_id = :school_id';

    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':school_id', $schoolId);
    $stmt->execute();
    $books = $stmt->fetchAll(PDO::FETCH_ASSOC);
  

    $options = '<option value="">Select a book</option>';
    foreach ($books as $book) {
        $options .= '<option value="' . $book['Book_id'] . '">' . $book['Title'] . '</option>';
    }
    


    if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["action"]))
    if ($_POST["action"] === "update_book")
{
      $book_id=$_POST['Book_id'];
      $Title = $_POST["title-input"];
      $Publisher=$_POST['publisher'];
      $Isbn=$_POST['isbn'];
      $Pages=$_POST['pages'];
      $Summary=$_POST['summary'];
      $Image=$_POST['book-image'];
      $Category=$_POST['category'];
      $Language=$_POST['language'];
      $Keywords=$_POST['keywords'];
      $Copies=$_POST['copies'];

      $updateBookQuery = "UPDATE Book AS b
      INNER JOIN Copies AS c ON b.Book_id = c.Book_id
      SET b.Title = :title, b.Publisher = :publisher, b.ISBN = :isbn, b.Number_of_Pages = :pages,
      b.Summary = :summary, b.Image = :image, b.Thematic_Category = :category, b.Language = :language,
      b.Keywords = :keywords, c.Number_of_Available_Copies = :copies
      WHERE c.School_id = :school_id AND b.Book_id = :book_id";
$updateBookStmt = $pdo->prepare($updateBookQuery);

$updateBookStmt->execute([
':title' => $Title,
':publisher' => $Publisher,
':isbn' => $Isbn,
':pages' => $Pages,
':summary' => $Summary,
':image' => $Image,
':category' => $Category,
':language' => $Language,
':keywords' => $Keywords,
':copies' => $Copies,
':school_id' => $schoolId,
':book_id' => $book_id
]);

header("Location: lib_operator.php");
exit();

}


    ?>

<script>
        function showBookDetails() {
            var bookSelect = document.getElementById('book-select');
    var selectedBookId = parseInt(bookSelect.value);
    var selectedBook = <?= json_encode($books) ?>.find(function(book) {
        return book['Book_id'] === selectedBookId;
    });
    console.log(selectedBook);

    document.getElementById('title-input').value = selectedBook['Title'];
    document.getElementById('publisher-input').value = selectedBook['Publisher'];
    document.getElementById('isbn-input').value = selectedBook['ISBN'];
    document.getElementById('pages-input').value = selectedBook['Number_of_Pages'];
    document.getElementById('summary-input').value = selectedBook['Summary'];
    document.getElementById('book-image').value = selectedBook['Image'];
    document.getElementById('category-input').value = selectedBook['Thematic_Category'];
    document.getElementById('language-input').value = selectedBook['Language'];
    document.getElementById('keywords-input').value = selectedBook['Keywords'];
    document.getElementById('copies-input').value = selectedBook['Number_of_Available_Copies'];
    // Update other input fields accordingly

    // Update the 'src' attribute of the <img> element with the book image
    document.getElementById('book-image').value = selectedBook['Image'];
}

    </script>




   <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
        <label for="book-select">Choose Book:</label>
        <select id="book-select" name="Book_id" onchange="showBookDetails()">
            <?php echo $options; ?>
        </select>
        <input type="hidden" name="action" value="update_book">
        <br>
        <label for="title-input">Title:</label>
        <input type="text" id="title-input" name="title-input">
        <br>
        <label for="publisher-input">Publisher:</label>
        <input type="text" id="publisher-input" name="publisher">
        <br>
        <label for="isbn-input">ISBN:</label>
        <input type="text" id="isbn-input" name="isbn">
        <br>
        <label for="pages-input">Number of Pages:</label>
        <input type="number" id="pages-input" name="pages">
        <br>
        <label for="summary-input">Summary:</label>
        <textarea id="summary-input" name="summary"></textarea>
        <br>
        <label for="book-image">Image:</label>
        <textarea id="book-image" name="book-image"></textarea>
        <br>
        <label for="category-input">Catergory:</label>
        <textarea id="category-input" name="category"></textarea>

        <br>
        <label for="language-input">Language:</label>
        <textarea id="language-input" name="language"></textarea>
        <br>
        <label for="keywords-input">Keywords:</label>
        <textarea id="keywords-input" name="keywords"></textarea>
        <br>
        <label for="copies-input">Number of copies:</label>
        <textarea id="copies-input" name="copies"></textarea>
        <br>
        <input type="submit" value="Update Book">


    </form>

</div>



<div class="Delete_Deactivate">
    <h2>Deactivate a user</h2>

    <?php
    $currentUsername = $_SESSION['username'];
    $query = "SELECT School_id FROM User WHERE Username = :username";
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':username', $currentUsername);
    $stmt->execute();
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    $currentSchoolId = $row['School_id'];

    $query = "SELECT * FROM User WHERE School_id = :schoolId AND Approved=1";
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':schoolId', $currentSchoolId);
    $stmt->execute();

    if ($stmt->rowCount() > 0) {
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $userId = $row['User_id'];
            $firstName = $row['First_Name'];
            $lastName = $row['Last_Name'];

            echo "<div class='user-item'>";
            echo "<p>$firstName $lastName</p>";

            echo "<button class='delete-button' onclick='deleteUser($userId)'>Delete</button>";
            echo "<button class='deactivate-button' onclick='deactivateUser($userId)'>Deactivate</button>";

            echo "</div>";
        }
    } else {
        echo "No users found for the selected school.";
    }

    if (isset($_POST['userId'])) {
        $userId = $_POST['userId'];

        if (isset($_POST['action'])) {
            $action = $_POST['action'];

            if ($action === 'delete') {
                // Delete the user
                $deleteQuery = "DELETE FROM User WHERE User_id = :userId";
                $stmt = $pdo->prepare($deleteQuery);
                $stmt->bindParam(':userId', $userId);
                $stmt->execute();
                header('Location: http://localhost/lib_operator.php');

            } elseif ($action === 'deactivate') {
                // Deactivate the user
                $deactivateQuery = "UPDATE User SET Approved = -1 WHERE User_id = :userId";
                $stmt = $pdo->prepare($deactivateQuery);
                $stmt->bindParam(':userId', $userId);
                $stmt->execute();
                

            }
        }

    }
    ?>

    <script>
        function deleteUser(userId) {
            var confirmation = confirm("Are you sure you want to delete this user?");
            if (confirmation) {
                var form = document.createElement('form');
                form.method = 'post';
                form.style.display = 'none';

                var userIdField = document.createElement('input');
                userIdField.type = 'hidden';
                userIdField.name = 'userId';
                userIdField.value = userId;
                form.appendChild(userIdField);

                var actionField = document.createElement('input');
                actionField.type = 'hidden';
                actionField.name = 'action';
                actionField.value = 'delete';
                form.appendChild(actionField);

                document.body.appendChild(form);
                form.submit();
            }
        }

        function deactivateUser(userId) {
            var confirmation = confirm("Are you sure you want to deactivate this user?");
            if (confirmation) {
                var form = document.createElement('form');
                form.method = 'post';
                form.style.display = 'none';

                var userIdField = document.createElement('input');
                userIdField.type = 'hidden';
                userIdField.name = 'userId';
                userIdField.value = userId;
                form.appendChild(userIdField);

                var actionField = document.createElement('input');
                actionField.type = 'hidden';
                actionField.name = 'action';
                actionField.value = 'deactivate';
                form.appendChild(actionField);

                document.body.appendChild(form);
                form.submit();
            }
        }
    </script>
</div>
















</div>




<?php
// Fetch available books from the database
$queryBooks = "SELECT DISTINCT b.Title
               FROM Book AS b
               ORDER BY b.Title";
$stmtBooks = $pdo->prepare($queryBooks);
$stmtBooks->execute();
$books = $stmtBooks->fetchAll(PDO::FETCH_COLUMN);
?>

<div class="show_books">
    <div class="Books">
        <h2>Books</h2>

        <form method="GET" action="">
            <label for="book">Select a Book:</label>
            <select name="book" id="book">
                <option value="">Choose a Book</option>
                <?php foreach ($books as $book): ?>
                    <option value="<?= $book ?>"><?= $book ?></option>
                <?php endforeach; ?>
            </select>
            <button type="submit">Show Details</button>
        </form>

        <?php
        // Check if a book is selected
        if (!empty($_GET['book'])) {
            $selectedBook = $_GET['book'];

            // Find the selected book in the database
            $queryBook = "SELECT b.Title,b.Thematic_Category, CONCAT(a.First_Name, ' ', a.Last_Name) AS Author, cpy.Number_of_Available_Copies AS Num_of_Copies
                          FROM Book AS b
                          INNER JOIN Book_Author AS ba ON b.Book_id = ba.Book_id
                          INNER JOIN Author AS a ON ba.Author_id = a.Author_id
                          INNER JOIN Book_Category AS bc ON b.Book_id = bc.Book_id
                          LEFT JOIN Copies AS cpy ON b.Book_id = cpy.Book_id
                          WHERE b.Title = :title";
            $stmtBook = $pdo->prepare($queryBook);
            $stmtBook->bindValue(':title', $selectedBook);
            $stmtBook->execute();
            $selectedBookDetails = $stmtBook->fetch(PDO::FETCH_ASSOC);

            if ($selectedBookDetails) {
                ?>
                <div class="book-details">
                    <h3>Book Details</h3>
                    <p><strong>Title:</strong> <?= $selectedBookDetails['Title'] ?></p>
                    <p><strong>Author:</strong> <?= $selectedBookDetails['Author'] ?></p>
                    <p><strong>Category:</strong> <?= $selectedBookDetails['Thematic_Category'] ?></p>
                    <p><strong>Number of Copies:</strong> <?= $selectedBookDetails['Num_of_Copies'] ?></p>
                </div>
                <?php
            } else {
                echo "<p>No details found for the selected book.</p>";
            }
        }
        ?>
    </div>
</div>








<div class="forms-container">
  <?php
 $query = "SELECT u.User_id, u.First_Name, u.Last_Name,r.date_created, GROUP_CONCAT(b.Title SEPARATOR ', ') AS Titles, r.Book_id
 FROM User AS u
 INNER JOIN Reservation AS r ON u.User_id = r.User_id
 INNER JOIN Book AS b ON r.Book_id = b.Book_id
 LEFT JOIN Loan AS l ON u.User_id = l.User_id AND r.Book_id = l.Book_id
 WHERE u.School_id = :school_id AND l.Loan_id IS NULL
 GROUP BY r.date_created";

  $stmt = $pdo->prepare($query);
  $stmt->execute([':school_id' => $schoolId]);

  // Fetch all rows as an associative array
  $users = $stmt->fetchAll(PDO::FETCH_ASSOC);
  ?>


  <div class="Reservations">
    <h2>Reservations</h2>

    <select id="user-select" onchange="showUserDetails()">
      <option value="all">All</option>
      <?php foreach ($users as $user): ?>
        <option value="<?php echo $user['User_id']; ?>"><?php echo $user['First_Name'] . ' ' . $user['Last_Name']; ?></option>
      <?php endforeach; ?>
    </select>

    <table id="user-details-table">
      <thead>
        <tr>
          <th>First Name</th>
          <th>Last Name</th>
          <th>Titles</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($users as $user): ?>
          <tr class="user-row" data-userid="<?php echo $user['User_id']; ?>">
            <td><?php echo $user['First_Name']; ?></td>
            <td><?php echo $user['Last_Name']; ?></td>
            <td><?php echo $user['Titles']; ?></td>
            <td>
              <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
                <input type="hidden" name="action" value="res_approve">
                <input type="hidden" name="userId" value="<?php echo $user['User_id']; ?>">
                <input type="hidden" name="bookId" value="<?php echo $user['Book_id']; ?>">
                <input type="submit" value="Approve">
              </form>
              <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
                <input type="hidden" name="action" value="res_reject">
                <input type="hidden" name="userId" value="<?php echo $user['User_id']; ?>">
                <input type="hidden" name="bookId" value="<?php echo $user['Book_id']; ?>">
                <input type="submit" value="Reject">
              </form>
            </td>
          </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
  </div>

  <script>
    var users = <?php echo json_encode($users); ?>;

    function showUserDetails() {
      var userSelect = document.getElementById('user-select');
      var selectedUserId = userSelect.value;
      var userDetailsTable = document.getElementById('user-details-table');
      var rows = userDetailsTable.getElementsByClassName('user-row');

      for (var i = 0; i < rows.length; i++) {
        var userId = rows[i].getAttribute('data-userid');

        if (selectedUserId === 'all' || userId === selectedUserId) {
          rows[i].style.display = '';
        } else {
          rows[i].style.display = 'none';
        }
      }
    }
  </script>
</div>





<div class="Loans">
    <h1>Loans</h1>



<div class="Loan_Book">

<?php

if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["action"])){
  if($_POST["action"]=='Loan_Book')
{

    $query = "SELECT Library_Operator_id FROM School_Library_Operator WHERE School_id = :schoolid";
    $userStmt = $pdo->prepare($query);
    $userStmt->bindParam(':schoolid', $schoolId);
    $userStmt->execute();
    $user = $userStmt->fetch(PDO::FETCH_ASSOC);


  $selectedUser = $_POST['selected-user'];
  $selectedBook = $_POST['selected-book'];

  $query="INSERT INTO Loan(Library_Operator_id,User_id,Book_id,date_borrowed) VALUES(:libo,:user,:book,CURRENT_TIMESTAMP)";
  $querystmt=$pdo->prepare($query);
  $querystmt->bindparam(':libo',$user['Library_Operator_id']);
  $querystmt->bindparam(':user',$selectedUser);
  $querystmt->bindparam(':book',$selectedBook);
  $querystmt->execute();
  
    
}

}



$query = "SELECT Username, User_id, Type, books_taken_temp 
FROM User 
WHERE School_id = :schoolid 
  AND NOT (Type = 'Teacher' AND books_taken_temp = 1)
  AND NOT (Type = 'Student' AND books_taken_temp = 2)";
$querystmt = $pdo->prepare($query);
$querystmt->bindparam(':schoolid', $schoolId);
$querystmt->execute();
$users = $querystmt->fetchAll(PDO::FETCH_ASSOC);




    $query = "SELECT Book.Title, Book.Book_id
          FROM Book
          INNER JOIN Copies ON Copies.Book_id = Book.Book_id
          WHERE Copies.School_id = :schoolid AND Copies.Number_of_Available_Copies > 0";
    $querystmt = $pdo->prepare($query);
    $querystmt->bindparam(':schoolid', $schoolId);
    $querystmt->execute();
    $booksloan = $querystmt->fetchAll(PDO::FETCH_ASSOC);


?>



<form method="POST" action="lib_operator.php">
<input type="hidden" name="action" value="Loan_Book">
  <label for="user-select">Select User:</label>
  <select id="user-select" name="selected-user">
  
    <?php foreach ($users as $user): ?>
      <option value="<?= $user['User_id'] ?>"><?= $user['Username'] ?></option>
    <?php endforeach; ?>
  </select>

  <label for="book-select">Select Book:</label>
  <select id="book-select" name="selected-book">
   
    <?php foreach ($booksloan as $book): ?>
      <option value="<?= $book['Book_id'] ?>"><?= $book['Title'] ?></option>
    <?php endforeach; ?>
  </select>

  <input type="submit" value="Loan_Book">
</form>


  </div>






    <div class="Delayed_Loans">



    <?php

$query = "SELECT l.Loan_id, u.First_Name, u.Last_Name, b.Title, l.date_borrowed, l.date_returned, l.fullfilled, DATEDIFF(CURDATE(), l.date_borrowed) AS days_diff
          FROM Loan AS l
          INNER JOIN User AS u ON l.User_id = u.User_id
          INNER JOIN Book AS b ON l.Book_id = b.Book_id
          WHERE u.School_id = :school_id
          AND DATEDIFF(CURDATE(), l.date_borrowed) > 7";

$stmt = $pdo->prepare($query);
$stmt->execute([':school_id' => $schoolId]);

// Fetch all rows as an associative array
$loans = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Set default selected loan
$selectedLoan = '';

?>
        <h2>Delayed Loans</h2>

        <button id="toggle-delayed-loans" onclick="toggleDelayedLoans()">Show Delayed</button>

        <table id="delayed-loan-details-table" style="display: none;">
            <thead>
                <tr>
                    <th>Loan ID</th>
                    <th>User</th>
                    <th>Book Title</th>
                    <th>Date Borrowed</th>
                    <th>Date Returned</th>
                    <th>Days of Book Return Overdue</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($loans as $loan): ?>

                    <td><?= $loan['Loan_id'] ?></td>
                    <td><?= $loan['First_Name'] . ' ' . $loan['Last_Name'] ?></td>
                    <td><?= $loan['Title'] ?></td>
                    <td><?= $loan['date_borrowed'] ?></td>
                    <td><?= $loan['date_returned'] ?></td>
                    <td><?= $loan['days_diff'] ?></td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>

<script>
    var showDelayedLoans = true; 
    window.onload = function() {
        toggleDelayedLoans(); 
    };

    function toggleDelayedLoans() {
        var toggleButton = document.getElementById('toggle-delayed-loans');
        var loanTable = document.getElementById('delayed-loan-details-table');

        showDelayedLoans = !showDelayedLoans; 

        if (showDelayedLoans) {
            loanTable.style.display = ''; 
            toggleButton.textContent = 'Hide Delayed Loans'; 
        } else {
            loanTable.style.display = 'none'; 
            toggleButton.textContent = 'Show Delayed Loans';
        }
    }
</script>









<div class="Total_Loans">
<h2>Total Loans</h2>

<?php

$query = "SELECT l.Loan_id, u.First_Name, u.Last_Name, b.Title, l.date_borrowed, l.fullfilled
          FROM Loan AS l
          INNER JOIN User AS u ON l.User_id = u.User_id
          INNER JOIN Book AS b ON l.Book_id = b.Book_id
          WHERE u.School_id = :school_id AND l.fullfilled=0 AND l.Library_Operator_id=:userid
          AND DATEDIFF(CURDATE(), l.date_borrowed) < 7";

$stmt = $pdo->prepare($query);
$stmt->bindparam(':school_id',$schoolId);
$stmt->bindparam(':userid',$user['User_id']);
$stmt->execute();

$loans = $stmt->fetchAll(PDO::FETCH_ASSOC);
$selectedLoan = '';

?>




<button id="Total-loans_button" onclick="toggleTotalLoans()">Toggle Display</button>

<table id="Total-loans" style="display: none;">
<thead>
<tr>
<th>Loan ID</th>
<th>User</th>
<th>Book Title</th>
<th>Date Borrowed</th>
<th>Fullfilled</th>
</tr>
</thead>
<tbody>
<?php foreach ($loans as $loan): ?>
<tr>
<td><?= $loan['Loan_id'] ?></td>
<td><?= $loan['First_Name'] . ' ' . $loan['Last_Name'] ?></td>
<td><?= $loan['Title'] ?></td>
<td><?= $loan['date_borrowed'] ?></td>
<td>
<?php
if ($loan['fullfilled'] == 0) {
    echo 'No';
} elseif ($loan['fullfilled'] == 1) {
    echo 'Yes';
} elseif ($loan['fullfilled'] == -1) {
    echo 'Delayed';
}
?>
</td>
</tr>
<?php endforeach; ?>
</tbody>
</table>


<script>

var showTotalLoans = true; 

window.onload = function() {
  toggleTotalLoans(); 
};


function toggleTotalLoans() {
  var table = document.getElementById('Total-loans');
  var button = document.getElementById('Total-loans_button');

  showTotalLoans = !showTotalLoans;

  if (showTotalLoans) {
    table.style.display = '';
    button.textContent = 'Hide Loans';
  } else {
    table.style.display = 'none';
    button.textContent = 'Show Loans';
  }
}
</script>
</div>








<div class="Reviews">
  <h1>Reviews</h1>

  <?php
  $query = "SELECT r.Text, r.Rating, r.User_id, b.Title, u.Username,r.Review_id
            FROM Review r
            INNER JOIN Book b ON r.Book_id = b.Book_id
            INNER JOIN User u ON r.User_id = u.User_id
            WHERE u.School_id = :schoolid AND r.Approved=0";

  $statement = $pdo->prepare($query);
  $statement->bindParam(':schoolid', $schoolId);
  $statement->execute();

  // Display review details for each row
  while ($row = $statement->fetch(PDO::FETCH_ASSOC)) {
    $review = $row['Text'];
    $rating = $row['Rating'];
    $bookName = $row['Title'];
    $username = $row['Username'];
    $reviewId=$row['Review_id'];

    
    echo "<h2>Review Details</h2>";
    echo "<p>Review: $review</p>";
    echo "<p>Rating: $rating</p>";
    echo "<p>Book Name: $bookName</p>";
    echo "<p>Username: $username</p>";

    // Display reject and approve buttons
    echo "<form method='post' action='lib_operator.php'>";
    echo "<input type='submit' name='reject' value='Reject'>";
    echo "<input type='submit' name='approve' value='Approve'>";
    echo "</form>";

    if (isset($_POST['reject'])) {
    
      echo "Review rejected!";
      $deleteUserQuery = "DELETE FROM Review WHERE Review_id = :reviewId";
      $updaterev = $pdo->prepare($sql);
      $updaterev->bindParam(':reviewId', $reviewId);
      $updaterev->execute();
      
    } elseif (isset($_POST['approve'])) {
     
      $sql = "UPDATE Review SET Approved = 1 WHERE Review_id = :reviewId";
      $updaterev = $pdo->prepare($sql);
      $updaterev->bindParam(':reviewId', $reviewId);
      $updaterev->execute();
      echo "Review Approved!";
      
    }

    echo "<hr>"; 
  }
  ?>
</div>





<?php


$userQuery = "SELECT User_id, First_Name, Last_Name FROM User WHERE School_id = :school_id";
$userStmt = $pdo->prepare($userQuery);
$userStmt->bindParam(':school_id', $schoolId);
$userStmt->execute();
$users = $userStmt->fetchAll(PDO::FETCH_ASSOC);


$categoryQuery = "SELECT Category_id, Name FROM Category";
$categoryStmt = $pdo->prepare($categoryQuery);
$categoryStmt->execute();
$categories = $categoryStmt->fetchAll(PDO::FETCH_ASSOC);

?>

<div class="SearchForm">

    <?php
    
$query = "SELECT u.First_Name, u.Last_Name, c.Name AS Category, AVG(r.Rating) AS Average_Rating
          FROM Review AS r
          INNER JOIN User AS u ON r.User_id = u.User_id
          INNER JOIN Book AS b ON r.Book_id = b.Book_id
          INNER JOIN Book_Category AS bc ON b.Book_id = bc.Book_id
          INNER JOIN Category AS c ON bc.Category_id = c.Category_id
          WHERE (:user_id IS NULL OR u.User_id = :user_id)
          GROUP BY u.User_id";

$stmt = $pdo->prepare($query);
$stmt->bindParam(':user_id', $user['User_id']);
$stmt->execute();


$averages = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>



<div class="SearchForm">
  <h2>Search Criteria</h2>

  <form action="" method="POST">
    <div>
      <label for="user-select">User:</label>
      <select id="user-select" name="user_id">
        <option value="All" selected>Select User</option>
        <?php foreach ($users as $user): ?>
          <option value="<?= $user['User_id'] ?>"><?= $user['First_Name'] . ' ' . $user['Last_Name'] ?></option>
        <?php endforeach; ?>
      </select>
    </div>

    <div>
      <label for="category-select">Category:</label>
      <select id="category-select" name="category">
        <option value="All" selected>Select Category</option>
        <?php foreach ($categories as $category): ?>
          <option value="<?= $category['Name'] ?>"><?= $category['Name'] ?></option>
        <?php endforeach; ?>
      </select>
    </div>

    <button type="submit" name="submit_review">Search</button>
  </form>
</div>

<?php
$averages2=array();
if (isset($_POST['submit_review'])) {
 
  $selectedCategory = $_POST['category'];
 
$query = "SELECT c.Name AS Category, AVG(r.Rating) AS Average_Rating
          FROM Review AS r
          INNER JOIN Book AS b ON r.Book_id = b.Book_id
          INNER JOIN Book_Category AS bc ON b.Book_id = bc.Book_id
          INNER JOIN Category AS c ON bc.Category_id = c.Category_id
          WHERE c.Name = :category
          GROUP BY c.Name";

$stmt = $pdo->prepare($query);
$stmt->bindParam(':category', $selectedCategory);
$stmt->execute();

$averages = $stmt->fetchAll(PDO::FETCH_ASSOC);



$selectedUserId = $_POST['user_id'];

$query2 = "SELECT u.First_Name, u.Last_Name , AVG(r.Rating) AS Average_Rating
          FROM Review AS r
          INNER JOIN User AS u ON r.User_id = u.User_id
          WHERE r.User_id = :userid";
       

$stmt2 = $pdo->prepare($query2);
$stmt2->bindParam(':userid', $selectedUserId);
$stmt2->execute();

$averages2 = $stmt2->fetchAll(PDO::FETCH_ASSOC);

}
 



?>

<div class="AverageRatings">
  <h2>Average Ratings</h2>


<div class="User_Ratings">
  <table id="User_Ratings">
    <thead>
      <tr>
        <th>First_Name      Last_Name</th>
        <th>Average Rating</th>
      </tr>
      
    </thead>
    <tbody>
      <?php foreach ($averages2 as $average): ?>
        <tr>
    
          <td><?= $average['First_Name'] . ' ' . $average['Last_Name'] ?></td>
          <td><?= $average['Average_Rating'] ?></td>
        </tr>
     <?php endforeach; ?>
    </tbody>
  </table>
</div>


<div class="Category_Ratings">
  <table id="Category_Ratings">
    <thead>
      <tr>
        <th>Category</th>
        <th>Average Rating</th>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($averages as $average): ?>
        <tr>
          <td><?= $average['Category'] ?></td>
          <td><?= $average['Average_Rating'] ?></td>
        </tr>
      <?php endforeach; ?>
    </tbody>
  </table>
</div>


</div>



</div>
</div>



</body>
</html>
    

  
<?