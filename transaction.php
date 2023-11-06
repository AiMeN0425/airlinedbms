<!DOCTYPE html>
<html>
<head>
    <title>Payment Gateway</title>
    <style>
        body {
            background-image: url('picture_transaction.jpeg');
            background-size: cover;
            background-attachment: fixed;
            background-color: rgba(255, 255, 255, 0.5); /* 50% transparency */
            color: #ffffff; /* Light text color */
            font-family: Arial, sans-serif; /* Specify desired font */
        }

        h2 {
            text-align: center;
            font-size: 48px;
            color: #ffffff;
        }

        .transaction-details {
            max-width: 600px;
            margin: 0 auto;
            background-color: rgba(169, 169, 169, 0.85); /* 50% transparency and grey */
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
        }

        label {
            font-size: 18px;
            display: block;
            margin-bottom: 10px;
        }

        select, input[type="text"] {
            width: 95%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        .confirm-button {
            background-color: #4caf50;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            display: block;
            margin: 20px auto;
        }

        .confirm-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>Payment Gateway</h2>

    <div class="transaction-details">
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
            </select><br>

            <!-- Departure Date from previous selection -->
            <label for="departure_date">Departure Date:</label>
            <input type="text" name="departure_date" value="<?php echo $_POST['date']; ?>" readonly><br>

            <!-- Select Class Dropdown -->
            <label for="select_class">Select Class:</label>
            <select name="select_class" id="select_class" required>
                <option value="Economy">Economy</option>
                <option value="Business">Business</option>
                <option value="First class">First class</option>
            </select><br>

            <!-- Display Charged Amount -->
            <label for="charged_amount">Charged Amount:</label>
            <input type="text" name="charged_amount" id="charged_amount" readonly><br>

            <!-- Confirm Payment Button -->
            <input type="submit" class="confirm-button" value="Confirm Payment">
        </form>
    </div>

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
            alert('Transaction Completed!');
            window.location.href = 'home.php';
        });
    </script>
</body>
</html>
