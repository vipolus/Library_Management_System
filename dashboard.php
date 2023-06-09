<?php
session_start();
require_once 'config.php';

$pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

if (isset($_SESSION['username'])) {
    $username = $_SESSION['username'];

    $query = "SELECT User_id FROM User WHERE Username = :username";
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':username', $username);
    $stmt->execute();

    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$user) {
        http_response_code(403);
        echo "403 Forbidden";
        exit();
    }
    $userID = $user['User_id'];

    $query = "SELECT COUNT(*) as count FROM Admin WHERE User_id = :user_id";
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':user_id', $userID);
    $stmt->execute();

    $result = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($result['count'] > 0) {
        ?>
        <!DOCTYPE html>
        <html>
        <head>
          <title>Admin Panel</title>
          <style>
            body {
              font-family: Arial, sans-serif;
              margin: 0;
              padding: 20px;
            }

            h1 {
              text-align: center;
            }
            

            .admin-panel {
              max-width: 1800px;
              margin: 0 auto;
              padding: 20px;
              border: 1px solid #ccc;
              border-radius: 5px;
              background-color: #f9f9f9;
            }

            .admin-panel p {
              margin: 10px 0;
            }

            .admin-panel .button {
              display: inline-block;
              padding: 10px 20px;
              background-color: #4CAF50;
              color: white;
              text-decoration: none;
              border-radius: 4px;
            }

            .admin-panel .button:hover {
              background-color: #45a049;
            }

            .admin-panel table {
              width: 100%;
              border-collapse: collapse;
            }

            .admin-panel table th,
            .admin-panel table td {
              border: 1px solid #ddd;
              padding: 8px;
              text-align: left;
            }

            .admin-panel table th {
              background-color: #f2f2f2;
            }
          </style>
        </head>
        <body>
          <div class="admin-panel">
            <h1>Admin Panel</h1>
            <p>Welcome to the admin panel. What would you like to do?</p>
            

            <h2>Pending Library Operators</h2>
            <?php
        $query = "SELECT User_id, First_Name, Last_Name, Email FROM User WHERE Approved = 0 AND Type = 'Library Operator'";
        $stmt = $pdo->query($query);
        
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
        if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["action"])) {
          if ($_POST["action"] === "approve") {
              $userId = $_POST["userId"];
              $updateQuery = "UPDATE User SET Approved = 1 WHERE User_id = :userId";
              $updateStmt = $pdo->prepare($updateQuery);
              $updateStmt->bindParam(':userId', $userId);
              $updateStmt->execute();

              $school_lib_op = "SELECT School_id FROM User WHERE User_id=:userId";
              $school_lib_opstmt = $pdo->prepare($school_lib_op);
              $school_lib_opstmt->bindParam(':userId', $userId);
              $school_lib_opstmt->execute();
              $school_id = $school_lib_opstmt->fetch(PDO::FETCH_ASSOC);

              
              header('Location: http://localhost/dashboard.php');
              exit();

          } elseif ($_POST["action"] === "reject") {
              $userId = $_POST["userId"];
      
              $deleteLoanQuery = "DELETE FROM loan WHERE User_id = :userId";
              $deleteLoanStmt = $pdo->prepare($deleteLoanQuery);
              $deleteLoanStmt->bindParam(':userId', $userId);
              $deleteLoanStmt->execute();
      
              $deleteUserQuery = "DELETE FROM User WHERE User_id = :userId";
              $deleteUserStmt = $pdo->prepare($deleteUserQuery);
              $deleteUserStmt->bindParam(':userId', $userId);
              $deleteUserStmt->execute();
              header('Location: http://localhost/dashboard.php');
              exit();
          } 
          elseif ($_POST["action"] === "add_school") {
           
           $school=$_POST['school_name'];
           $address=$_POST['address'];
           $city=$_POST['city'];
           $phone_number=$_POST['phone_number'];
           $email=$_POST['email'];
           $school_director=$_POST['full_name_of_school_director'];

            $insertSchoolQuery = "INSERT INTO School (School_Name, Address, City, Phone_Number,Email,Full_Name_of_School_Director)
                                VALUES (?, ?, ?, ?, ?, ?)";
            $insertSchoolStmt = $pdo->prepare($insertSchoolQuery);
            $insertSchoolStmt->execute([$school, $address, $city, $phone_number, $email, $school_director]);
            header('Location: http://localhost/dashboard.php');
            exit();


}
      
      }
      ?>
<button onclick="redirectToUserCard()">Main Page</button>

<script>
    function redirectToUserCard() {
        window.location.href = 'index.php';
    }
</script>
<h2>Add School</h2>
<div id="add-school-form">
    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
        <input type="hidden" name="action" value="add_school">
        <label for="school_name">School name:</label>
        <input type="text" id="school_name" name="school_name" required>
        <br>
        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required>
        <br>
        <label for="city">City:</label>
        <input type="text" id="city" name="city" required>
        <br>
        <label for="phone_number">Phone number:</label>
        <input type="text" id="phone_number" name="phone_number" required>
        <br>
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" required>
        <br>
        <label for="full_name_of_school_director">Full name of school director:</label>
        <input type="text" id="full_name_of_school_director" name="full_name_of_school_director">
        <br>
        <input type="submit" value="Add school">
    </form>
</div>




            
<h2>Total Loans by School</h2>

<form method="POST">
  <label for="month">Select Month:</label>
  <select name="month" id="month">
    <option value="all">All</option> 
    <?php
    for ($i = 1; $i <= 12; $i++) {
      printf('<option value="%02d">%s</option>', $i, date("F", mktime(0, 0, 0, $i, 1)));
    }
    ?>
  </select>
  <label for="year">Select Year:</label>
  <select name="year" id="year">
    <?php
    $currentYear = date("Y");
    for ($i = $currentYear; $i >= $currentYear - 10; $i--) {
      echo "<option value='$i'>$i</option>";
    }
    ?>
  </select>
  <input type="submit" name="submit" value="Search">
</form>

<?php
if (isset($_POST['submit'])) {
  $selectedMonth = $_POST['month'];
  $selectedYear = $_POST['year'];

  $query = "SELECT School.School_Name, School.times_loaned, Lib_op.School_id
  FROM School AS School
  JOIN School_Library_Operator AS Lib_op ON School.School_id = Lib_op.School_id
  LEFT JOIN Loan ON Lib_op.Library_Operator_id = Loan.Library_Operator_id
  WHERE (:month = 'all' OR MONTH(Loan.date_borrowed) = :month) AND YEAR(Loan.date_borrowed) = :year
  GROUP BY School.School_id";

  $stmt = $pdo->prepare($query);
  $stmt->bindParam(':month', $selectedMonth, PDO::PARAM_STR); 
  $stmt->bindParam(':year', $selectedYear, PDO::PARAM_INT);
  $stmt->execute();

  
  $loansData = $stmt->fetchAll(PDO::FETCH_ASSOC);

  unset($selectedMonth);
  unset($selectedYear);
  if (!empty($loansData)) {
    ?>
    <table>
      <tr>
        <th>School</th>
        <th>Total Loans</th>
      </tr>
      <?php foreach ($loansData as $data) : ?>
        <tr>
          <td><?php echo $data['School_Name']; ?></td>
          <td><?php echo $data['times_loaned']; ?></td>
        </tr>
      <?php endforeach; ?>
    </table>
    <?php
  } else {
    echo "<p>No data available.</p>";
  }
 
 
}
?>


<div class="Teacher_Authors">
<h2>Display teachers and authors by book category</h2>
            <?php
            
           
            $query = "SELECT * FROM book";
            $stmt = $pdo->prepare($query);
            $stmt->execute();

            $cat_query="SELECT Name,Category_id FROM category";
            $cat_querystmt=$pdo->prepare($cat_query);
            $cat_querystmt->execute();
          
          $options = '';
          $options .= '<option value="all">Choose Category</option>';
          $uniqueCategories = array(); 
          
          
          foreach ($cat_querystmt as $row) {
              $cat = $row['Name'];
              
              if (!array_key_exists($cat, $uniqueCategories)) {
                  $uniqueCategories[$cat] = true;
                  
                  $options .= '<option value="' . $cat . '">' . $cat . '</option>';
              }
          }

          ?>
        
          </div>
          <form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
    <label for="nameSelect">Choose category to search for:</label>
    <select name="nameSelect" style="width: 100px !important; min-width: 50px; max-width: 100px; height: 20px; font-size: 16px;">
        <?php echo $options; ?>
    </select>
    <input type="submit" value="Search">
</form>


          

          <?php
          
          if (isset($_POST['nameSelect'])) {
            $selectedCategory = $_POST['nameSelect'];
            
        } else {
            $selectedCategory="All";
        }
        
         $text="Category you are searching for:";
          echo $text." " .$selectedCategory;
        
          
            ?>
               <?php
              

$query1="SELECT DISTINCT User.First_Name, User.Last_Name
FROM User
JOIN Loan ON Loan.User_id = User.User_id
JOIN Book ON Book.Book_id = Loan.Book_id
JOIN Book_Category ON Book_Category.Book_id = Book.Book_id
JOIN Category ON Category.Category_id = Book_Category.Category_id
WHERE Category.Name = :selectedCategory
AND Loan.date_borrowed >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
AND User.Type = 'Teacher';

";

$query2="SELECT DISTINCT Author.First_Name, Author.Last_Name
FROM Author
JOIN Book_Author ON Author.Author_id = Book_Author.Author_id
JOIN Book ON Book.Book_id = Book_Author.Book_id
JOIN Book_Category ON Book_Category.Book_id = Book.Book_id
JOIN Category ON Category.Category_id = Book_Category.Category_id
WHERE Category.Name = :selectedCategory;
";
    
    $stmt1 = $pdo->prepare($query1);
    $stmt1->bindParam(':selectedCategory', $selectedCategory);
    $stmt1->execute();

    $stmt2 = $pdo->prepare($query2);
    $stmt2->bindParam(':selectedCategory', $selectedCategory);
    $stmt2->execute();

    $Author_first_name = array();
    $Author_last_name = array();
    $Teacher_first_name = array();
    $Teacher_last_name = array();

while ($row = $stmt1->fetch(PDO::FETCH_ASSOC)) {
    $Teacher_first_name[] = $row['First_Name'];
    $Teacher_last_name []= $row['Last_Name'];
}

while ($row = $stmt2->fetch(PDO::FETCH_ASSOC)) {
$Author_first_name[] = $row['First_Name']; 
$Author_last_name[] = $row['Last_Name'];
}



   ?>



<div class="container">
  <style>
    .container {
      display: flex;
      width: 100%;
      justify-content: space-between;
    }

    .column {
      flex: 1;
      width:50%;
      margin-right: 100px;
    }
  </style>
  <div class="column">
    <h2>Authors wrote books in category</h2>
    <?php 
    for ($i = 0; $i < count($Author_first_name); $i++) {
      echo $Author_first_name[$i]. " ";
      echo $Author_last_name[$i]. "<br>";
    }
    ?>
  </div>
  <div class="column">
    <h2>Teachers borrowed book in category</h2>
    <?php
    for ($i = 0; $i < count($Teacher_first_name); $i++) {
      echo $Teacher_first_name[$i]. " ";
      echo $Teacher_last_name[$i]. "<br>";
    }
    ?>
  </div>
</div>


<?php

            ?>
          
            
            <?php
      
        
            ?>
<h2>Search teachers with most books loans</h2>
<?php 
$query = "SELECT User.First_Name, User.Last_Name, User.Number_of_loans, COUNT(Loan.Book_id) AS Num_of_Books_Borrowed
FROM User
INNER JOIN Loan ON User.User_id = Loan.User_id
WHERE User.Type = 'Teacher' AND User.Age < 40
GROUP BY User.First_Name, User.Last_Name, User.Number_of_loans
ORDER BY COUNT(User.Number_of_loans)";




$stmt = $pdo->prepare($query);
$stmt->execute();
$first_name = array();
$last_name = array();
$number_of_loans=array();

while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
$first_name[] = $row['First_Name']; 
$last_name[] = $row['Last_Name'];
$number_of_loans[]=$row['Number_of_loans'];
}


echo '<table>
                <tr>
                    <th>First name</th>
                    <th>Last name</th>
                    <th>Number of loans</th>
                </tr>';
      for ($i = 0; $i < count($first_name); $i++){
                echo '<tr>
                <td>' .$first_name[$i] .'</td> 
                <td>' . $last_name[$i] . '</td>
                <td>' . $number_of_loans[$i] . '</td>
  
              </tr>';
      }
      echo '</table>';
?>









<div class="Authors_zero_books">
<h2>Authors with zero books loaned</h2>
<?php 
$query = "SELECT A.Author_id, A.First_Name, A.Last_Name
FROM Author A
WHERE A.Author_id NOT IN (
    SELECT DISTINCT BA.Author_id
    FROM Book_Author BA
    INNER JOIN Loan L ON BA.Book_id = L.Book_id
)
";

$stmt = $pdo->prepare($query);
$stmt->execute();
$first_name = array();
$last_name = array();
$number_of_loans=array();

while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
$first_name[] = $row['First_Name']; 
$last_name[] = $row['Last_Name'];
}

echo '<table>
                <tr>
                    <th>First name</th>
                    <th>Last name</th>
                </tr>';
      for ($i = 0; $i < count($first_name); $i++){
                echo '<tr>
                <td>' .$first_name[$i] .'</td> 
                <td>' . $last_name[$i] . '</td>  
              </tr>';
      }
?>
</div>



   </table>

    
   <div class="Combined_categories">
    <h2>Most Combined Categories</h2>
    <?php
        $mult_cat = "
        SELECT c1.Name AS Category1, c2.Name AS Category2, COUNT(*) AS Frequency
        FROM (
            SELECT LEAST(bc1.Category_id, bc2.Category_id) AS Category1, GREATEST(bc1.Category_id, bc2.Category_id) AS Category2
            FROM Book_Category AS bc1
            JOIN Book_Category AS bc2 ON bc1.Book_id = bc2.Book_id
            JOIN Loan AS l ON l.Book_id = bc1.Book_id OR l.Book_id = bc2.Book_id
            WHERE bc1.Category_id < bc2.Category_id
        ) AS pairs
        JOIN Category AS c1 ON c1.Category_id = pairs.Category1
        JOIN Category AS c2 ON c2.Category_id = pairs.Category2
        GROUP BY Category1, Category2
        ORDER BY Frequency DESC
        LIMIT 3";
        

        $mult_catstmt = $pdo->prepare($mult_cat);
        $mult_catstmt->execute();

        if ($mult_catstmt->rowCount() > 0) {
            echo "<h3>Top 3 Combined Categories:</h3>";
            echo "<ul>";
            while ($row = $mult_catstmt->fetch(PDO::FETCH_ASSOC)) {
                $category1 = $row['Category1'];
                $category2 = $row['Category2'];
                $frequency = $row['Frequency'];

                echo "<li>Categories: $category1, $category2 | Frequency: $frequency</li>";
            }
            echo "</ul>";
        } else {
            echo "No results found.";
        }
    ?>
</div>




<div class="Loans_of_Operators">
  <form method="POST">
    <select id="yearSelect" name="yearSelect" onchange="this.form.submit()">
      <option value="Select Year">Select Year</option>
      <option value="2020">2020</option>
      <option value="2021">2021</option>
      <option value="2022">2022</option>
      <option value="2023">2023</option>
    </select>
  </form>

  <?php
  if (isset($_POST['yearSelect'])) {
    $selectedYear = $_POST['yearSelect'];
    $startDate = $selectedYear . '-01-01';
    $endDate = $selectedYear . '-12-31';

    $query = "SELECT Library_Operator_id
              FROM Loan
              WHERE date_borrowed >= :startDate AND date_borrowed <= :endDate
              GROUP BY Library_Operator_id
              HAVING COUNT(*) > 20
              ORDER BY COUNT(*) DESC";
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':startDate', $startDate);
    $stmt->bindParam(':endDate', $endDate);
    $stmt->execute();


  } else {
    echo "Please select a year to display the loans of operators.";
  }

$query = "SELECT Library_Operator_id
          FROM Loan
          WHERE date_borrowed >= :startDate AND date_borrowed <= :endDate
          GROUP BY Library_Operator_id
          HAVING COUNT(*) > 20
          ORDER BY COUNT(*) DESC";
$stmt = $pdo->prepare($query);
$stmt->bindParam(':startDate', $startDate);
$stmt->bindParam(':endDate', $endDate);
$stmt->execute();

if ($stmt->rowCount() > 0) {
    echo "Operators with more than 20 loans within the last year:<br><br><br>";

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $operatorId = $row['Library_Operator_id'];

        $operatorQuery = "SELECT *,u.First_Name,u.Last_Name FROM School_Library_Operator
                          INNER JOIN User u ON u.User_id=:operatorId
                       WHERE Library_Operator_id = :operatorId";
        $operatorStmt = $pdo->prepare($operatorQuery);
        $operatorStmt->bindParam(':operatorId', $operatorId);
        $operatorStmt->execute();

        if ($operatorStmt->rowCount() > 0) {
            $operatorRow = $operatorStmt->fetch(PDO::FETCH_ASSOC);
            $operatorName = $operatorRow['First_Name'];
            $operatorLName = $operatorRow['Last_Name'];
 
            echo "Operator's Details:<br>First Name: $operatorName<br>Last Name: $operatorLName<br><br>";
        }
    }
} else {
    echo "No operators found with more than 20 loans within the last year.";
}
?>

      </div>




<div class="Authors_Most_Books">
<?php

$query = "SELECT a.Author_id, a.First_Name, a.Last_Name, a.Num_of_books_written
FROM Author a
WHERE a.Num_of_books_written <= (SELECT MAX(b.Num_of_books_written) - 5 FROM Author b)

";

$stmt = $pdo->prepare($query);
$stmt->execute();

$authors = $stmt->fetchAll(PDO::FETCH_ASSOC);

if (!empty($authors)) {
    echo "<h2>Authors with at least 5 books fewer than the author with the most books:</h2>";
    echo "<ul>";
    foreach ($authors as $author) {
        echo "<li>{$author['First_Name']} {$author['Last_Name']}  {$author['Num_of_books_written']}</li>";
    }
    echo "</ul>";
} else {
    echo "No authors found.";
}
?>



</div>











    </div>
        </body>
        </html>

        <?php
    } else {
        http_response_code(403);
        echo "403 Forbidden";
        exit();
    }
} else {
    header("Location: login.php");
    exit();
}
?>
