<?php
// Database credentials
$host = 'localhost';
$dbName = 'library_system';
$username = 'your_username';
$password = 'your_password';

try {
    // Establish the database connection
    $pdo = new PDO("mysql:host=$host;dbname=$dbName", $username, $password);

    // Set PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


// Assuming you have established the database connection


$sevenDaysAgo = date('Y-m-d H:i:s', strtotime('-7 days'));

/*$sql = "UPDATE Reservation 
        SET date_created = CURRENT_TIMESTAMP 
        WHERE date_created <= :seven_days_ago";

$stmt = $pdo->prepare($sql);
$stmt->bindParam(':seven_days_ago', $sevenDaysAgo);
$stmt->execute();*/

$count = $stmt->rowCount();

if ($count > 0) {
    $sql = "UPDATE User 
            SET reservations = reservations - 1 
            WHERE User_id IN (
                SELECT User_id 
                FROM Reservation 
                WHERE date_created <= :seven_days_ago
            )";

    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':seven_days_ago', $sevenDaysAgo);
    $stmt->execute();
}

} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
    exit;
}
?>
