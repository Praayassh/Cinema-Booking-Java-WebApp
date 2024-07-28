<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/homepage.css">
  <title>Search Results</title>
</head>
<body>
  <header>
    <div class="logocon"><img src="images/text-1720888369290.png" class="logo">
    </div>
     <form class="search" action="SearchServlet" method="get">
      <span class="material-icons-outlined searchicon">search</span>
      <input class="searchinput" name="query" placeholder="Search for movies">
    </form>
    <div class="nav">
      <a href="homepage.jsp">Home</a>
      <a href="profile">Profile</a>
      <a href="#">Bookings</a>
    </div>
    <div class="nav-icon">
      <span class="material-symbols-outlined">menu</span>
    </div>
  </header>
  <main>
    <div class="heading">Search Results</div>
    <div class="items">
      <c:choose>
        <c:when test="${!empty results}">
          <c:forEach var="entry" items="${results}">
            <div class="movie">
              <a href="productpage.jsp?movie=${entry.key}"><img class="saleitems" src="${entry.value}"></a>
              <div class="moviename">${entry.key}</div>
            </div>
          </c:forEach>
        </c:when>
        <c:otherwise>
          <div class="no-results">No movies found</div>
        </c:otherwise>
      </c:choose>
    </div>
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
    <div class="copyright">
      &copy; 2024 www.screenx.com. All rights reserved.
    </div>
  </footer>
</body>
</html>