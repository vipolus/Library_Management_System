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
              max-width: 600px;
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

<h2>Search books by category</h2>
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
         $selectedCategory = $_POST['nameSelect'];
        
          if (!empty($names)) {
            ?>
            <table>
                <tr>
                    <th>Teachers</th>
                    <th>Category</th>
                    <th>Authors</th>
                </tr>
               <?php
              $query = "SELECT DISTINCT Author.First_Name, Author.Last_Name, User.username
              FROM Book
              JOIN Book_Author ON Book.Book_id = Book_Author.Book_id
              JOIN Book_Category ON Book_Category.Book_id = Book.Book_id
              JOIN Category ON Book_Category.Category_id = Category.Category_id
              JOIN Copies ON Copies.Book_id = Book.Book_id
              JOIN Loan ON Loan.Book_id = Book.Book_id
              JOIN User ON User.User_id = Loan.User_id
              JOIN School ON School.School_id = User.School_id
              JOIN Author ON Author.Author_id = Book_Author.Author_id
              WHERE Category.Name = :selectedCategory
                AND User.Type = 'Teacher'
                AND Loan.date_borrowed >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
              ";


    
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':selectedCategory', $selectedCategory);
    $stmt->execute();
    $first_name = array();
    $last_name = array();
    $username = array();
   

while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    $first_name[] = $row['First_Name']; // Add first name to the array
    $last_name[] = $row['Last_Name'];
    $username[] = $row['username'];
}

if ($selectedCategory == 'all') {
    // Display all books
    
        for ($i = 0; $i < count($names); $i++) {
            echo '<tr>
                    <td>' .$first_name[$i] .'</td> 
                    <td>' . $names[$i] . '</td>
                    <td>' . $category[$i] . '</td>
                  </tr>';
        }
    
} else {

    // Display books for the selected category
    for ($i = 0; $i < count($names); $i++) {
      if ($category[$i] == $selectedCategory && isset($username[$i], $category[$i]) && isset($first_name[$i])) {
          echo '<tr>
                  <td>' . $username[$i] . '</td>
                  <td>' . $category[$i] . '</td>
                  <td>' . $first_name[$i] .' '. $last_name[$i] . '</td> 
                </tr>';
      } elseif ($category[$i] == $selectedCategory && isset($username[$i], $category[$i])) {
          echo '<tr>
                  <td>' . $username[$i] . '</td>
                  <td>' . $category[$i] . '</td>
                  <td>Unknown</td> 
                </tr>';
      }
  }
  
}


            ?>





            </table>
            <?php
        } else {
            echo "<p>No data available.</p>";
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
