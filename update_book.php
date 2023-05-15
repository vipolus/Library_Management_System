
<?php
require_once 'config.php';

$pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// Get the selected book ID from the POST request
if ($_SERVER['REQUEST_METHOD'] === 'POST')
{   $book_id = $_GET["Book_id"];
}
// Update the database table here
// You would need to replace the following line with your own database update code


$sql = "UPDATE Book SET times_taken = times_taken + 1 WHERE Book_id = :book_id";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':book_id', $book_id);
    $stmt->execute();
    $result = $stmt->fetch(PDO::FETCH_ASSOC);


if (mysqli_query($conn, $sql)) {
    // Return a success message to the client
    echo "Book lent successfully!";
} else {
    // Return an error message to the client
    echo "Error updating book: " . mysqli_error($conn);
}

// Close the database connection
mysqli_close($conn);
?>