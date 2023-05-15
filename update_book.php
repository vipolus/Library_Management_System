
<?php

require_once("Book.php");
//session_start();
//alert("hello4");
// Get the selected book ID from the POST request
//if ($_SERVER['REQUEST_METHOD'] === 'POST')
    $book_id = $_POST["Book_id"];

//alert("hello");
// Update the database table here
// You would need to replace the following line with your own database update code
$pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$sql = "UPDATE Book SET times_taken = times_taken + 1 WHERE Book_id = :book_id";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':book_id', $book_id);
    $stmt->execute();


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