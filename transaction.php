<!DOCTYPE html>
<html>
<head>
    <title>Add New Transaction</title>
</head>
<body>
    <h2>Add New Transaction</h2>

    <form action="process_transaction.php" method="POST">
        <!-- Transaction Type Dropdown -->
        <label for="transaction_type">Transaction Type:</label>
        <select name="transaction_type" required>
            <option value="GooglePay">GooglePay</option>
            <option value="PhonePe">PhonePe</option>
            <option value="Credit Card">Credit Card</option>
            <option value="Debit Card">Debit Card</option>
            <option value="Paytm">Paytm</option>
            <!-- Add more transaction types as needed -->
        </select><br><br>

        <!-- Departure Date from previous selection -->
        <label for="departure_date">Departure Date:</label>
        <input type="text" name="departure_date" value="<?php echo $_POST['date']; ?>" readonly><br><br>

        <!-- Select Class Dropdown -->
        <label for="select_class">Select Class:</label>
        <select name="select_class" id="select_class" required>
            <option value="Economy">Economy</option>
            <option value="Business">Business</option>
            <option value="First class">First class</option>
        </select><br><br>

        <!-- Display Charged Amount -->
        <label for="charged_amount">Charged Amount:</label>
        <input type="text" name="charged_amount" id="charged_amount" readonly><br><br>

        <!-- Confirm Payment Button -->
        <input type="submit" value="Confirm Payment">
    </form>

    <script>
        // Function to update charged amount based on selected class
        document.getElementById('select_class').addEventListener('change', function() {
            var classSelection = this.value;
            var chargedAmountField = document.getElementById('charged_amount');

            // Set charged amount based on selected class
            switch(classSelection) {
                case 'Economy':
                    chargedAmountField.value = <?php echo $economy_charge; ?>;
                    break;
                case 'Business':
                    chargedAmountField.value = <?php echo $business_charge; ?>;
                    break;
                case 'First class':
                    chargedAmountField.value = <?php echo $first_class_charge; ?>;
                    break;
                default:
                    chargedAmountField.value = '';
            }
        });
    </script>

    <script>
        // Alert and redirect on form submission
        document.querySelector('form').addEventListener('submit', function(e) {
            e.preventDefault();
            alert('Completed!');
            window.location.href = 'home.php';
        });
    </script>
</body>
</html>
