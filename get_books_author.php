<?php
require_once('config.php');

$Author_id = $_GET['author'];

try {
    $pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
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

        foreach ($books as $book) {
            echo "<option value='" . $book . "'>" . $book . "</option>";
        }
    } else {
        echo "<option value=''>-- No Books Found --</option>";
    }
} catch (PDOException $e) {
    echo "<p>Error: " . $e->getMessage() . "</p>";
}

$pdo = null;
?>
