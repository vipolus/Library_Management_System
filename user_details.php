<?php
require_once('config.php');

session_start();
$username = $_SESSION['username'];

// Establish a connection to the database
$pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// Get the user's details and school name from the User and School tables
$stmt = $pdo->prepare("SELECT User.*, School.School_Name FROM User 
                      INNER JOIN School ON User.School_id = School.School_id
                      WHERE User.Username = :username");
$stmt->bindParam(':username', $username);
$stmt->execute();
$user = $stmt->fetch(PDO::FETCH_ASSOC);

// Output the user's details
if ($user) {
    echo "<h1>User Details</h1>";
    echo "<p>Username: " . $user['Username'] . "</p>";
    echo "<p>School Name: " . $user['School_Name'] . "</p>";
    echo "<p>Age: " . $user['Age'] . "</p>";
    echo "<p>First Name: " . $user['First_Name'] . "</p>";
    echo "<p>Last Name: " . $user['Last_Name'] . "</p>";

    // Check if the user has the type "Teacher"
    if ($user['Type'] === "Teacher") {
        // Display the edit link for teachers
        echo "<p><a href='edit_teacher.php'>Edit Teacher Data</a></p>";
    }
} else {
    echo "<p>User not found.</p>";
}
?>
