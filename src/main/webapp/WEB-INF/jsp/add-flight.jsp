<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Flight</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 20px;
        }

        h2 {
            color: #333;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            cursor: pointer;
        }
    </style>
</head>
<body>

<h2>Add Flight</h2>

<form action="${pageContext.request.contextPath}/flights/add" method="post">
    <label for="destination">Destination:</label>
    <input type="text" id="destination" name="destination" required/><br/>

    <label for="flightNumber">Flight Number:</label>
    <input type="text" id="flightNumber" name="flightNumber" required/><br/>

    <label for="aircraftType">Aircraft Type:</label>
    <input type="text" id="aircraftType" name="aircraftType" required/><br/>

    <label for="departureTime">Departure Time:</label>
    <input type="time" id="departureTime" name="departureTime" required/><br/>

    <label for="daysOfWeek">Days of Week:</label>
    <input type="text" id="daysOfWeek" name="daysOfWeek" required/><br/>

    <input type="submit" value="Add Flight"/>
</form>

</body>
</html>