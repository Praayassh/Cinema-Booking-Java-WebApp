<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" type="text/css" href="css/productpage.css">
<title>Cinema</title>
</head>
<body>
    <header>
        <div class="logocon">
            <img src="images/text-1720888369290.png" class="logo">
        </div>
        <form class="search" action="SearchServlet" method="get">
            <span class="material-symbols-outlined searchicon">search</span>
            <input class="searchinput" name="query" placeholder="Search for movies" type="text">
        </form>
        <div class="nav">
            <a href="homepage.jsp">Home</a>
            <a href="profile">Profile</a>
            <a href="booking">Bookings</a>
        </div>
        <div class="nav-icon">
            <span class="material-symbols-outlined">menu</span>
        </div>
    </header>
    <main>
        <div class="overallinfo">
            <div class="movie_image">
                <img src="${movie.imageUrl}" class="image" alt="Movie Image">
            </div>
            <div class="details_con">
                <h2>${movie.name}</h2>
                <p>Director: ${movie.director}</p>
                <p>Genre: ${movie.genre}</p>
                <p>Language: ${movie.language}</p>
                <p>Rating: ${movie.rating}</p>
            </div>
        </div>
        <div class="moredetails">
            <div class="description">
                <p>${movie.description}</p>
            </div>
            <form action="book" method="post">
                <div class="location">
                    <select name="location" required>
                        <option value="" disabled selected>Location</option>
                        <option value="kathmandu">Kathmandu</option>
                        <option value="bhaktapur">Bhaktapur</option>
                        <option value="lalitpur">Lalitpur</option>
                        <option value="butwal">Butwal</option>
                    </select>
                </div>
                <div class="cinemas">
                    <select name="cinema" required>
                        <option value="" disabled selected>Cinema</option>
                        <option value="one_cinema">One Cinema, EyePlix Mall</option>
                        <option value="qfx_bhatbhatini">QFX Bhatbhatini, Bhatbhatini Mall</option>
                        <option value="apple_entertainment">Apple Entertainment, Apple Mall</option>
                        <option value="screen_in">Screen In, All In One Mall</option>
                    </select>
                </div>
                <p class="date">Select Date</p>
                <div class="datecont">
                    <input type="radio" id="date1" name="date" value="Sunday 27" required>
                    <label for="date1">Sunday 27</label>
                    <input type="radio" id="date2" name="date" value="Monday 28" required>
                    <label for="date2">Monday 28</label>
                </div>
                <p class="time">Select Time</p>
                <div class="timeconta">
                    <input type="radio" id="time1" name="time" value="11:00 AM" required>
                    <label for="time1">11:00 AM</label>
                    <input type="radio" id="time2" name="time" value="1:00 PM" required>
                    <label for="time2">1:00 PM</label>
                    <input type="radio" id="time3" name="time" value="4:00 PM" required>
                    <label for="time3">4:00 PM</label>
                    <input type="radio" id="time4" name="time" value="9:00 PM" required>
                    <label for="time4">9:00 PM</label>
                </div>
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <p style="color: red; text-align: center;"><%=request.getAttribute("errorMessage")%></p>
                <% } %>
                <div class="buttoncont">
                    <button class="bookbutton" type="submit">Book Now</button>
                </div>
            </form>
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
                <h3>Payments</h3>
                <p></p>
            </div>
        </div>
        <hr>
        <div class="copyright">&copy; 2024 www.screenx.com. All rights reserved.</div>
    </footer>
</body>
</html>