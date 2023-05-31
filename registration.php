<?php
$DATABASE_HOST = 'localhost';
$DATABASE_USER = 'root';
$DATABASE_PASS = '';
$DATABASE_NAME = 'library_system';
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
	exit('Failed to connect to MySQL: ' . mysqli_connect_error());
}
if (!isset($_POST['username'], $_POST['password'], $_POST['email'])) {
	header("Location: http://localhost/register.php]");
	exit('Please complete the registration form!');
}
if (empty($_POST['username']) || empty($_POST['password']) || empty($_POST['email'])) {
	exit('Please complete the registration form');
}
if ($stmt = $con->prepare('SELECT Username FROM user WHERE Username =? ')) {
	$stmt->bind_param('s', $_POST['username']);
	$stmt->execute();
	$stmt->store_result();
	if ($stmt->num_rows > 0) {
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

if ($stmt = $con->prepare('INSERT INTO user (Username, School_id, Password, Email, Age, First_Name, Last_Name, Type, Borrow_Limit, Number_of_loans, books_taken_total, Delayed_Book, Approved, books_taken_temp) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)')) {
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $stmt->bind_param('sississsiiiibi', $username, $schoolId, $password, $email, $age, $first_name, $last_name, $role, $Borrow_limit, $Number_of_loans, $books_taken_total, $Delayed_Book, $Approved, $books_taken_temp);
    $stmt->execute();
    echo 'You have successfully registered! You can now login!';
    header("Location: http://localhost/index.php");

    

} else {
	echo 'Could not prepare statement!';
}
	}
	$stmt->close();
} else {
	echo 'Could not prepare statement!';
}
$con->close();
?>


