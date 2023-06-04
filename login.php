<?php
session_start();
require_once 'config.php'; 

if (isset($_SESSION['username'])) {
    header("Location: index.php");
    exit();
}
 
if (isset($_POST['username'], $_POST['password'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $stmt = $connection->prepare('SELECT Username, Password FROM user WHERE Username = ?');
    $stmt->execute([$username]);
    $user = $stmt->fetch();

     
    if ($user) {
        if (password_verify($password, $user['Password'])) {
            $_SESSION['loggedin'] = true;
            $_SESSION['username'] = $user['Username'];

            setcookie('user_session', session_id(), time() + (86400 * 30), '/'); 

            header('Location: index.php');
            exit();
        } else {
            
            echo 'Incorrect username or password!';
        }
    } else {
  
        echo 'Incorrect username or password!';
    }
    echo "<form method='POST' action='register.php'>";
    echo "<input type='submit' value='Register Now!'>";
    echo "</form>";      
}

?>



<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <style>
        .Form{
            margin: auto;
  width: 50%;
  border: 3px solid green;
  padding: 10px;
        }

        </style>
    
    <div class="Form">
    <h1>Login</h1>
    <form action="" method="post">
        <div>
            <label for="username">Username:</label>
            <input type="text" name="username" required>
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" name="password" required>
        </div>
        <div>        
            <input type="submit" value="Login">
            
        </div>
    </form>
    <form method='GET' action='register.php'>
            <input type="submit" value="Register">
            </form>
</div>
</body>
</html>
