
<?php
require_once('config.php');

$pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// Get the selected book ID from the POST request
if ($_SERVER['REQUEST_METHOD'] == 'POST')
{   
    $book_id = $_GET["Book_id"];
}

// Update the database table here
// You would need to replace the following line with your own database update code
// Retrieve the username from the session
session_start();
$username = $_SESSION['username'];


//$result = $stmt->fetch(PDO::FETCH_ASSOC);
    $sql = "SELECT Type FROM User WHERE Username = :username";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':username', $username);
    $stmt->execute();
    $result = $stmt->fetch(PDO::FETCH_ASSOC);

    if($result){
        $type = $result['Type'];
        if($type == 'Teacher')
        {
            $sql = "SELECT reservations FROM User WHERE Username = :username";
            $stmt = $pdo->prepare($sql);
            $stmt->bindParam(':username', $username);
            $stmt->execute();
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            $reservations = $result['reservations'];
            if($reservations >= 1 )
            {
                alert('beware');
            }
            else
            {
                // Update the User table based on the username and book_id
                $sql = "UPDATE User SET reservations = reservations + 1 WHERE Username = :username";
                $stmt = $pdo->prepare($sql);
                $stmt->bindParam(':username', $username);
                $stmt->execute();

                $sql = "UPDATE Book SET times_requested = times_requested + 1 WHERE Book_id = :book_id";
                $stmt = $pdo->prepare($sql);
                $stmt->bindParam(':book_id', $book_id);
                $stmt->execute();

                $sql = "UPDATE Copies SET Number_of_Available_Copies = Number_of_Available_Copies - 1 WHERE Book_id = :book_id";
                $stmt = $pdo->prepare($sql);
                $stmt->bindParam(':book_id', $book_id);
                $stmt->execute();

            }

        }
        else if($type == 'Student')
        {
            $sql = "SELECT reservations FROM User WHERE Username = :username";
            $stmt = $pdo->prepare($sql);
            $stmt->bindParam(':username', $username);
            $stmt->execute();
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            $reservations = $result['reservations'];
            if($reservations => 2 )
            {
                alert('beware');
            }
            else
            {
                // Update the User table based on the username and book_id
                $sql = "UPDATE User SET reservations = reservations + 1 WHERE Username = :username";
                $stmt = $pdo->prepare($sql);
                $stmt->bindParam(':username', $username);
                $stmt->execute();

                $sql = "UPDATE Book SET times_requested = times_requested + 1 WHERE Book_id = :book_id";
                $stmt = $pdo->prepare($sql);
                $stmt->bindParam(':book_id', $book_id);
                $stmt->execute();

                $sql = "UPDATE Copies SET Number_of_Available_Copies = Number_of_Available_Copies - 1 WHERE Book_id = :book_id";
                $stmt = $pdo->prepare($sql);
                $stmt->bindParam(':book_id', $book_id);
                $stmt->execute();
            }
    }
   

    
    }
    $userId = $_SESSION['username'];

    $query = "SELECT Type,School_id,Approved FROM User WHERE Username = :username";
    $userStmt = $pdo->prepare($query);
    $userStmt->bindParam(':username', $userId);
    $userStmt->execute();
    $user = $userStmt->fetch(PDO::FETCH_ASSOC);

    // Check if the user is a library operator or admin


    if (($user['Type'] === 'Library Operator' || $user['Type'] === 'Admin') && $user['Approved'] )
    $isLibraryOperator = true;
    else $isLibraryOperator = false;
    if($isLibraryOperator)
    {
        $sql = "SELECT reservations FROM User WHERE Username = :username";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':username', $username);
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        $reservations = $result['reservations'];
        if($reservations => 2 )
        {
            alert('beware');
        }
        else
        {
            // Update the User table based on the username and book_id
            $sql = "UPDATE User SET reservations = reservations + 1 WHERE Username = :username";
            $stmt = $pdo->prepare($sql);
            $stmt->bindParam(':username', $username);
            $stmt->execute();

            $sql = "UPDATE Book SET times_requested = times_requested + 1 WHERE Book_id = :book_id";
            $stmt = $pdo->prepare($sql);
            $stmt->bindParam(':book_id', $book_id);
            $stmt->execute();

            $sql = "UPDATE Copies SET Number_of_Available_Copies = Number_of_Available_Copies - 1 WHERE Book_id = :book_id";
            $stmt = $pdo->prepare($sql);
            $stmt->bindParam(':book_id', $book_id);
            $stmt->execute();
        }

    }


    //$result = $stmt->fetch(PDO::FETCH_ASSOC);


if (mysqli_query($conn, $sql)) {
    // Return a success message to the client
    alert ("Book lent successfully!");
} else {
    // Return an error message to the client
    alert ("Error updating book: ");
}

// Close the database connection
mysqli_close($conn);
?>