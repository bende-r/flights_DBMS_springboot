<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Flight</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 20px;
        }

        h1 {
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        thead {
            background-color: #4caf50;
            color: white;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        p {
            color: #666;
        }

        p span {
            font-weight: bold;
            color: #4caf50;
        }

        tbody tr:hover {
            background-color: #d3d3d3;
        }
    </style>
</head>
<body>

<h2>Delete Flight</h2>

<p>Are you sure you want to delete the following flight?</p>

<p>Destination: ${flight.destination}</p>
<p>Flight Number: ${flight.flightNumber}</p>
<p>Aircraft Type: ${flight.aircraftType}</p>
<p>Departure Time: ${flight.departureTime}</p>
<p>Days of Week: ${flight.daysOfWeek}</p>

<form method="post" action="/flights/delete/${flight.id}">
    <button type="submit">Delete</button>
</form>

</body>
</html>