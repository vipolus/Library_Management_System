<?php
require_once('Book.php');

    $username = $_SESSION['username'];
    $books_alrd_took='SELECT books_taken_temp FROM User WHERE Username = ?';
    $delayed='SELECT Delayed_Book FROM User WHERE Username = ?';
    
    $user_type='SELECT Type FROM User WHERE Username = ?';
   
    
    if ($user_type == "teacher") {
        $books_alrd_took='SELECT books_taken_temp FROM User WHERE Username = ?';
        $delayed='SELECT Delayed_Book FROM User WHERE Username = ?';
        if($books_alrd_took == 1 || $delayed == TRUE){
            print("Naughty naughty!!");
        }
        else {
            //if(copies avaliable >=1)
            //{
                $sql = "UPDATE User SET books_taken_temp = books_taken_temp + 1 
                WHERE User_id=$user_id";
                $sql = "UPDATE User SET books_taken_total = books_taken_total + 1 
                WHERE User_id=$user_id";
                print("Test");
            //}
            //else
            //{
                
                //reservation_pending make true and plus 1

            //}
        }
    } else {
        #see how many they have right now
        if($books_alrd_took == 2 || $delayed == TRUE){
            print("Naughty naughty!!");
        }
        else{

            //if(copies avaliable >=1)
            //{
                $sql = "UPDATE User SET books_taken_temp = books_taken_temp + 1 
                WHERE User_id=$user_id";
                $sql = "UPDATE User SET books_taken_total = books_taken_total + 1 
                WHERE User_id=$user_id";
                print("Test");
            //}
            //else
            //{
                //reservation_pending make true and plus 1

            //}
            
        }
    }
?>
