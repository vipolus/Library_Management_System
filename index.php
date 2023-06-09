<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Library Management System</title>
    <link rel="stylesheet" href="Static/css/style.css">
</head>
<body>
 

<div class="main-content">
            <h1>Welcome to the Library Management System</h1>
            
        </div>

    <div class="container">
        <div class="top-bar">
        <?php
        require_once('config.php');

        session_start();
        if (!isset($_SESSION['username'])) {
            header("Location: login.php");
            exit;
        }
        $pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        
            $username = $_SESSION['username'];
            $sql='SELECT Type FROM user WHERE username=?';
            $stmt = $pdo->prepare($sql);
       $stmt->bindParam(1, $username, PDO::PARAM_STR);
       $stmt->execute();
       
       $row = $stmt->fetch(PDO::FETCH_ASSOC);
    
            if($row['Type']=='Admin')
           { echo'<div class="buttons">
                <a href="login.php" class="button">Login</a>
                <a href="register.php" class="button">Register</a>
                <a href="lib_operator.php" class="button">Operator Panel</a>
                <a href="dashboard.php" class="button">Dashboard</a>
            </div>';
        }
elseif ($row['Type']=='Library Operator') { 
    echo' <div class="buttons">
    <a href="login.php" class="button">Login</a>
    <a href="register.php" class="button">Register</a>
    <a href="lib_operator.php" class="button">Operator Panel</a>

</div>';
}

else {
    echo '<div class="buttons">
        <a href="login.php" class="button">Login</a>
        <a href="register.php" class="button">Register</a>
    </div>';
}

if (isset($_POST['logout'])) {
    $_SESSION = array();

    if (isset($_COOKIE[session_name()])) {
        setcookie(session_name(), '', time() - 3600, '/');
    }

    session_destroy();

    header('Location: login.php');
    exit;
}
?>
<form method="post">
            <button type="submit" name="logout" class="button">Logout</button>
        </form>
        </div>

        


            <div style="text-align: center;">

            <img width="400" src="Templates/Photo_lib.png">

            </div>
            <nav class="menu">
                <ul>
                    <li><a href="Book.php">Search\Borrow\Review a Book!</a></li>
                    <li><a href="user_details.php">Show user's details!</a></li>

                    <!-- Add more menu options as needed -->
                </ul>
            </nav>
        </div>
        
    </div>
</body>
</html>

