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

    $stmt = $pdo->prepare("SELECT Book.Title,Loan.date_borrowed
                           FROM Loan
                           INNER JOIN User ON Loan.User_id = User.User_id
                           INNER JOIN Book ON Loan.Book_id = Book.Book_id
                           WHERE User.Username = :username");
    $stmt->bindParam(':username', $username);
    $stmt->execute();

    ?>
    <style>
      table, th, td {
         border: 1px solid black;
      }
   </style>
    <table>
        <tr>
    <th style="padding:10px">Title</th>
    <th style="padding:10px">Date Borrowed</th>
</tr>
<?php
    if ($stmt->rowCount() > 0) {
        echo "Books loaned by $username:<br>";
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            ?>
            <tr>
          <td><?php echo $row['Title']; ?></td>
          <td><?php echo $row['date_borrowed']; ?></td>
        </tr>
        <?php

        }
    } else {
        echo"No books taken by $username.";
    }
?>
</table>



<?php

} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$pdo = null;
?>
