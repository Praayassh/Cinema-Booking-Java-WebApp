<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/verification.css">
<meta charset="ISO-8859-1">
<title>Email Verification</title>
</head>
<body>
	<div class="container">
		<form action="verify" method="post" class="form-container">
			<h2>Email Verification</h2>
			<input type="text" placeholder="Verification Token" name="token"
				class="ver"><br>

			<%
			if (request.getAttribute("error") != null) {
			%>
			<p style="color: red"><%=request.getAttribute("error")%></p>
			<%
			}
			%>
			<%
			if (request.getAttribute("message") != null) {
			%>
			<p style="color: green"><%=request.getAttribute("message")%></p>
			<%
			}
			%>
			<button type="submit" class="verify" name="action" value="verify">Verify</button>
			<button type="submit" class="rever" name="action" value="resend">Resend
				Verification code</button>
		</form>
	</div>
</body>
</html>