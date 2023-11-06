<?php
session_start(); // Start the session if not already started

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Check if the required POST parameters are set
    if (
        isset($_POST["transaction_type"]) &&
        isset($_POST["charged_amount"]) &&
        isset($_POST["flight_id"])
    ) {
        // Get the payment method, charged amount, and flight ID from the form
        $payment_method = $_POST["transaction_type"];
        $charged_amount = $_POST["charged_amount"];
        $flight_id = $_POST["flight_id"];

        // Create a database connection (include your db_connect.php)
        include 'db_connect.php';

        // Query the Flight table to retrieve the departure date (flight_date) for the selected flight
        $sql_flight = "SELECT flight_date FROM Flight WHERE Flight_ID = ?";
        $stmt_flight = $conn->prepare($sql_flight);

        if ($stmt_flight) {
            $stmt_flight->bind_param("s", $flight_id);
            $stmt_flight->execute();
            $stmt_flight->bind_result($departure_date); // Use departure_date as the variable to store flight_date
            $stmt_flight->fetch();
            $stmt_flight->close();

            // Insert the transaction details into the Transaction table with the retrieved departure date
            $sql = "INSERT INTO Transaction (Ts_type, Departure_date, Booking_date, Charged_amount, Flight_ID)
                    VALUES (?, ?, NOW(), ?, ?)";
            $stmt = $conn->prepare($sql);

            if ($stmt) {
                // Bind the parameters and execute the query
                $stmt->bind_param("ssds", $payment_method, $departure_date, $charged_amount, $flight_id);

                if ($stmt->execute()) {
                    echo '<script>alert("Payment successful. Thank you for booking your flight!"); window.location.href = "home.php"; </script>';
                } else {
                    echo '<script>alert("Payment failed. Please try again later.");</script>';
                }

                // Close the prepared statement
                $stmt->close();
            } else {
                echo '<script>alert("Error in preparing the SQL statement for Transaction.");</script>';
            }
        } else {
            echo '<script>alert("Error in preparing the SQL statement for Flight.");</script>';
        }

        // Close the database connection
        $conn->close();
    } else {
        echo '<script>alert("Incomplete POST data. Please fill out the form completely.");</script>';
    }
} else {
    echo '<script>alert("Invalid request. Please submit the form.");</script>';
}


?>
