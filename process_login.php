

<?php
session_start();

// Set a session variable to indicate authentication
$_SESSION['authenticated'] = true;

// Debugging: Add an echo statement to check if this code is reached
echo "Redirecting..."; 

// Redirect to the reservation page
header('Location: reservation.php');
exit();
?>

