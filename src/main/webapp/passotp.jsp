<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/passotp.css">
<title>Password OTP</title>
</head>
<body>
	<div class="container">
		<form action="otppass" method="post" class="formcontainer">
			<div class="inputcon">
				<p class="otpver">OTP Verification</p>
				<input type="number" class="num" placeholder="Enter your code"
					name="otp1"><br>
				<%
				if (request.getAttribute("message") != null) {
				%>
				<p style="color: red"><%=request.getAttribute("message")%></p>
				<%
				}
				%>
				<button type="submit" class="submit" name="action" value="otpsubmit">Submit</button>
			</div>
		</form>
	</div>
</body>
</html>





