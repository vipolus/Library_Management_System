<?php
require_once('config.php');

session_start();
$username = $_SESSION['username'];

$pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$stmt = $pdo->prepare("SELECT User.*, School.School_Name FROM User 
INNER JOIN School ON User.School_id = School.School_id
WHERE User.Username = :username");
$stmt->bindParam(':username', $username);
$stmt->execute();
$user = $stmt->fetch(PDO::FETCH_ASSOC);

if ($user) {
    echo "<h1>User Details</h1>";
    echo "<p>Username: " . $user['Username'] . "</p>";
    echo "<p>School Name: " . $user['School_Name'] . "</p>";
    echo "<p>Age: " . $user['Age'] . "</p>";
    echo "<p>First Name: " . $user['First_Name'] . "</p>";
    echo "<p>Last Name: " . $user['Last_Name'] . "</p>";
    echo "<a href='change_pass.php'><button>Change Password</button></a>";

    if ($user['Type'] === "Teacher") {
       
        echo "<a href='change_pass.php'><button>Change Password</button></a>";

        ?>
        <!DOCTYPE html>
        <html>
        <head>
            <title>Edit Teacher Data</title>
        </head>
        <body>
            <h1>Edit Teacher Data</h1>
            <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
              
                <label for="first_name">First Name:</label>
                <input type="text" name="first_name" id="first_name" required value="<?php echo htmlspecialchars($user['First_Name']); ?>">

                <label for="last_name">Last Name:</label>
                <input type="text" name="last_name" id="last_name" required value="<?php echo htmlspecialchars($user['Last_Name']); ?>">

                <label for="age">Age:</label>
                <input type="number" name="age" id="age" required value="<?php echo htmlspecialchars($user['Age']); ?>"> 
                 
                <input type="submit" value="Update">
                
            </form>
        </body>
        </html>
        <?php
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $first_name = $_POST['first_name'];
            $last_name = $_POST['last_name'];
            $age = $_POST['age'];
            header('Location: http://localhost/index.php');


            try {
                require_once('config.php');

                $pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                $stmt = $pdo->prepare("UPDATE User SET First_Name = :first_name, Last_Name = :last_name, Age = :age WHERE Username = :username");

                $stmt->bindParam(':first_name', $first_name);
                $stmt->bindParam(':last_name', $last_name);
                $stmt->bindParam(':age', $age);
                $stmt->bindParam(':username', $username);

                $stmt->execute();

                exit;
            } catch (PDOException $e) {
                echo "Error: " . $e->getMessage();
                
                exit;
            }

        }
    }
    if ($user['Type'] === "Library Operator") {
       

        ?>
        <!DOCTYPE html>
        <html>
        <head>
            <title>Edit Library Operator Data</title>
        </head>
        <body>
            <h1>Edit Library Operator Data</h1>
            <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                
                <label for="first_name">First Name:</label>
                <input type="text" name="first_name" id="first_name" required value="<?php echo htmlspecialchars($user['First_Name']); ?>">

                <label for="last_name">Last Name:</label>
                <input type="text" name="last_name" id="last_name" required value="<?php echo htmlspecialchars($user['Last_Name']); ?>">

                <label for="age">Age:</label>
                <input type="number" name="age" id="age" required value="<?php echo htmlspecialchars($user['Age']); ?>"> 
                
            
                <input type="submit" value="Update">
                


                
            </form>
        </body>
        </html>
        <?php
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $first_name = $_POST['first_name'];
            $last_name = $_POST['last_name'];
            $age = $_POST['age'];
            header('Location: http://localhost/index.php');

        
            try {
                require_once('config.php');

                $pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                $stmt = $pdo->prepare("UPDATE User SET First_Name = :first_name, Last_Name = :last_name, Age = :age WHERE Username = :username");

                $stmt->bindParam(':first_name', $first_name);
                $stmt->bindParam(':last_name', $last_name);
                $stmt->bindParam(':age', $age);
                $stmt->bindParam(':username', $username);

                $stmt->execute();

              
                exit;
            } catch (PDOException $e) {
                echo "Error: " . $e->getMessage();
                
                exit;
            }
        }
    }
    if ($user['Type'] === "Admin") {
        
        ?>
        <!DOCTYPE html>
        <html>
        <head>
            <title>Edit Admin Data</title>
        </head>
        <body>
            <h1>Edit Admin Data</h1>
            <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
               
                <label for="first_name">First Name:</label>
                <input type="text" name="first_name" id="first_name" required value="<?php echo htmlspecialchars($user['First_Name']); ?>">

                <label for="last_name">Last Name:</label>
                <input type="text" name="last_name" id="last_name" required value="<?php echo htmlspecialchars($user['Last_Name']); ?>">

                <label for="age">Age:</label>
                <input type="number" name="age" id="age" required value="<?php echo htmlspecialchars($user['Age']); ?>"> 
                
                <input type="submit" value="Update">
            </form>
        </body>
        </html>
        <?php
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $first_name = $_POST['first_name'];
            $last_name = $_POST['last_name'];
            $age = $_POST['age'];
            header('Location: http://localhost/index.php');

         
            try {
                require_once('config.php');

                $pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                $stmt = $pdo->prepare("UPDATE User SET First_Name = :first_name, Last_Name = :last_name, Age = :age WHERE Username = :username");

                $stmt->bindParam(':first_name', $first_name);
                $stmt->bindParam(':last_name', $last_name);
                $stmt->bindParam(':age', $age);
                $stmt->bindParam(':username', $username);

                $stmt->execute();

            
                exit;
            } catch (PDOException $e) {
                echo "Error: " . $e->getMessage();
              
                exit;
            }

        }
    }
    
    echo "<form method='POST' action='show_books_by_user.php'>";
    echo "<input type='hidden' name='username' value='$username'>";
    echo "<input type='submit' value='Show Books Loaned'>";
    echo "</form>";
    
    echo "<form method='POST' action='reservations.php'>";
    echo "<input type='hidden' name='username' value='$username'>";
    echo "<input type='submit' value='Show Books Reserved'>";
    echo "</form>";
} else {
    echo "<p>User not found.</p>";
}
?>

<button onclick="redirectToUserCard()">Print Library Card</button>

    <script>
        function redirectToUserCard() {
            window.location.href = 'User_card.php';
        }
    </script>

