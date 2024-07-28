<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Session Values</title>
</head>
<body>
    <h1>Session Values</h1>
    <p>Email: <%= session.getAttribute("email") %></p>
    <p>Selected Seats: <%= session.getAttribute("selectedSeats") %></p>
    <p>Total Price: <%= session.getAttribute("totalPrice") %></p>
    <p>Location: <%= session.getAttribute("location") %></p>
    <p>Cinema: <%= session.getAttribute("cinema") %></p>
    <p>Date: <%= session.getAttribute("date") %></p>
    <p>Time: <%= session.getAttribute("time") %></p>
</body>
</html>