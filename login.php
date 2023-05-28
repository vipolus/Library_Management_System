<?php
session_start();
require_once 'config.php'; // Include the database configuration file

if (isset($_POST['username'], $_POST['password'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Prepare the SQL statement
    $stmt = $connection->prepare('SELECT Username, Password FROM user WHERE Username = ?');
    $stmt->execute([$username]);
    $user = $stmt->fetch();

    if ($user) {
        // Verify the password
        if (password_verify($password, $user['Password'])) {
            // Password is correct, create a session
            $_SESSION['loggedin'] = true;
            $_SESSION['username'] = $user['Username'];

            // Set a session cookie for the user
            setcookie('user_session', session_id(), time() + (86400 * 30), '/'); // Cookie expires in 30 days

            // Redirect the user to the home page or any other authenticated page
            header('Location: index.php');
            $userID = $_SESSION['user_id']; // Replace with the appropriate way to get the user ID

        // Step 2: Fetch the reservations associated with the user
        $sql = "SELECT Reservation_id, date_created
                FROM Reservation
                WHERE User_id = :user_id";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':user_id', $userID);
        $stmt->execute();
        $reservations = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Step 3: Check if the specified number of days has passed for each reservation
        $daysThreshold = 7; // Number of days to check
        $currentDate = new DateTime();
        foreach ($reservations as $reservation) {
            $reservationDate = new DateTime($reservation['date_created']);
            $daysPassed = $currentDate->diff($reservationDate)->days;

            // Step 4: If the condition is met, update the user's reservation count
            if ($daysPassed >= $daysThreshold) {
                $sql = "UPDATE User
                        SET reservations = reservations - 1
                        WHERE User_id = :user_id";
                $stmt = $pdo->prepare($sql);
                $stmt->bindParam(':user_id', $userID);
                $stmt->execute();
            }
        }
            exit();
        } else {
            //echo $password;
            //echo $user['Password'];
            // Incorrect password
            echo 'Incorrect username or password!';
        }
    } else {
        // Incorrect username
        echo 'Incorrect username or password!';
    }
}
?>


<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h1>Login</h1>
    <form action="" method="post">
        <div>
            <label for="username">Username:</label>
            <input type="text" name="username" required>
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" name="password" required>
        </div>
        <div>
            <input type="submit" value="Login">
        </div>
    </form>
</body>
</html>
