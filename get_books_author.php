<?php
require_once('config.php');

// Get the selected author from the AJAX request
$authorId = $_GET['Author_id'];

try {
    $pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Query to fetch books based on the selected author
    $query = "SELECT b.Title
              FROM Book b
              JOIN Book_Author ba ON b.Book_id = ba.Book_id
              WHERE ba.Author_id = :authorId";
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':authorId', $authorId);
    $stmt->execute();

    $books = $stmt->fetchAll(PDO::FETCH_COLUMN);

    if (!empty($books)) {
        echo "<h10>Books by the selected author:</h10>";
        echo "<ul>";
        // Loop through each book and display as list items
        foreach ($books as $book) {
            echo "<li>" . $book . "</li>";
        }
        echo "</ul>";
    } else {
        echo "<p>No books found for the selected author.</p>";
    }
} catch (PDOException $e) {
    echo "<p>Error: " . $e->getMessage() . "</p>";
}

// Close the database connection
$pdo = null;
?>
