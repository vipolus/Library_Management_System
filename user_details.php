<?php
require_once('config.php');

session_start();
$username = $_SESSION['username'];

// Establish a connection to the database
$pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// Get the user's details and school name from the User and School tables
$stmt = $pdo->prepare("SELECT User.*, School.School_Name FROM User 
                      INNER JOIN School ON User.School_id = School.School_id
                      WHERE User.Username = :username");
$stmt->bindParam(':username', $username);
$stmt->execute();
$user = $stmt->fetch(PDO::FETCH_ASSOC);

// Output the user's details
if ($user) {
    echo "<h1>User Details</h1>";
    echo "<p>Username: " . $user['Username'] . "</p>";
    echo "<p>School Name: " . $user['School_Name'] . "</p>";
    echo "<p>Age: " . $user['Age'] . "</p>";
    echo "<p>First Name: " . $user['First_Name'] . "</p>";
    echo "<p>Last Name: " . $user['Last_Name'] . "</p>";

    // Check if the user has the type "Teacher"
    if ($user['Type'] === "Teacher") {
        // Display the edit link for teachers
        //echo "<p><a href='edit_teacher.php'>Edit Teacher Data</a></p>";
        ?>
        <!DOCTYPE html>
        <html>
        <head>
            <title>Edit Teacher Data</title>
        </head>
        <body>
            <h1>Edit Teacher Data</h1>
            <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                <!-- Display the form fields for editing teacher data -->
                <!-- You can customize the form fields based on your requirements -->
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
        // Check if the form is submitted
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // Retrieve the form fields
            $first_name = $_POST['first_name'];
            $last_name = $_POST['last_name'];
            $age = $_POST['age'];

            // Perform validation and sanitization on the submitted data
            // You should validate and sanitize the data based on your specific requirements

            // Update the teacher's data in the database
            try {
                require_once('config.php');

                // Establish a connection to the database
                $pdo = new PDO("mysql:host=".HOST.";dbname=".DATABASE, USER, PASSWORD);
                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                // Prepare the SQL statement to update the teacher's data
                $stmt = $pdo->prepare("UPDATE User SET First_Name = :first_name, Last_Name = :last_name, Age = :age WHERE Username = :username");

                // Bind the parameters
                $stmt->bindParam(':first_name', $first_name);
                $stmt->bindParam(':last_name', $last_name);
                $stmt->bindParam(':age', $age);
                $stmt->bindParam(':username', $username);

                // Execute the SQL statement
                $stmt->execute();

                // Redirect the user to a success page or display a success message
                // Example: header('Location: success.php');
                exit;
            } catch (PDOException $e) {
                // Handle any errors that occurred during the database operation
                echo "Error: " . $e->getMessage();
                // You can redirect the user to an error page or display an error message
                // Example: header('Location: error.php');
                exit;
            }
        }
    }
    echo "<form method='POST' action='show_books_by_user.php'>";
    echo "<input type='hidden' name='username' value='$username'>";
    echo "<input type='submit' value='Show Books Loaned'>";
    echo "</form>";
} else {
    echo "<p>User not found.</p>";
}
?>
