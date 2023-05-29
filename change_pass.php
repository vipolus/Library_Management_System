<?php
session_start();
require_once 'config.php';

// Check if the user is logged in
if (!isset($_SESSION['username'])) {
    // Redirect the user or show an error message
    header("Location: login.php");
    exit;
}

// Get the username from the session
$username = $_SESSION['username'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Process the form submission
    $newPassword = $_POST['new_password'];

    try {
        // Update the user's password in the database
        $pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Hash the new password
        $hashedPassword = password_hash($newPassword, PASSWORD_DEFAULT);

        // Update the password for the user
        $stmt = $pdo->prepare("UPDATE User SET Password = ? WHERE Username = ?");
        $stmt->execute([$hashedPassword, $username]);

        // Redirect the user to a success page or show a success message
        $message = "Change of password was a success!"; // The message you want to display

            // Generate JavaScript code to display the alert
                            $jsCode = "alert('" . $message . "');";

            // Output the JavaScript code within a script tag
                        echo "<script>" . $jsCode . "</script>";
        header("Location: index.php");
        exit;
    } catch (PDOException $e) {
        exit("Error: " . $e->getMessage());
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Change Password</title>
</head>
<body>
    <h1>Change Password</h1>
    <form method="POST" action="">
        <label for="new_password">New Password:</label>
        <input type="password" id="new_password" name="new_password" required>
        <br>
        <input type="submit" value="Change Password">
    </form>
</body>
</html>
