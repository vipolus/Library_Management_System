<?php
// Assuming you have already established a database connection
session_start();
require_once 'config.php';
// Get the user's information, such as their user ID

$pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// Check if the 'username' session variable is set
if (isset($_SESSION['username'])) {
    $username = $_SESSION['username'];

    // Prepare and execute the database query to find the user ID based on the username
    $query = "SELECT User_id FROM User WHERE Username = :username";
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':username', $username);
    $stmt->execute();

    // Fetch the result
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$user) {
        // User does not exist, return a 403 Forbidden error
        http_response_code(403);
        echo "403 Forbidden";
        exit();
    }

    // Get the user ID
    $userID = $user['User_id'];

    // Prepare and execute the database query to check if the user is an admin
    $query = "SELECT COUNT(*) as count FROM Admin WHERE User_id = :user_id";
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':user_id', $userID);
    $stmt->execute();

    // Fetch the result
    $result = $stmt->fetch(PDO::FETCH_ASSOC);

    // Check if the user exists in the Admin table
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
              max-width: 900px;
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
            
            
            <h2>Total Loans by School</h2>
            <?php
            // Assuming you have established a database connection and executed the query to fetch the data
            // $loansData contains the fetched data from the database
            $query = "SELECT * FROM School";
            $stmt = $pdo->prepare($query);
            $stmt->execute();

            // Fetch the result
            $loansData = $stmt->fetchAll(PDO::FETCH_ASSOC);

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
            ?>

<h2>Display teachers and authors by book category</h2>
            <?php
            // Assuming you have established a database connection and executed the query to fetch the data
            // $loansData contains the fetched data from the database
           
            $query = "SELECT * FROM book";
            $stmt = $pdo->prepare($query);
    
    $stmt->execute();

    // Fetch the result
    
          
          
          
          while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $category[]=$row['Thematic_Category'];
           $names[]=$row['Title'];
          }
          
          $options = '';
          $options .= '<option value="all">All Categories</option>';
          $uniqueCategories = array(); // Associative array to store unique categories
          

          foreach ($category as $cat) {
    // Check if the category is already added to the uniqueCategories array
          if (!isset($uniqueCategories[$cat])) {
        // Add the category to the uniqueCategories array
        $uniqueCategories[$cat] = true;
        
        // Generate the option element with the category value
        $options .= '<option value="' . $cat . '">' . $cat . '</option>';
    }
}

          ?>
          <form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
    <label for="nameSelect">Choose category to search for:</label>
    <select name="nameSelect" style="width: 100px !important; min-width: 50px; max-width: 100px; height: 20px; font-size: 16px;">
        <!-- Options here -->
        <?php echo $options; ?>
    </select>
    <input type="submit" value="Search">
</form>


          

          <?php
          
          if (isset($_POST['nameSelect'])) {
            $selectedCategory = $_POST['nameSelect'];
            // Rest of your code
        } else {
            $selectedCategory="All";
        }
        
         $text="Category you are searching for:";
          echo $text." " .$selectedCategory;
        
          if (!empty($names)) {
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
$Author_first_name[] = $row['First_Name']; // Add first name to the array
$Author_last_name[] = $row['Last_Name'];
}

if ($selectedCategory == 'all') {
    // Display all books
    
      /*  for ($i = 0; $i < count($names); $i++) {
            echo '<tr>
                    <td>' .$first_name[$i] .'</td> 
                    <td>' . $names[$i] . '</td>
                    <td>' . $category[$i] . '</td>
                  </tr>';
        }*/
    
} else {

    // Display books for the selected category
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
    <!-- Content for the first column -->
  </div>
  <div class="column">
    <h2>Teachers borrowed book in category</h2>
    <?php
    for ($i = 0; $i < count($Teacher_first_name); $i++) {
      echo $Teacher_first_name[$i]. " ";
      echo $Teacher_last_name[$i]. "<br>";
    }
    ?>
    <!-- Content for the second column -->
  </div>
</div>


<?php
}
            ?>
            </table>
            
            <?php
        } else {
            echo "<p>No data available.</p>";
        }
        
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
$first_name[] = $row['First_Name']; // Add first name to the array
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










<h2>Authors with zero books loaned</h2>
<?php 
$query = "SELECT A.Author_id, A.First_Name, A.Last_Name
FROM Author A
LEFT JOIN Book_Author BA ON A.Author_id = BA.Author_id
LEFT JOIN Loan L ON BA.Book_id = L.Book_id
WHERE L.Loan_id IS NULL";

$stmt = $pdo->prepare($query);
$stmt->execute();
$first_name = array();
$last_name = array();
$number_of_loans=array();

while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
$first_name[] = $row['First_Name']; // Add first name to the array
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


        </body>
        </html>

        <?php
    } else {
        // User is not an admin, return a 403 Forbidden error
        http_response_code(403);
        echo "403 Forbidden";
        exit();
    }
} else {
    // 'username' session variable is not set, redirect to the login page or handle the situation accordingly
    header("Location: login.php");
    exit();
}
?>
