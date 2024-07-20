<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Login Form</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
	<div class="contain">
		<div class="container">
			<form action="loginform" method="post" class="form-container">
				<div class="input">
					<p class="loginhere">Login Here</p>
					<div class="icon">
						<span class="material-icons">email</span> 
						<input type="email" class="login" name="loginemail" placeholder="Email" required>
					</div>
					<div class="icon">
						<span class="material-icons">lock</span> 
						<input type="password" class="login" name="loginpass" placeholder="Password" required>
					</div>
					<%
					if (request.getAttribute("message") != null) {
					%>
					<p style="color: red"><%=request.getAttribute("message")%></p>
					<%
					}
					%>
					<%
					if (request.getAttribute("successMessage") != null) {
					%>
					<p style="color: green"><%=request.getAttribute("successMessage")%></p>
					<%
					}
					%>
					<button class="loginbutton" type="submit" class="login">Login</button>
					<br> 
					<a href="forgotpass.jsp" class="forgot">Forgot Password?</a> 
					<br> 
					<a href="register.jsp" class="reghere">Don't have an account? Register here.</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>