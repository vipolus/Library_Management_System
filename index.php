<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="Static/css/style.css">
    <title>Library Management System</title>
</head>
<body>
   <h1>Welcome to School Library Management System</h1>
   <form action="action_page.php" method="post">
    <style>
        div {
          text-align: center;
        }
      </style>
    <div class="imgcontainer">
      <img src="Templates/Screenshot_3.png" alt="Avatar" class="avatar">
    </div>
  
    <div class="container">
      <label for="uname"><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="uname" required>
  
      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="psw" required>
  
      <button type="submit">Login</button>
      <label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
      </label>
    </div>
  
    <div class="container" style="background-color:#f1f1f1">
      <button type="button" class="cancelbtn">Cancel</button>
      <span class="psw">Forgot <a href="#">password?</a></span>
    </div>
  </form>





</body>
</html>