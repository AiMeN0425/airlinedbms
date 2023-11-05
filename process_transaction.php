<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Include your database connection code (db_connect.php) here
    include 'db_connect.php';

    $transaction_type = $_POST["transaction_type"];
    $departure_date = $_POST["departure_date"];
    $booking_date = $_POST["booking_date"];
    $charged_amount = $_POST["charged_amount"];
    $passenger_id = $_POST["passenger_id"];
    $flight_id = $_POST["flight_id"];
    $seat_class = $_POST["seat_class"];

    // Perform database insertion to add a new transaction
    // Write and execute the SQL query to insert the transaction data into the Transaction table
    $sql = "INSERT INTO Transaction (Ts_type, Departure_date, Booking_date, Charged_amount, P_ID, Flight_ID, Class) VALUES (?, ?, ?, ?, ?, ?, ?)";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssiiis", $transaction_type, $departure_date, $booking_date, $charged_amount, $passenger_id, $flight_id, $seat_class);

    if ($stmt->execute()) {
        // Transaction added successfully
        header("Location: transaction.php?success=1");
        exit;
    } else {
        // Error occurred during insertion
        header("Location: transaction.php?error=1");
        exit;
    }
}
?>
