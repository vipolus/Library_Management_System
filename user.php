<?php
require_once('Book.php');
session_start();
    $user_type='SELECT Type FROM user WHERE Username = ?';
    if ($user_type == "teacher") {
        
    } else {
        
    }
?>
