
<?php
require_once 'config.php';

$pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// Get the selected book ID from the POST request
if ($_SERVER['REQUEST_METHOD'] === 'POST')
{   
    $book_id = $_GET["Book_id"];
}
// Update the database table here
// You would need to replace the following line with your own database update code
// Retrieve the username from the session
session_start();
$username = $_SESSION['username'];

// Update the User table based on the username and book_id
$sql = "UPDATE User SET reservations = reservations + 1 WHERE Username = :username";
$stmt = $pdo->prepare($sql);
$stmt->bindParam(':username', $username);
$stmt->execute();

$sql = "UPDATE Book SET times_requested = times_requested + 1 WHERE Book_id = :book_id";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':book_id', $book_id);
    $stmt->execute();
    $result = $stmt->fetch(PDO::FETCH_ASSOC);


if (mysqli_query($conn, $sql)) {
    // Return a success message to the client
    alert ("Book lent successfully!");
} else {
    // Return an error message to the client
    alert ("Error updating book: ");
}

// Close the database connection
mysqli_close($conn);
?>