<?php
include 'db_connect.php';

if (isset($_POST['update'])) {
    $flight_id = $_POST['flight_id'];
    $new_departure = $_POST['new_departure'];
    $new_arrival = $_POST['new_arrival'];
    $new_date = $_POST['new_date'];

    // Update the Flight table with the new values
    $update_sql = "UPDATE Flight SET Departure=?, Arrival=?, Flight_date=? WHERE Flight_ID=?";
    $update_stmt = $conn->prepare($update_sql);
    $update_stmt->bind_param('sssi', $new_departure, $new_arrival, $new_date, $flight_id);

    try {
        if ($update_stmt->execute()) {
            // Output JavaScript code directly
            echo "<script>
                    alert('Flight updated successfully!\\nUpdated Details:\\nFlight ID: $flight_id\\nDeparture: $new_departure\\nArrival: $new_arrival\\nDate: $new_date');
                    // Optionally, you can redirect or perform additional actions here
                    window.location.href = 'transaction.php';
                  </script>";
        }
    } catch (Exception $e) {
        // Catch the exception raised by the trigger
        echo "<script>alert('Error: " . $e->getMessage() . "');</script>";
    }

    $update_stmt->close();
}

$conn->close();
?>
