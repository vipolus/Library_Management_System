<?php
require_once('config.php');

// Get the selected category from the AJAX request
$category = $_GET['category'];

try {
    $pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Query to fetch books based on the selected category
    $query = "SELECT Title FROM Book WHERE Thematic_Category = :category";
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':category', $category);
    $stmt->execute();

    $books = $stmt->fetchAll(PDO::FETCH_COLUMN);

    if (!empty($books)) {
        echo "<option value=''>-- Select Book --</option>";
        // Loop through each book and display as options
        foreach ($books as $book) {
            echo "<option value='" . $book . "'>" . $book . "</option>";
            
        }
    } else {
        echo "<option value=''>-- No Books Found --</option>";
    }
} catch (PDOException $e) {
    echo "<option value=''>-- Error: " . $e->getMessage() . " --</option>";
}

// Close the database connection
$pdo = null;
?>
