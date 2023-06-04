<?php
require_once('config.php');

session_start();

if (!isset($_SESSION["username"])) {
    echo "User not logged in.";
    exit;
}

$username = $_SESSION["username"];

try {
    $pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['reservation_id'])) {
        $reservationId = $_POST['reservation_id'];

        $stmt = $pdo->prepare("DELETE FROM Reservation WHERE Reservation_id = :reservation_id");
        $stmt->bindParam(':reservation_id', $reservationId);
        $stmt->execute();

        $stmt = $pdo->prepare("UPDATE User SET reservations = reservations - 1 WHERE Username = :username");
        $stmt->bindParam(':username', $username);
        $stmt->execute();

        header("Location: ".$_SERVER['PHP_SELF']);
        exit;
    }

    $stmt = $pdo->prepare("SELECT Reservation.Reservation_id, Book.Title
                           FROM Reservation
                           INNER JOIN User ON Reservation.User_id = User.User_id
                           INNER JOIN Book ON Reservation.Book_id = Book.Book_id
                           WHERE User.Username = :username AND Reservation.Approved = 0");
    $stmt->bindParam(':username', $username);
    $stmt->execute();

    if ($stmt->rowCount() > 0) {
        echo "Books reserved by $username:<br>";
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $reservationId = $row["Reservation_id"];
            $title = $row["Title"];
            echo "$title <button onclick='deleteReservation($reservationId)'>Delete</button><br>";
        }
    } else {
        echo "No books reserved by $username.";
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$pdo = null;
?>

<script>
function deleteReservation(reservationId) {
    if (confirm("Are you sure you want to delete this reservation?")) {
        var form = document.createElement("form");
        form.setAttribute("method", "post");
        form.setAttribute("action", "");

        var input = document.createElement("input");
        input.setAttribute("type", "hidden");
        input.setAttribute("name", "reservation_id");
        input.setAttribute("value", reservationId);

        form.appendChild(input);

        document.body.appendChild(form);

        form.submit();
    }
}
</script>
