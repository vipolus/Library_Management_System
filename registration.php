<?php
// Change this to your connection info.
$DATABASE_HOST = 'localhost';
$DATABASE_USER = 'root';
$DATABASE_PASS = '';
$DATABASE_NAME = 'library_system';
// Try and connect using the info above.
$con = mysqli_connect($DATABASE_HOST, $DATABASE_USER, $DATABASE_PASS, $DATABASE_NAME);

$username=$_POST['username'];
$password=$_POST['password'];
$email=$_POST['email'];
$last_name=$_POST['Last_Name'];
$first_name=$_POST['First_Name'];
$yob=$_POST['yob'];
$year = date("Y");
$age = $year-$yob;
$password_repeat=$_POST['password-repeat'];
$school=$_POST['nameSelect'];
$role=$_POST['role'];
$Number_of_loans=0;
$books_taken_total=0;
$Delayed_Book=0;
$Approved=FALSE;
$books_taken_temp=0;

if (mysqli_connect_errno()) {
	// If there is an error with the connection, stop the script and display the error.
	exit('Failed to connect to MySQL: ' . mysqli_connect_error());
}
// Now we check if the data was submitted, isset() function will check if the data exists.
if (!isset($_POST['username'], $_POST['password'], $_POST['email'])) {
	// Could not get the data that should have been sent.
	header("Location: http://localhost/register.php]");
	exit('Please complete the registration form!');
}
// Make sure the submitted registration values are not empty.
if (empty($_POST['username']) || empty($_POST['password']) || empty($_POST['email'])) {
	// One or more values are empty.
	exit('Please complete the registration form');
}
// We need to check if the account with that username exists.
if ($stmt = $con->prepare('SELECT Username FROM user WHERE Username =? ')) {
	// Bind parameters (s = string, i = int, b = blob, etc), hash the password using the PHP password_hash function.
	$stmt->bind_param('s', $_POST['username']);
	$stmt->execute();
	$stmt->store_result();
	// Store the result so we can check if the account exists in the database.
	if ($stmt->num_rows > 0) {
		// Username already exists
		echo 'Username exists, please choose another!';
	} else {
		if($role=='Student')
		{
			$Borrow_limit=2;


		}
		else $Borrow_limit=1;

		$query = "SELECT School_id FROM school WHERE School_Name = ?";
		$stmt = $con->prepare($query);
		$stmt->bind_param('s', $school);
		$stmt->execute();
		$stmt->bind_result($schoolId);
		$stmt->fetch();
		$stmt->close();
		// Username doesn't exists, insert new account
        if ($stmt = $con->prepare('INSERT INTO user (Username,School_id, Password, Email,Age,First_Name,Last_Name,Type,Borrow_Limit,Number_of_loans,books_taken_total,Delayed_Book,Approved,books_taken_temp) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)')) {
	// We do not want to expose passwords in our database, so hash the password and use password_verify when a user logs in.
	        $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
	        $stmt->bind_param('sississsiiiibi',$username,$schoolId,$password,$email,$age,$first_name,$last_name,$role,$Borrow_limit,$Number_of_loans,$books_taken_total,$Delayed_Book,$Approved,$books_taken_temp);
	        $stmt->execute();
	        echo 'You have successfully registered! You can now login!';
			header("Location: http://localhost/index.php");

} else {
	// Something is wrong with the SQL statement, so you must check to make sure your accounts table exists with all 3 fields.
	echo 'Could not prepare statement!';
}
	}
	$stmt->close();
} else {
	// Something is wrong with the SQL statement, so you must check to make sure your accounts table exists with all 3 fields.
	echo 'Could not prepare statement!';
}
$con->close();
?>


