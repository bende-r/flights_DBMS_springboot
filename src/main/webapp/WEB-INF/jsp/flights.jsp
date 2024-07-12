<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Flight List</title>
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
            cursor: pointer;
            user-select: none;
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

    <script>
        function sortTable(n) {
            var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
            table = document.getElementById("flightTable");
            switching = true;
            dir = "asc";
            while (switching) {
                switching = false;
                rows = table.rows;
                for (i = 1; i < (rows.length - 1); i++) {
                    shouldSwitch = false;
                    x = rows[i].getElementsByTagName("td")[n];
                    y = rows[i + 1].getElementsByTagName("td")[n];
                    if (dir === "asc") {
                        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                            shouldSwitch = true;
                            break;
                        }
                    } else if (dir === "desc") {
                        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                            shouldSwitch = true;
                            break;
                        }
                    }
                }
                if (shouldSwitch) {
                    rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                    switching = true;
                    switchcount++;
                } else {
                    if (switchcount === 0 && dir === "asc") {
                        dir = "desc";
                        switching = true;
                    }
                }
            }
        }
    </script>
</head>
<body>
<h1>Flight List</h1>
<table border="1" id="flightTable">
    <thead>
    <tr>
        <th onclick="sortTable(0)">ID</th>
        <th onclick="sortTable(1)">Destination</th>
        <th onclick="sortTable(2)">Flight Number</th>
        <th onclick="sortTable(3)">Aircraft Type</th>
        <th onclick="sortTable(4)">Departure Time</th>
        <th onclick="sortTable(5)">Days of Week</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    </thead>
    <p><a href="flights/add">Add</a>
    </p>
    <tbody>
    <c:forEach var="flight" items="${flightslist}">
        <tr>
            <td>${flight.id}</td>
            <td>${flight.destination}</td>
            <td>${flight.flightNumber}</td>
            <td>${flight.aircraftType}</td>
            <td>${flight.departureTime}</td>
            <td>${flight.daysOfWeek}</td>
            <td>
                <a href="flights/edit/${flight.id}">Edit</a>
            </td>
            <td>
                <form action="flights/delete/${flight.id}" method="post">
                    <input type="submit" value="Delete">
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>