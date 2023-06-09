
<?php
require_once 'config.php';

$pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


    $Book_id = $_GET["Book_id"];


session_start();
$username = $_SESSION['username'];


$sql = "SELECT Type, School_id, User_id, Delayed_Book FROM User WHERE Username = :username";
$stmt = $pdo->prepare($sql);
$stmt->bindParam(':username', $username);
$stmt->execute();
$result = $stmt->fetch(PDO::FETCH_ASSOC);

    if($result){
    $type = $result['Type'];
    $school_id = $result['School_id'];
    $user_id = $result['User_id'];

    if($type === 'Teacher'&& $result['Delayed_Book'] == 0)
    {
        $sql = "SELECT reservations FROM User WHERE Username = :username";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':username', $username);
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        $reservations = $result['reservations'];
        if($reservations >= 1)
        {
            $message = "No more reservations!"; 

                            $jsCode = "alert('" . $message . "');";

                        echo "<script>" . $jsCode . "</script>";
                        
                       
        }
        else
        {
            
            $sql = "UPDATE Book SET times_requested = times_requested + 1 WHERE Book_id = :Book_id";
            $stmt = $pdo->prepare($sql);
            $stmt->bindParam(':Book_id', $Book_id);
            $stmt->execute();

            $sql = "SELECT * FROM Reservation WHERE User_id = :user_id AND Book_id = :Book_id";
            $stmt = $pdo->prepare($sql);
            $stmt->bindParam(':user_id', $user_id);
            $stmt->bindParam(':Book_id', $Book_id);
            $stmt->execute();
            $existingReservation = $stmt->fetch(PDO::FETCH_ASSOC);

            if (!$existingReservation) {
                $sql = "INSERT INTO Reservation (School_id, User_id, Book_id, date_created, date_expired) 
                        VALUES (:school_id, :user_id, :Book_id, CURRENT_TIMESTAMP, DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 7 DAY))";
                $stmt = $pdo->prepare($sql);
                $stmt->bindParam(':school_id', $school_id);
                $stmt->bindParam(':user_id', $user_id);
                $stmt->bindParam(':Book_id', $Book_id);
                $stmt->execute();
                }
               
            }
            

    }
    else if($type === 'Student'&& $result['Delayed_Book'] == 0)
    {
        $sql = "SELECT reservations FROM User WHERE Username = :username";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':username', $username);
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        $reservations = $result['reservations'];
        if($reservations >= 2 )
        {
            $message = "No more reservations!"; 

            $jsCode = "alert('" . $message . "');";

            echo "<script>" . $jsCode . "</script>";
        }
        else
        {
           
            
            $sql = "SELECT * FROM Reservation WHERE User_id = :user_id AND Book_id = :Book_id";
            $stmt = $pdo->prepare($sql);
            $stmt->bindParam(':user_id', $user_id);
            $stmt->bindParam(':Book_id', $Book_id);
            $stmt->execute();
            $existingReservation = $stmt->fetch(PDO::FETCH_ASSOC);

            if (!$existingReservation) {
                $sql = "INSERT INTO Reservation (School_id, User_id, Book_id, date_created, date_expired) 
                        VALUES (:school_id, :user_id, :Book_id, CURRENT_TIMESTAMP, DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 7 DAY))";
                $stmt = $pdo->prepare($sql);
                $stmt->bindParam(':school_id', $school_id);
                $stmt->bindParam(':user_id', $user_id);
                $stmt->bindParam(':Book_id', $Book_id);
                $stmt->execute();
                }

            $sql = "UPDATE Book SET times_requested = times_requested + 1 WHERE Book_id = :Book_id";
            $stmt = $pdo->prepare($sql);
            $stmt->bindParam(':Book_id', $Book_id);
            $stmt->execute();
            
            }
            

    }
    else if($type === "Library Operator" && $result['Delayed_Book'] == 0)
    {
        $sql = "SELECT reservations FROM User WHERE Username = :username";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':username', $username);
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        $reservations = $result['reservations'];
        if($reservations >= 5 )
        {
            
            $message = "No more reservations!"; 

            
            $jsCode = "alert('" . $message . "');";

            
            echo "<script>" . $jsCode . "</script>";
           

        }
        else
        {
            $sql = "UPDATE User SET reservations = reservations + 1 WHERE Username = :username";
            $stmt = $pdo->prepare($sql);
            $stmt->bindParam(':username', $username);
            $stmt->execute();

            $sql = "UPDATE Book SET times_requested = times_requested + 1 WHERE Book_id = :Book_id";
            $stmt = $pdo->prepare($sql);
            $stmt->bindParam(':Book_id', $Book_id);
            $stmt->execute();

            $sql = "SELECT * FROM Reservation WHERE User_id = :user_id AND Book_id = :Book_id";
            $stmt = $pdo->prepare($sql);
            $stmt->bindParam(':user_id', $user_id);
            $stmt->bindParam(':Book_id', $Book_id);
            $stmt->execute();
            $existingReservation = $stmt->fetch(PDO::FETCH_ASSOC);

            if (!$existingReservation) {
                $sql = "INSERT INTO Reservation (School_id, User_id, Book_id, date_created, date_expired) 
                        VALUES (:school_id, :user_id, :Book_id, CURRENT_TIMESTAMP, DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 7 DAY))";
                $stmt = $pdo->prepare($sql);
                $stmt->bindParam(':school_id', $school_id);
                $stmt->bindParam(':user_id', $user_id);
                $stmt->bindParam(':Book_id', $Book_id);
                $stmt->execute();

            }
        }
        sleep(1);
                        header('Location: Book.php');

    }
}


    



?>