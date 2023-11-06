<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('plane_login.jpeg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-color: rgba(255, 255, 255, 0.5);
            margin: 0;
            color: #333;
            text-align: center;
        }

        .login-box {
            background-color: #f0f0f0;
            border-radius: 10px;
            padding: 20px;
            margin: 100px auto;
            max-width: 400px;
            opacity: 0.9;
            text-align: left;
        }

        label, input[type="text"], input[type="password"] {
            width: calc(100% - 22px);
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            margin-bottom: 10px;
            display: block;
        }

        input[type="submit"], button {
            width: 45%;
            padding: 10px;
            font-size: 20px;
            background-color: #00cc99;
            color: #fff;
            text-decoration: none;
            border-radius: 10px;
            border: none;
            cursor: pointer;
            display: inline-block;
            margin: 0 1%;
            box-sizing: border-box; /* Added */
        }

        button {
            background-color: #009973;
        }

        button:hover {
            background-color: #006544;
        }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>Login</h2>
        <form id="login-form" action="process_login.php" method="POST">
            <!-- Login form fields (username and password) -->
            <label for="username">Username:</label>
            <input type="text" name="username" required><br><br>

            <label for="password">Password:</label>
            <input type="password" name="password" required><br><br>

            <input type="submit" value="Login">
            <a href="registration.html"><button type="button">Register</button></a>
        </form>
    </div>
</body>
</html>
