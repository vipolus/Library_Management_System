<?php
require_once('config.php');

// Get the selected author from the AJAX request
$Author_id = $_GET['author'];

try {
    $pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Query to fetch books based on the selected author
    $query = "SELECT b.Title
              FROM Book b
              JOIN Book_Author ba ON b.Book_id = ba.Book_id
              WHERE ba.Author_id = :Author_id";
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':Author_id', $Author_id);
    $stmt->execute();

    $books = $stmt->fetchAll(PDO::FETCH_COLUMN);

    if (!empty($books)) {
        echo "<option value=''>-- Select Book --</option>";

        // Loop through each book and display as list items
        foreach ($books as $book) {
            echo "<option value='" . $book . "'>" . $book . "</option>";
        }
        //echo "</ul>";
    } else {
        echo "<option value=''>-- No Books Found --</option>";
    }
} catch (PDOException $e) {
    echo "<p>Error: " . $e->getMessage() . "</p>";
}

// Close the database connection
$pdo = null;
?>
