<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	<title>Registration Form</title>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
		rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;700&display=swap"
		rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/register.css">
</head>
<body>
	<div class="contain">
		<div class="container">
			<form action="regform" method="post" class="form-container">
				<div class="input-container">
					<p class="reghere">Create a new account.</p>
					<div class="icon">
						<span class="material-icons con">person</span> 
						<input type="text" class="reg" name="name1" placeholder="Name" required><br>
					</div>
					<div class="icon">
						<span class="material-icons con">phone</span> 
						<input type="tel" class="reg" name="phone1" placeholder="Phone" required><br>
					</div>
					<div class="icon">
						<span class="material-icons con">email</span> 
						<input type="email" class="reg" name="email1" placeholder="Email" required><br>
					</div>
					<div class="icon">
						<span class="material-icons con">lock</span> 
						<input type="password" class="reg" name="pass1" placeholder="Password" required id="password"><br>
					</div>
					<% if (request.getAttribute("error") != null) { %>
						<p style="color: red"><%=request.getAttribute("error")%></p>
					<% } %>
					<button class="regbutton" type="submit">Register</button>
					<br>
					<a class="already" href="login.jsp">Already have an account? Login here.</a>
				</div>
			</form>
			<div class="image-con">
				<img src="images/fg.jpg" alt="" class="image">
			</div>
		</div>
	</div>
</body>
</html>