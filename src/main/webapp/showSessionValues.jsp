<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>Session Values</title>
</head>
<body>
	<h2>Session Values</h2>
	<p>Token: ${sessionScope.token}</p>
	<p>Name: ${sessionScope.name}</p>
	<p>Email: ${sessionScope.email}</p>
	<p>Phone: ${sessionScope.phone}</p>
	<p>Password: ${sessionScope.pass}</p>
</body>
</html>