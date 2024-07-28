<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" type="text/css" href="css/ticketbook.css">
<title>Book ticket</title>
</head>
<body>

	<header>
		<div class="logocon">
			<img src="images/text-1720888369290.png" class="logo" alt="Logo">
		</div>
		<div class="search">
			<span class="material-symbols-outlined searchicon">search</span> <input
				class="searchinput" placeholder="Search for movies"
				aria-label="Search">
		</div>
		<div class="nav">
			<a href="homepage.jsp">Home</a> <a href="profile">Profile</a> <a
				href="booking.jsp">Bookings</a>
		</div>
		<div class="nav-icon">
			<span class="material-symbols-outlined">menu</span>
		</div>
	</header>

	<main>
		<div class="category">
			<div class="box1"></div>
			<div class="booked">Booked</div>
			<div class="box2"></div>
			<div class="selected">Selected</div>
		</div>
		<div class="screencont">
			<div class="screen">Screen This Side</div>
		</div>
		<div class="scontainer">
			<div class="row" id="rowA">
				<span class="seat">A01</span><span class="seat">A02</span><span
					class="seat">A03</span><span class="seat">A04</span><span
					class="seat">A05</span><span class="seat">A06</span><span
					class="seat">A07</span><span class="seat">A08</span><span
					class="seat">A09</span><span class="seat">A10</span><span
					class="seat">A11</span><span class="seat">A12</span><span
					class="seat">A13</span>
			</div>
			<div class="row" id="rowB">
				<span class="seat">B01</span><span class="seat">B02</span><span
					class="seat">B03</span><span class="seat">B04</span><span
					class="seat">B05</span><span class="seat">B06</span><span
					class="seat">B07</span><span class="seat">B08</span><span
					class="seat">B09</span><span class="seat">B10</span><span
					class="seat">B11</span><span class="seat">B12</span><span
					class="seat">B13</span>
			</div>
			<div class="row" id="rowC">
				<span class="seat">C01</span><span class="seat">C02</span><span
					class="seat">C03</span><span class="seat">C04</span><span
					class="seat">C05</span><span class="seat">C06</span><span
					class="seat">C07</span><span class="seat">C08</span><span
					class="seat">C09</span><span class="seat">C10</span><span
					class="seat">C11</span><span class="seat">C12</span><span
					class="seat">C13</span>
			</div>
			<div class="row" id="rowD">
				<span class="seat">D01</span><span class="seat">D02</span><span
					class="seat">D03</span><span class="seat">D04</span><span
					class="seat">D05</span><span class="seat">D06</span><span
					class="seat">D07</span><span class="seat">D08</span><span
					class="seat">D09</span><span class="seat">D10</span><span
					class="seat">D11</span><span class="seat">D12</span><span
					class="seat">D13</span>
			</div>
			<div class="row" id="rowE">
				<span class="seat">E01</span><span class="seat">E02</span><span
					class="seat">E03</span><span class="seat">E04</span><span
					class="seat">E05</span><span class="seat">E06</span><span
					class="seat">E07</span><span class="seat">E08</span><span
					class="seat">E09</span><span class="seat">E10</span><span
					class="seat">E11</span><span class="seat">E12</span><span
					class="seat">E13</span>
			</div>
			<div class="row" id="rowF">
				<span class="seat">F01</span><span class="seat">F02</span><span
					class="seat">F03</span><span class="seat">F04</span><span
					class="seat">F05</span><span class="seat">F06</span><span
					class="seat">F07</span><span class="seat">F08</span><span
					class="seat">F09</span><span class="seat">F10</span><span
					class="seat">F11</span><span class="seat">F12</span><span
					class="seat">F13</span>
			</div>
			<div class="row" id="rowG">
				<span class="seat">G01</span><span class="seat">G02</span><span
					class="seat">G03</span><span class="seat">G04</span><span
					class="seat">G05</span><span class="seat">G06</span><span
					class="seat">G07</span><span class="seat">G08</span><span
					class="seat">G09</span><span class="seat">G10</span><span
					class="seat">G11</span><span class="seat">G12</span><span
					class="seat">G13</span>
			</div>
			<div class="row" id="rowH">
				<span class="seat">H01</span><span class="seat">H02</span><span
					class="seat">H03</span><span class="seat">H04</span><span
					class="seat">H05</span><span class="seat">H06</span><span
					class="seat">H07</span><span class="seat">H08</span><span
					class="seat">H09</span><span class="seat">H10</span><span
					class="seat">H11</span><span class="seat">H12</span><span
					class="seat">H13</span>
			</div>
			<div class="row" id="rowI">
				<span class="seat">I01</span><span class="seat">I02</span><span
					class="seat">I03</span><span class="seat">I04</span><span
					class="seat">I05</span><span class="seat">I06</span><span
					class="seat">I07</span><span class="seat">I08</span><span
					class="seat">I09</span><span class="seat">I10</span><span
					class="seat">I11</span><span class="seat">I12</span><span
					class="seat">I13</span>
			</div>
			<div class="row" id="rowJ">
				<span class="seat">J01</span><span class="seat">J02</span><span
					class="seat">J03</span><span class="seat">J04</span><span
					class="seat">J05</span><span class="seat">J06</span><span
					class="seat">J07</span><span class="seat">J08</span><span
					class="seat">J09</span><span class="seat">J10</span><span
					class="seat">J11</span><span class="seat">J12</span><span
					class="seat">J13</span>
			</div>
			<div class="row" id="rowK">
				<span class="seat">K01</span><span class="seat">K02</span><span
					class="seat">K03</span><span class="seat">K04</span><span
					class="seat">K05</span><span class="seat">K06</span><span
					class="seat">K07</span><span class="seat">K08</span><span
					class="seat">K09</span><span class="seat">K10</span><span
					class="seat">K11</span><span class="seat">K12</span><span
					class="seat">K13</span>
			</div>
			<div class="row" id="rowL">
				<span class="seat">L01</span><span class="seat">L02</span><span
					class="seat">L03</span><span class="seat">L04</span><span
					class="seat">L05</span><span class="seat">L06</span><span
					class="seat">L07</span><span class="seat">L08</span><span
					class="seat">L09</span><span class="seat">L10</span><span
					class="seat">L11</span><span class="seat">L12</span><span
					class="seat">L13</span>
			</div>
			<div class="row" id="rowM">
				<span class="seat">M01</span><span class="seat">M02</span><span
					class="seat">M03</span><span class="seat">M04</span><span
					class="seat">M05</span><span class="seat">M06</span><span
					class="seat">M07</span><span class="seat">M08</span><span
					class="seat">M09</span><span class="seat">M10</span><span
					class="seat">M11</span><span class="seat">M12</span><span
					class="seat">M13</span>
			</div>
			<div class="total-price">
				Total Price: Rs <span id="price">0</span>
			</div>
			<form id="bookingForm" action="bookt" method="post">
				<input type="hidden" name="selectedSeats" id="selectedSeats">
				<input type="hidden" name="totalPrice" id="totalPrice">
				<%
				if (request.getAttribute("message") != null) {
				%>
				<p style="color: red"><%=request.getAttribute("message")%></p>
				<%
				}
				%>
				<button type="submit" class="book-button">Book Now</button>
			</form>
		</div>

		<script>
    let seatPrice = 300;
    let totalPrice = 0;
    let selectedSeats = [];

    document.querySelectorAll('.seat').forEach(seat => {
        seat.addEventListener('click', function() {
            if (this.classList.contains('selected')) {
                this.classList.remove('selected');
                totalPrice -= seatPrice;
                selectedSeats = selectedSeats.filter(s => s !== this.textContent);
            } else {
                this.classList.add('selected');
                totalPrice += seatPrice;
                selectedSeats.push(this.textContent);
            }
            document.getElementById('price').textContent = totalPrice.toFixed(2);
            document.getElementById('selectedSeats').value = selectedSeats.join(',');
            document.getElementById('totalPrice').value = totalPrice.toFixed(2);
        });
    });
</script>

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