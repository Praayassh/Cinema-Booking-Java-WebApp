<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="css/profile.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  <title>Profile</title>
</head>
<body>
  <header>
    <div class="logocon"><img src="images/text-1720888369290.png" class="logo" alt="Logo"></div>
    <form class="search" action="SearchServlet" method="get">
			<span class="material-symbols-outlined searchicon">search</span> <input
				class="searchinput" name="query" placeholder="Search for movies"
				type="text">
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
  <div class="container">
        <div class="allincont">
            <h2>Your Information</h2>
            <div class="info-box">
                <div class="info-item">
                    <span class="label">Name:</span>
                    <span class="data" id="name">
                        <%= request.getAttribute("name") != null ? request.getAttribute("name") : "N/A" %>
                    </span>
                </div>
                <div class="info-item">
                    <span class="label">Phone :</span>
                    <span class="data" id="phone">
                        <%= request.getAttribute("phone") != null ? request.getAttribute("phone") : "N/A" %>
                    </span>
                </div>
                <div class="info-item">
                    <span class="label">Email:</span>
                    <span class="data" id="email">
                        <%= request.getAttribute("email") != null ? request.getAttribute("email") : "N/A" %>
                    </span>
                </div>
                <%
                if (request.getAttribute("message") != null) {
                %>
                <p style="color: red"><%= request.getAttribute("message") %></p>
                <%
                }
                %>
                 <a href="login.jsp" class="logout">Logout?</a>
            </div>
        </div>
    </div>
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