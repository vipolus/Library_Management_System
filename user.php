<?php
require_once('Book.php');
session_start();
$username = $_SESSION['username'];

    $user_type='SELECT Type FROM User WHERE Username = ?';
    if ($user_type == "teacher") {
        $books_alrd_took='SELECT books_taken_temp FROM User WHERE Username = ?';
        if($books_alrd_took == 1){
            print("Naughty naughty!!");
        }
        else{
            #gotoapprovedloaniguess??
        }
    } else {
        #see how many they have right now
        $books_alrd_took='SELECT books_taken_temp FROM User WHERE Username = ?';
        if($books_alrd_took == 2){
            print("Naughty naughty!!");
        }
        else{
            #gotoapprovedloaniguess??
        }
    }
?>
