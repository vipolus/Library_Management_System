<?php
session_start();
require_once 'config.php';


if (isset($_SESSION['username'])){
    $pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $username = $_SESSION['username'];

    $query = "SELECT u.Username,u.First_Name,u.Last_Name,u.School_id, s.School_Name
    FROM User AS u
    INNER JOIN School AS s
    WHERE Username = :username AND s.School_id=u.School_id";
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':username', $username);
    $stmt->execute();
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

}?>


<style>
    

    .Yolo div {
        text-align: center;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    h1 {
        color: #ff6600;
    }

    p {
        margin: 8px 0;
    }
</style>

<div class="Yolo">
    <div>
        <?php echo "<h1><b>User Details</b></h1>"; ?>
        <?php echo "<p><b>Username:</b><br>" . $user['Username'] . "</p>"; ?>
        <?php echo "<p><b>School Name:</b><br>" . $user['School_Name'] . "</p>"; ?>
        <?php echo "<p><b>First Name:</b><br>" . $user['First_Name'] . "</p>"; ?>
        <?php echo "<p><b>Last Name:</b><br>" . $user['Last_Name'] . "</p>"; ?>
    </div>
    <button onclick="printCard()">Get Library Card</button>

<script>
    function printCard() {
        window.print();
    }
</script>
    

</div>

<button onclick="redirectToUserCard()">Main Page</button>

<script>
    function redirectToUserCard() {
        window.location.href = 'index.php';
    }
</script>