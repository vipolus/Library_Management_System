<?php
// Assuming you have already established a database connection
session_start();
require_once 'config.php';
// Get the user's information, such as their user ID

$pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$username = $_SESSION['username']; // Assuming you have a session variable storing the username

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
    <p>
      <a class="button" href="manage-users.php">Manage Users</a>
      <a class="button" href="manage-books.php">Manage Books</a>
      <a class="button" href="logout.php">Logout</a>
    </p>
    <h2>Total Loans by School</h2>
    <?php
    // Assuming you have established a database connection and executed the query to fetch the data
    // $loansData contains the fetched data from the database
    $query = "SELECT * FROM School";
    $stmt = $pdo->prepare($query);
    $stmt->execute();
    
    // Fetch the result
    $school = $stmt->fetch(PDO::FETCH_ASSOC);
    echo $school['times_loaned'];
    // Example data
   
    ?>
    <?php if (!empty($loansData)) : ?>
      <table>
        <tr>
          <th>School</th>
          <th>Total Loans</th>
        </tr>
        <?php foreach ($loansData as $data) : ?>
          <tr>
            <td><?php echo $data[0]; ?></td>
            <td><?php echo $data[1]; ?></td>
          </tr>
        <?php endforeach; ?>
      </table>
    <?php else : ?>
      <p>No data available.</p>
    <?php endif; ?>
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
?>