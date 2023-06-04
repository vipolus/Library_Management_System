<?php
$host = 'localhost';
$dbName = 'library_system';
$username = 'your_username';
$password = 'your_password';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbName", $username, $password);

    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);




$sevenDaysAgo = date('Y-m-d H:i:s', strtotime('-7 days'));


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
