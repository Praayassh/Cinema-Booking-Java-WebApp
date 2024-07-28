<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
					if (request.getAttribute("error") != null) {
					%>
	<p style="color: red"><%=request.getAttribute("error")%></p>
	<%
					}
					%>

</body>
</html>