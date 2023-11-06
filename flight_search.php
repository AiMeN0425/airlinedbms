
<?php
// Connect to the database (You can include your db_connect.php here)
include 'db_connect.php';

// Retrieve user input
$departure = $_POST['departure'];
$arrival = $_POST['arrival'];
$date = $_POST['date'];

// Query the database for available flights
$sql = "SELECT Flight_ID, Departure, Arrival, Flight_date FROM Flight 
        WHERE Departure = ? AND Arrival = ? AND Flight_date = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param('sss', $departure, $arrival, $date);
$stmt->execute();
$stmt->bind_result($flight_id, $departure, $arrival, $flight_date);

// Display the list of available flights
while ($stmt->fetch()) {
    echo "Flight ID: $flight_id, Departure: $departure, Arrival: $arrival, Date: $flight_date ";
    echo "<form action='transaction.php' method='POST'>";
    echo "<input type='hidden' name='flight_id' value='$flight_id'>";
    echo "<input type='hidden' name='departure' value='$departure'>";
    echo "<input type='hidden' name='arrival' value='$arrival'>";
    echo "<input type='hidden' name='date' value='$flight_date'>";
    echo "<input type='submit' name='select' value='Select'>";
    echo "</form><br>";
}

// Optionally, provide a link to go back to the reservation page
echo '<br><a href="reservation.php">Back to Reservation Page</a>';

// Close the database connection
$conn->close();
?>
