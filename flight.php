<!DOCTYPE html>
<html>
<head>
    <title>Flights Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        h2 {
            background-color: #007BFF;
            color: #fff;
            padding: 10px;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            background-color: #fff;
            border: 1px solid #ddd;
            margin: 10px;
            padding: 10px;
            border-radius: 5px;
        }
        a {
            display: block;
            text-align: center;
            background-color: #007BFF;
            color: #fff;
            padding: 10px;
            text-decoration: none;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h2>Available Flights</h2>
    <ul>
        <?php
        // Connect to your database
        include 'db_connect.php' ;

        // SQL query to fetch flight details from your database
        $sql = "SELECT Flight_ID, Departure, Arrival, Flight_date FROM Flight";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo "<li>Flight {$row['Flight_ID']} - Departure: {$row['Departure']}, Arrival: {$row['Arrival']}, Date: {$row['Flight_date']}</li>";
            }
        } else {
            echo "<li>No flights available.</li>";
        }

        // Close the database connection
        $conn->close();
        ?>
    </ul>
    <a href="home.php">Back to Home</a>
</body>
</html>
