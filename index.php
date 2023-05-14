<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Library Management System</title>
    <link rel="stylesheet" href="Static/css/style.css">
</head>
<body>
    

    <div class="container">
        <div class="top-bar">
        <?php
        require_once('config.php');

        session_start();
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
                <a href="dashboard.php" class="button">Dashboard</a>
            </div>';
        }
else { 
    echo' <div class="buttons">
    <a href="login.php" class="button">Login</a>
    <a href="register.php" class="button">Register</a>
</div>';
}
?>
        </div>
        <div class="sidebar">
            <div class="logo">
                <img src="Templates/Screenshot_3.png" alt="Library Logo">
            </div>
            <nav class="menu">
                <ul>
                    <li><a href="Book.php">Search Book</a></li>
                    <li><a href="Book.php">Lend a Book</a></li>
                    <li><a href="#">Return a Book</a></li>
                    <li><a href="#">Manage Users</a></li>
                    <!-- Add more menu options as needed -->
                </ul>
            </nav>
        </div>
        <div class="main-content">
            <h1>Welcome to the Library Management System</h1>
            <!-- Add your main content here -->
        </div>
    </div>
</body>
</html>

