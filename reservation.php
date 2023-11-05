<!DOCTYPE html>
<html>
<head>
    <title>Reservation Page</title>
</head>
<body>
    <h2>Flight Reservation</h2>
    <form action="flight.php" method="POST">
        <label for="departure">Departure:</label>
        <select name="departure" required>
            <?php
            // Connect to the database (You can include your db_connect.php here)
            include 'db_connect.php';
            
            // Fetch unique departure locations from the Route table
            $sql = "SELECT DISTINCT Departure FROM Route";
            $result = $conn->query($sql);
            
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo "<option value='{$row['Departure']}'>{$row['Departure']}</option>";
                }
            }
            ?>
        </select><br><br>
        
        <label for="arrival">Arrival:</label>
        <select name="arrival" required>
            <?php
            // Fetch unique arrival locations from the Route table
            $sql = "SELECT DISTINCT Destination FROM Route";
            $result = $conn->query($sql);
            
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo "<option value='{$row['Destination']}'>{$row['Destination']}</option>";
                }
            }
            ?>
        </select><br><br>
        
        <label for="time">Time:</label>
        <input type="time" name="time" required><br><br>
        
        <label for="date">Date:</label>
        <input type="date" name="date" required><br><br>
        
        <label for="seat_class">Seat Class:</label>
        <select name="seat_class" required>
            <?php
            // Fetch seat class options from the Class table
            $sql = "SELECT DISTINCT Class FROM Airfare";
            $result = $conn->query($sql);
            
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo "<option value='{$row['Class']}'>{$row['Class']}</option>";
                }
            }
            ?>
        </select><br><br>
        
        <input type="submit" value="Search Flights">
    </form>
    
    <!-- Add a "Confirm" button to go to the transaction page -->
    <form action="transaction.php" method="GET">
        <input type="submit" name="confirm" value="Confirm">
    </form>
    
    <br>
    <a href="home.php">Back to Home</a>
    
    <?php
    // Close the database connection (You can include your db_connect.php here)
    $conn->close();
    ?>
</body>
</html>
