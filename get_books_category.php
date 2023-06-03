<?php
require_once('config.php');

$category = $_GET['category'];
//$username = $_GET['username'];


try {
    $pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);

    $cat_id="SELECT Category_id FROM Category WHERE Name=:category";
    $cat_idstmt=$pdo->prepare($cat_id);
    $cat_idstmt->bindparam(':category',$category);
    $cat_idstmt->execute();
    $cat_id=$cat_idstmt->fetch(PDO::FETCH_COLUMN);


/*
//$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$schoolid = "SELECT School_id FROM User WHERE Username=:username";
$schoolidstmt = $pdo->prepare($schoolid);
$schoolidstmt->bindParam(':username', $username);
$schoolidstmt->execute();
$sch_id = $schoolidstmt->fetch(PDO::FETCH_COLUMN);
*/

$query = "SELECT DISTINCT Title FROM Book 
            INNER JOIN Book_Category ON Book.Book_id=Book_Category.Book_id
            WHERE Book_Category.Category_id=:category
            ";

$stmt = $pdo->prepare($query);
//$stmt->bindParam(':schoolId', $sch_id);
$stmt->bindParam(':category', $cat_id);
$stmt->execute();
$books = $stmt->fetchAll(PDO::FETCH_COLUMN);

    if (!empty($books)) {
        echo "<option value=''>-- Books listed --</option>";
        foreach ($books as $book) {
            echo "<option value='" . $book . "'>" . $book . "</option>";
            
        }
    } else {
        echo "<option value='" . $cat_id . "'>" . $cat_id . "</option>";

        echo "<option value=''>-- No Books Found --</option>";
    }
} catch (PDOException $e) {
    echo "<option value=''>-- Error: " . $e->getMessage() . " --</option>";
}

$pdo = null;
?>
