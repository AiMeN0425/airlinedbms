<?php include 'db_connect.php' ?>
<?php
$flight_id = $_POST['flight_id'];
$first_name = $_POST['first_name'];
$last_name = $_POST['last_name'];

// Perform database query to insert reservation details

// Display confirmation message
?>
<!DOCTYPE html>
<html>
<head>
    <title>Reservation Confirmation</title>
</head>
<body>
    <h1>Reservation Confirmation</h1>
    <p>Thank you, <?php echo $first_name; ?> <?php echo $last_name; ?>, for your reservation on flight <?php echo $flight_id; ?>.</p>
    <!-- Add more details like confirmation number, departure time, etc. if needed -->
</body>
</html>