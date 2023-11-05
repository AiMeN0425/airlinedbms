<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Include your database connection code (db_connect.php) here
    include 'db_connect.php';

    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $age = $_POST["age"];
    $street = $_POST["street"];
    $house_no = $_POST["house_no"];
    $city = $_POST["city"];
    $sex = $_POST["sex"];

    // Insert the registration data into the Passenger table
    $sql = "INSERT INTO Passengers (P_fname, P_lname, Age, Street, House_no, City, Sex) VALUES (?, ?, ?, ?, ?, ?, ?)";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssiissi", $first_name, $last_name, $age, $street, $house_no, $city, $sex);

    if ($stmt->execute()) {
        // Registration successful
        header("Location: login.php?registration_success=1");
        exit;
    } else {
        // Error occurred during registration
        header("Location: login.php?registration_error=1");
        exit;
    }
}
