<?php
require_once('config.php');

// Start the session
session_start();

// Check if the user is logged in
if (!isset($_SESSION["username"])) {
    echo "User not logged in.";
    exit;
}

// User to search for
$username = $_SESSION["username"];

try {
    // Establish a connection to the database
    $pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Check if the form is submitted for deleting a reservation
    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['reservation_id'])) {
        $reservationId = $_POST['reservation_id'];

        // Delete the reservation from the database
        $stmt = $pdo->prepare("DELETE FROM Reservation WHERE Reservation_id = :reservation_id");
        $stmt->bindParam(':reservation_id', $reservationId);
        $stmt->execute();

        // Decrease the reservations count in the User table
        $stmt = $pdo->prepare("UPDATE User SET reservations = reservations - 1 WHERE Username = :username");
        $stmt->bindParam(':username', $username);
        $stmt->execute();

        // Redirect the user to the same page to refresh the reservation list
        header("Location: ".$_SERVER['PHP_SELF']);
        exit;
    }

    // Prepare and execute the SQL query
    $stmt = $pdo->prepare("SELECT Reservation.Reservation_id, Book.Title
                           FROM Reservation
                           INNER JOIN User ON Reservation.User_id = User.User_id
                           INNER JOIN Book ON Reservation.Book_id = Book.Book_id
                           WHERE User.Username = :username");
    $stmt->bindParam(':username', $username);
    $stmt->execute();

    // Check if any rows are returned
    if ($stmt->rowCount() > 0) {
        // Output the books reserved by the user
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
    // Handle any errors that occurred during the database operation
    echo "Error: " . $e->getMessage();
}

// Close the database connection
$pdo = null;
?>

<script>
function deleteReservation(reservationId) {
    // Confirm with the user before deleting
    if (confirm("Are you sure you want to delete this reservation?")) {
        // Create a form dynamically
        var form = document.createElement("form");
        form.setAttribute("method", "post");
        form.setAttribute("action", "");

        // Create an input field for reservation_id
        var input = document.createElement("input");
        input.setAttribute("type", "hidden");
        input.setAttribute("name", "reservation_id");
        input.setAttribute("value", reservationId);

        // Append the input field to the form
        form.appendChild(input);

        // Append the form to the document body
        document.body.appendChild(form);

        // Submit the form
        form.submit();
    }
}
</script>
