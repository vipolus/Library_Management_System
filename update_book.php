
<?php
require_once("Book.php");
//session_start();
alert("hello4");
// Get the selected book ID from the POST request
$book_id = $_POST["Book_id"];
alert("hello");
// Update the database table here
// You would need to replace the following line with your own database update code
$sql = "UPDATE Book SET times_taken = times_take + 1 WHERE Book_id = $book_id";

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