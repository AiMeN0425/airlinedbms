<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
</head>
<body>
    <h2>Login</h2>
    <form id="login-form" action="process_login.php" method="POST">
        <!-- Login form fields (username and password) -->
        <label for="username">Username:</label>
        <input type="text" name="username" required><br><br>

        <label for="password">Password:</label>
        <input type="password" name="password" required><br><br>

        <input type="submit" value="Login">
    </form>

    <!-- Register link styled as a button -->
    <a href="registration.html"><button>Register</button></a>
</body>
</html>
