<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List, np.com.prayashsapkota.screenx.bookinghistory.Booking"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking History</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" type="text/css" href="css/bookinghistory.css">
</head>
<body>

	<header>
		<div class="logocon">
			<img src="images/text-1720888369290.png" class="logo"
				alt="ScreenX Logo">
		</div>
		<form class="search" action="SearchServlet" method="get">
			<span class="material-symbols-outlined searchicon">search</span> <input
				class="searchinput" name="query" placeholder="Search for movies"
				type="text">
		</form>
		<div class="nav">
			<a href="homepage.jsp">Home</a> <a href="profile">Profile</a> <a
				href="booking
			">Bookings</a>
		</div>
		<div class="nav-icon">
			<span class="material-symbols-outlined">menu</span>
		</div>
	</header>

	<main>
		<h1>Booking History</h1>
		<%
        List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
        if (bookings != null && !bookings.isEmpty()) {
    %>
		<table>
			<tr>
				<th>Movie Name</th>
				<th>Selected Seats</th>
				<th>Total Price</th>
				<th>Location</th>
				<th>Cinema</th>
				<th>Date</th>
				<th>Time</th>
			</tr>
			<% for (Booking booking : bookings) { %>
			<tr>
				<td><%= booking.getMovieName() %></td>
				<td><%= booking.getSelectedSeats() %></td>
				<td><%= booking.getTotalPrice() %></td>
				<td><%= booking.getLocation() %></td>
				<td><%= booking.getCinema() %></td>
				<td><%= booking.getDate() %></td>
				<td><%= booking.getTime() %></td>
			</tr>
			<% } %>
		</table>
		<%
        } else {
    %>
		<p>No booking history found.</p>
		<%
        }
    %>

	</main>

	<footer>
		<div class="footer_container">
			<div class="footer_column">
				<h3>Contact Us</h3>
				<p>Tel: 00765472</p>
				<p>Email: screenx57@gmail.com</p>
			</div>
			<div class="footer_column">
				<h3>Payment Partners</h3>
				<p></p>
			</div>
		</div>
		<hr>
		<div class="copyright">&copy; 2024 www.screenx.com. All rights
			reserved.</div>
	</footer>

</body>
</html>