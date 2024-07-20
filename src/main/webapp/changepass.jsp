<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Registration Form</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/changepass.css">
<title>Change Password</title>
</head>
<body>
	<div class="container">

		<form action="changepass" method="post" class="formcontainer">
			<p class="change">Change Password</p>
			<input type="text" class="pass" name="pass1"
				placeholder="Enter new password" required><br> <input
				type="text" class="pass" name="pass2"
				placeholder="Re-enter password" required><br>
			<%
			if (request.getAttribute("message") != null) {
			%>
			<p style="color: red"><%=request.getAttribute("message")%></p>
			<%
			}
			%>
			<button class="regbutton" type="submit">Register</button>
		</form>
	</div>

</body>
</html>