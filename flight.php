<!DOCTYPE html>
<html>
<head>
    <title>Flights Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('availablrflights.jpg');
            background-size: cover;
            background-attachment: fixed;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        h2 {
            background-color: rgba(0, 64, 133, 0.8); /* Slight grey-blue color with 80% transparency */
            color: #fff;
            padding: 10px;
            text-align: center;
            font-size: 36px;
            margin-bottom: 20px;
        }
        ul {
            list-style-type: none;
            padding: 0;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }
        li {
            background-color: rgba(255, 255, 255, 0.92); /* Slight grey with 80% transparency */
            border: 1px solid #ddd;
            margin: 10px;
            padding: 10px;
            border-radius: 5px;
            width: 45%;
        }
        a {
            display: block;
            text-align: center;
            background-color: rgba(0, 64, 133, 0.8); /* Slight grey-blue color with 80% transparency */
            color: #fff;
            padding: 10px;
            text-decoration: none;
            margin-top: 20px; /* Add some space above */
            display: inline-block; /* Make the link a block element */
            width: 100%; /* Take full width of container */
            border-radius: 5px;
        }
        a:hover {
            background-color: rgba(0, 86, 179, 0.8); /* Darker shade on hover */
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
