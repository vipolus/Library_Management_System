<?php
// Assuming you have already established a database connection

// Check if the user is logged in as an operator
$isOperator = true; // Replace this with your actual operator validation code

require_once 'config.php';
// Get the user's information, such as their user ID

$pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


if (!$isOperator) {
    // Redirect to login page or display an error message
    header("Location: login.php");
    exit();
}


if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Retrieve the form data
    $title = $_POST["title"];
    $publisher = $_POST["publisher"];
    $isbn = $_POST["isbn"];
    $numPages = $_POST["num_pages"];
    $summary = $_POST["summary"];
    $image = $_POST["image"];
    $category = $_POST["category"];
    $language = $_POST["language"];
    $keywords = $_POST["keywords"];
    
    // Perform any necessary data validation here
    
    // Prepare the SQL statement
    $stmt = $pdo->prepare("INSERT INTO Book (Title, Publisher, ISBN, Number_of_Pages, Summary, Image, Thematic_Category, Language, Keywords, times_taken, reviews, last_update) 
                           VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 0, 0, NOW())");
    
    // Bind the parameters
    $stmt->bindParam(1, $title);
    $stmt->bindParam(2, $publisher);
    $stmt->bindParam(3, $isbn);
    $stmt->bindParam(4, $numPages);
    $stmt->bindParam(5, $summary);
    $stmt->bindParam(6, $image);
    $stmt->bindParam(7, $category);
    $stmt->bindParam(8, $language);
    $stmt->bindParam(9, $keywords);
    
    // Execute the statement
    $stmt->execute();

}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Add Book</title>
    <style>
        /* Your CSS styles here */
    </style>
</head>
<body>
    <h1>Add Book</h1>

    <div>
        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required>
            <br>
            <label for="publisher">Publisher:</label>
            <input type="text" id="publisher" name="publisher" required>
            <br>
            <label for="isbn">ISBN:</label>
            <input type="text" id="isbn" name="isbn" required>
            <br>
            <label for="num_pages">Number of Pages:</label>
            <input type="number" id="num_pages" name="num_pages" required>
            <br>
            <label for="summary">Summary:</label>
            <textarea id="summary" name="summary" rows="4" required></textarea>
            <br>
            <label for="image">Image:</label>
            <input type="text" id="image" name="image">
            <br>
            <label for="category">Category:</label>
            <input type="text" id="category" name="category" required>
            <br>
            <label for="language">Language:</label>
            <input type="text" id="language" name="language" required>
            <br>
            <label for="keywords">Keywords:</label>
            <input type="text" id="keywords" name="keywords" required>
            <br>
            <input type="submit" value="Add Book">
        </form>
    </div>

    <!-- Your HTML content for the operator page -->
</body>
</html>
