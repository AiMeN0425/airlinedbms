<!DOCTYPE html>
<html>
<head>
    <title>Transaction Page</title>
</head>
<body>
    <h2>Add New Transaction</h2>
    <form action="process_transaction.php" method="POST">
        <label for="transaction_type">Transaction Type:</label>
        <select name="transaction_type" required>
            <option value="GooglePay">GooglePay</option>
            <option value="PhonePe">PhonePe</option>
            <option value="Credit Card">Credit Card</option>
            <option value="Debit Card">Debit Card</option>
            <option value="Paytm">Paytm</option>
            <!-- Add more transaction types as needed -->
        </select><br><br>

        <label for="departure_date">Departure Date:</label>
        <input type="date" name="departure_date" required><br><br>

        <label for="booking_date">Booking Date:</label>
        <input type="date" name="booking_date" required><br><br>

        <?php
        // Replace the following code with PHP logic to retrieve data
        // based on the selected flight from the Reservation table
        if (isset($_POST['flight_id'])) {
            // You'll need to replace this with your database connection logic
            include 'db_connect.php';

            $flight_id = $_POST['flight_id'];
            
            // Fetch charged amount from the Airfare table based on flight ID and passenger ID
            $sql = "SELECT Charged_Amount FROM Airfare WHERE Flight_ID = ? AND Passenger_ID = ?";
            if ($stmt = $conn->prepare($sql)) {
                // Replace $passenger_id with the actual passenger ID (e.g., fetched from the login)
                $passenger_id = 123; // Replace with the actual passenger ID
                $stmt->bind_param("ii", $flight_id, $passenger_id);
                $stmt->execute();
                $stmt->bind_result($charged_amount);
                $stmt->fetch();
                $stmt->close();
            }
            
            // Close the database connection
            $conn->close();
        }
        ?>

        <label for="charged_amount">Charged Amount:</label>
        <input type="text" name="charged_amount" value="<?php echo $charged_amount; ?>" required readonly><br><br>

        <label for="passenger_id">Passenger ID (First Name):</label>
        <input type="text" name="passenger_id" value="<?php echo $first_name; ?>" required readonly><br><br>

        <label for="flight_id">Flight ID:</label>
        <input type="text" name="flight_id" value="<?php echo $flight_id; ?>" required readonly><br><br>

        <input type="submit" value="Add Transaction">
    </form>
    <br>
    <a href="home.php">Back to Home</a>
</body>
</html>
