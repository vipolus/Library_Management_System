<?php
require_once('config.php');

$pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$bookId = $_GET['Book_id'];

$sql = 'SELECT Rating, Text FROM Review WHERE Book_id = ?';

$stmt = $pdo->prepare($sql);
$stmt->bindParam(1, $bookId, PDO::PARAM_INT);
$stmt->execute();

$reviews = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($reviews);

$stmt = null;
$pdo = null;
?>