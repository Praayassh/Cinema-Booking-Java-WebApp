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
<link rel="stylesheet" type="text/css" href="css/forgotpass.css">
<title>Forgot Password</title>
</head>
<body>
	<div class="container">
		<form action="forgotpass" method="post" class="formcontainer">

			<div class="inputcon">
				<p class="change">Change password</p>
				<input type="text" class="email" name="email1"
					placeholder="Enter you email"><br>
				<%
				if (request.getAttribute("message") != null) {
				%>
				<p style="color: red"><%=request.getAttribute("message")%></p>
				<%
				}
				%>
				<button type="submit" class="submit" name="action" value="verify">Submit</button>
			</div>
		</form>
	</div>
</body>
</html>

