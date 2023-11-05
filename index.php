<!DOCTYPE html>
<?php
    session_start();
    ob_start();
    include('header.php');
    include('admin/db_connect.php');

	// $query = $conn->query("SELECT * FROM system_settings limit 1")->fetch_array();
	// foreach ($query as $key => $value) {
	// 	if(!is_numeric($key))
	// 		$_SESSION['setting_'.$key] = $value;
	// }
    // ob_end_flush();
    ?>
<!DOCTYPE html>
<html>
<head>
    <title>Home Page</title>
</head>
<body>
    <h2>Welcome to the Home Page</h2>
    <a href="flight.php">View Flights</a>
</body>
</html>
