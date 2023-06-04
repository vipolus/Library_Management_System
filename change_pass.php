<?php
session_start();
require_once 'config.php';

if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit;
}

$username = $_SESSION['username'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $newPassword = $_POST['new_password'];

    try {
        $pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $hashedPassword = password_hash($newPassword, PASSWORD_DEFAULT);

        $stmt = $pdo->prepare("UPDATE User SET Password = ? WHERE Username = ?");
        $stmt->execute([$hashedPassword, $username]);

        $message = "Change of password was a success!";

                            $jsCode = "alert('" . $message . "');";

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
