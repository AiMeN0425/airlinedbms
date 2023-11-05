<!DOCTYPE html>
<html>
<head>
    <title>Home Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('plane_home.jpeg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-color: rgba(255, 255, 255, 0.5);
            margin: 0;
            color: #fff;
            text-align: center;
        }

        .top-bar {
            background-color: #283747;
            padding: 10px;
            margin-bottom: 80px; /* Added margin here */
        }

        .top-bar h1 {
            font-size: 24px;
            margin: 0;
            color: #fff;
        }

        h2 {
            font-size: 45px;
            margin: 20px ;
            color: #283747;
            margin-bottom: 40px; /* Added margin here */
        }

        .welcome-box {
            background-color: rgba(255, 255, 255, 0.5);
            border-radius: 10px;
            padding: 20px;
            display: inline-block;
            margin-bottom: 40px; /* Added margin here */
        }

        .welcome-box h2 {
            margin: 0;
        }

        .info-box {
            background-color: rgba(169, 169, 169, 0.8);
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            margin-bottom: 40px; /* Added margin here */
        }

        .info-box p {
            font-size: 18px;
            margin: 0;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 18px;
            background-color: #00cc99;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            margin-right: 10px;
            width: 100px;
        }
    </style>
</head>
<body>
    <div class="top-bar">
        <h1>Airlines Database Management Project</h1>
    </div>

    <div class="welcome-box">
        <h2>Welcome to the Home Page</h2>
    </div>

    <div class="info-box">
        <p>Explore flights and travel around the world with our Airlines Database Management Project.</p>
    </div>

    <a href="flight.php" class="button">View Flights</a>
    <a href="login.php" class="button">Login</a>
</body>
</html>
