<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <link rel="stylesheet" type="text/css" href="Static/css/login.css">
<form action="registration.php" method="POST">
  <div class="container">
    <h1>Register</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>
    <label for="username"><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="username" id="username" required>

    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" id="email" required>

    <label for="password"><b>Password</b></label>
    <input type="text" placeholder="Enter Password" name="password" id="password" required>

    <label for="password-repeat"><b>Repeat Password</b></label>
    <input type="text" placeholder="Repeat Password" name="password-repeat" id="password-repeat" required>

    <label for="age"><b>Age</b></label>
    <input type="text" placeholder="Enter your age" name="age" id="age" required>

    <label for="First Name"><b>First Name</b></label>
    <input type="text" placeholder="Enter your First Name" name="First_Name" id="First_Name" required>

    <label for="Last_Name"><b>Last Name</b></label>
    <input type="text" placeholder="Enter your Last Name" name="Last_Name" id="Last_Name" required>

  <?php
    $DATABASE_HOST = 'localhost';
    $DATABASE_USER = 'root';
    $DATABASE_PASS = '';
    $DATABASE_NAME = 'library_system';




    $con = mysqli_connect($DATABASE_HOST, $DATABASE_USER, $DATABASE_PASS, $DATABASE_NAME);


    if (mysqli_connect_errno()) {
	
	exit('Failed to connect to MySQL: ' . mysqli_connect_error());
    }
  $query = "SELECT School_Name FROM school";
  $result = mysqli_query($con,$query);

  $names=array();


while ($row = mysqli_fetch_assoc($result)) {
 $names[]=$row['School_Name'];
}

$options = '';
foreach ($names as $name) {
    $options .= '<option value="' . $name . '">' . $name . '</option>';
}

// Close the database connection
$con->close();

?>

<label for="role">Choose your role:</label>

<select name="role" id="role">
  <option value="Student">Student</option>
  <option value="Teacher">Teacher</option>
  
</select>


<br>
<label for="nameSelect">Choose your School:</label>
<select name="nameSelect" style="width: 100px !important; min-width: 50px; max-width: 100px; height: 20px; font-size: 16px;">
    <!-- Options here -->

    <?php echo $options; ?>
</select>
    <hr>

    <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>
    <button type="submit" class="register">Register</button>
  </div>

  <div class="container signin">
    <p>Already have an account? <a href="#">Sign in</a>.</p>
  </div>
</form>
<html>