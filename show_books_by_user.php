<?php
require_once('config.php');

// Start the session
session_start();

// Check if the user is logged in
if (!isset($_SESSION["username"])) {
    echo "User not logged in.";
    exit;
}

// User to search for
$username = $_SESSION["username"];

try {
    // Establish a connection to the database
    $pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Prepare and execute the SQL query
    $stmt = $pdo->prepare("SELECT Book.Title
                           FROM Loan
                           INNER JOIN User ON Loan.User_id = User.User_id
                           INNER JOIN Book ON Loan.Book_id = Book.Book_id
                           WHERE User.Username = :username");
    $stmt->bindParam(':username', $username);
    $stmt->execute();

    // Check if any rows are returned
    if ($stmt->rowCount() > 0) {
        // Output the books loaned by the user
        echo "Books loaned by $username:<br>";
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            echo $row["Title"] . "<br>";
        }
    } else {
        echo "No books taken by $username.";
    }
} catch (PDOException $e) {
    // Handle any errors that occurred during the database operation
    echo "Error: " . $e->getMessage();
}

// Close the database connection
$pdo = null;
?>
