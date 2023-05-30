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

    $query = "SELECT Type,School_id,Approved FROM User WHERE Username = :username";
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
    if ($_POST["action"] === "approve") {
        $userId = $_POST["userId"];
        // Execute an UPDATE query to set Approved value to 1 for the user
        $updateQuery = "UPDATE User SET Approved = 1 WHERE User_id = :userId";
        $updateStmt = $pdo->prepare($updateQuery);
        $updateStmt->bindParam(':userId', $userId);
        $updateStmt->execute();
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

    } elseif ($_POST["action"] === "add_book") {
            // Retrieve the form data
            $title = $_POST["title"];
            $publisher = $_POST["publisher"];
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
           


            // Prepare the SQL statement for inserting into the Copies table
            $insertCopiesQuery = "INSERT INTO Copies (Number_of_Available_Copies, School_id, Book_id, last_update)
                              VALUES (?, ?, ?, NOW())";
        $insertCopiesStmt = $pdo->prepare($insertCopiesQuery);
        $insertCopiesStmt->execute([$copies, $schoolId, $bookId]);

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
        
            // Generate the HTML markup dynamically
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
        <input type="text" id="category" name="category" required>
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
//header("Location: lib_operator.php");
   // exit(); 
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
</div>
<div class="forms-container">
  <?php
  $query = "SELECT u.User_id, u.First_Name, u.Last_Name, GROUP_CONCAT(b.Title SEPARATOR ', ') AS Titles
            FROM User AS u
            INNER JOIN Reservation AS r ON u.User_id = r.User_id
            INNER JOIN Book AS b ON r.Book_id = b.Book_id
            WHERE u.School_id = :school_id
            GROUP BY u.User_id";

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
        </tr>
      </thead>
      <tbody>
        <?php foreach ($users as $user): ?>
          <tr class="user-row" data-userid="<?php echo $user['User_id']; ?>">
            <td><?php echo $user['First_Name']; ?></td>
            <td><?php echo $user['Last_Name']; ?></td>
            <td><?php echo $user['Titles']; ?></td>
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




<?php

$query = "SELECT l.Loan_id, u.First_Name, u.Last_Name, b.Title, l.date_borrowed, l.date_returned
          FROM Loan AS l
          INNER JOIN User AS u ON l.User_id = u.User_id
          INNER JOIN Book AS b ON l.Book_id = b.Book_id
          WHERE u.School_id=:school_id";

$stmt = $pdo->prepare($query);
$stmt->execute([':school_id' => $schoolId]);


// Fetch all rows as an associative array
$loans = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<div class="Loans">
  <h2>Loans</h2>

  <select id="loan-select" onchange="showLoanDetails()">
    <option value="all">All</option>
    <?php foreach ($loans as $loan): ?>
      <option value="<?php echo $loan['Loan_id']; ?>"><?php echo $loan['Loan_id']; ?></option>
    <?php endforeach; ?>
  </select>
  
  <table id="loan-details-table">
    <thead>
      <tr>
        <th>Loan ID</th>
        <th>User</th>
        <th>Book Title</th>
        <th>Date Borrowed</th>
        <th>Date Returned</th>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($loans as $loan): ?>
        <tr>
          <td><?php echo $loan['Loan_id']; ?></td>
          <td><?php echo $loan['First_Name'] . ' ' . $loan['Last_Name']; ?></td>
          <td><?php echo $loan['Title']; ?></td>
          <td><?php echo $loan['date_borrowed']; ?></td>
          <td><?php echo $loan['date_returned']; ?></td>
        </tr>
      <?php endforeach; ?>
    </tbody>
  </table>
</div>

<script>
  function showLoanDetails() {
    var loanSelect = document.getElementById('loan-select');
    var selectedLoan = loanSelect.value;
    var loanDetailsTable = document.getElementById('loan-details-table');
    var rows = loanDetailsTable.getElementsByTagName('tr');

    // Show all rows if "All" is selected
    if (selectedLoan === 'all') {
      for (var i = 0; i < rows.length; i++) {
        rows[i].style.display = '';
      }
    } else {
      for (var i = 0; i < rows.length; i++) {
        var loanId = rows[i].getElementsByTagName('td')[0].innerText;

        // Hide rows that don't match the selected loan
        if (loanId !== selectedLoan) {
          rows[i].style.display = 'none';
        } else {
          rows[i].style.display = '';
        }
      }
    }
  }
</script>


</div>
</div>

        <!-- Your HTML content for the operator page -->
        </body>
        </html>
        