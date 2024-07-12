<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Flight</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
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

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>

</head>
<body>

<h2>Edit Flight</h2>

<form method="post" action="/flights/edit/${flight.id}">
    <label for="destination">Destination:</label>
    <input type="text" id="destination" name="destination" value="${flight.destination}" required>
    <br>
    <label for="flightNumber">Flight Number:</label>
    <input type="text" id="flightNumber" name="flightNumber" value="${flight.flightNumber}" required>
    <br>
    <label for="aircraftType">Aircraft Type:</label>
    <input type="text" id="aircraftType" name="aircraftType" value="${flight.aircraftType}" required>
    <br>
    <label for="departureTime">Departure Time:</label>
    <input type="text" id="departureTime" name="departureTime" value="${flight.departureTime}" required>
    <br>
    <label for="daysOfWeek">Days of Week:</label>
    <input type="text" id="daysOfWeek" name="daysOfWeek" value="${flight.daysOfWeek}" required>
    <br>
    <button type="submit">Save Changes</button>
</form>

</body>
</html>