<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $age = $_POST["age"];
    $street = $_POST["street"];
    $house_no = $_POST["house_no"];
    $city = $_POST["city"];
    $sex = $_POST["sex"];
    $phone = $_POST["phone"]; // Contact value

    // Create a database connection
    include 'db_connect.php';

    // Prepare and execute the INSERT statement for passenger
    $sql = "INSERT INTO passengers(P_fname, P_lname, Age, Street, House_no, City, Sex) VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);

    if ($stmt) {
        $stmt->bind_param("ssisiss", $first_name, $last_name, $age, $street, $house_no, $city, $sex);

        if ($stmt->execute()) {
            // Insertion into the passenger table successful
            $passenger_id = $stmt->insert_id; // Get the auto-generated passenger ID
            $stmt->close();

            // Insert contact (phone) into passenger_contact
            $phone_insert = "INSERT INTO passenger_contact (P_ID, Contact) VALUES (?, ?)";
            $stmt = $conn->prepare($phone_insert);

            if ($stmt) {
                $stmt->bind_param("is", $passenger_id, $phone);

                if ($stmt->execute()) {
                    // Phone number insertion successful
                    echo '<script>alert("Registration successful");</script>';
                } else {
                    // Error occurred during phone insertion
                    echo '<script>alert("Error occurred during phone insertion");</script>';
                }
            } else {
                // Error occurred while preparing the phone insertion statement
                echo '<script>alert("Error occurred while preparing the phone insertion statement");</script>';
            }
        } else {
            // Error occurred during passenger insertion
            echo '<script>alert("Error occurred during passenger insertion");</script>';
        }
    } else {
        // Error occurred while preparing the passenger insertion statement
        echo '<script>alert("Error occurred while preparing the passenger insertion statement");</script>';
    }

    $conn->close();
}
?>
