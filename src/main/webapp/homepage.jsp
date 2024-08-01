<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" type="text/css" href="css/homepage.css">
<title>ScreenX</title>
</head>
<body>
	<header>
		<div class="logocon">
			<img src="images/text-1720888369290.png" class="logo"
				alt="ScreenX Logo">
		</div>
		<form class="search" action="SearchServlet" method="get">
			<span class="material-symbols-outlined searchicon">search</span> <input
				class="searchinput" name="query" placeholder="Search for movies"
				type="text">
		</form>
		<div class="nav">
			<a href="homepage.jsp">Home</a> <a href="profile">Profile</a> <a href="booking
			">Bookings</a>
		</div>
		<div class="nav-icon">
			<span class="material-symbols-outlined">menu</span>
		</div>
	</header>
	<main>
		<div class="heading">Now Showing</div>
		<div class="items">
			<div class="movie">
				<a href="http://localhost:8086/ScreenX/movieDetails?movie=Escape">
					<img class="saleitems"
					src="images/banners/5I0koi3lvHtGDhYvfAkLssQKEGO.webp" alt="Escape">
				</a>
				<div class="moviename">Escape</div>
			</div>
			<div class="movie">
				<a href="http://localhost:8086/ScreenX/movieDetails?movie=Rebellion">
					<img class="saleitems"
					src="images/banners/5js5JCtxfiYF2MdNn0zGyCwyg8L.webp"
					alt="Rebellion">
				</a>
				<div class="moviename">Rebellion</div>
			</div>
			<div class="movie">
				<a href="http://localhost:8086/ScreenX/movieDetails?movie=Dreams">
					<img class="saleitems"
					src="images/banners/6Gy1ReRZ9sK9g8TPXZGz7CcQvrV.webp" alt="Dreams">
				</a>
				<div class="moviename">Dreams</div>
			</div>
			<div class="movie">
				<a href="http://localhost:8086/ScreenX/movieDetails?movie=Shadow">
					<img class="saleitems"
					src="images/banners/7dFZJ2ZJJdcmkp05B9NWlqTJ5tq.webp" alt="Shadow">
				</a>
				<div class="moviename">Shadow</div>
			</div>
			<div class="movie">
				<a href="http://localhost:8086/ScreenX/movieDetails?movie=Finale">
					<img class="saleitems"
					src="images/banners/7QMsOTMUswlwxJP0rTTZfmz2tX2.webp" alt="Finale">
				</a>
				<div class="moviename">Finale</div>
			</div>
			<div class="movie">
				<a href="http://localhost:8086/ScreenX/movieDetails?movie=Legacy">
					<img class="saleitems"
					src="images/banners/7wbPHetLZnyL6hwqrfEPnLNKnXu.webp" alt="Legacy">
				</a>
				<div class="moviename">Legacy</div>
			</div>
			<div class="movie">
				<a href="http://localhost:8086/ScreenX/movieDetails?movie=Jurassic">
					<img class="saleitems"
					src="images/banners/8GeBQWQOTu7yLwNfCV6iWyL8xNf.webp"
					alt="Jurassic">
				</a>
				<div class="moviename">Jurassic</div>
			</div>
			<div class="movie">
				<a href="http://localhost:8086/ScreenX/movieDetails?movie=Titan">
					<img class="saleitems"
					src="images/banners/95RVeMWMvk97PBW0msryIJC32XD.webp" alt="Titan">
				</a>
				<div class="moviename">Titan</div>
			</div>
			<div class="movie">
				<a href="http://localhost:8086/ScreenX/movieDetails?movie=Pinnacle">
					<img class="saleitems"
					src="images/banners/9zLuN3MfvTcABYYNJq5PkIG81S5.webp"
					alt="Pinnacle">
				</a>
				<div class="moviename">Pinnacle</div>
			</div>
			<div class="movie">
				<a href="http://localhost:8086/ScreenX/movieDetails?movie=Reality">
					<img class="saleitems"
					src="images/banners/gKkl37BQuKTanygYQG1pyYgLVgf.webp" alt="Reality">
				</a>
				<div class="moviename">Reality</div>
			</div>
			<div class="movie">
				<a href="http://localhost:8086/ScreenX/movieDetails?movie=Whisper">
					<img class="saleitems"
					src="images/banners/gvz0m4MJ8sAj6yMcQdwN07bNjRY.webp" alt="Whisper">
				</a>
				<div class="moviename">Whisper</div>
			</div>
			<div class="movie">
				<a href="http://localhost:8086/ScreenX/movieDetails?movie=Nova">
					<img class="saleitems"
					src="images/banners/kUWvvMkNIf21UUDmHjYw55v6o7C.webp" alt="Nova">
				</a>
				<div class="moviename">Nova</div>
			</div>
			<div class="movie">
				<a href="http://localhost:8086/ScreenX/movieDetails?movie=Vista">
					<img class="saleitems"
					src="images/banners/mEg3ohdBkLOs0L1GmYGtiwyJXlE.webp" alt="Vista">
				</a>
				<div class="moviename">Vista</div>
			</div>
			<div class="movie">
				<a href="http://localhost:8086/ScreenX/movieDetails?movie=Echo">
					<img class="saleitems"
					src="images/banners/naCgSiacvV685kait6fBvhVhdce.webp" alt="Echo">
				</a>
				<div class="moviename">Echo</div>
			</div>
			<div class="movie">
				<a href="http://localhost:8086/ScreenX/movieDetails?movie=Turbine">
					<img class="saleitems"
					src="images/banners/pjnD08FlMAIXsfOLKQbvmO0f0MD.webp" alt="Turbine">
				</a>
				<div class="moviename">Turbine</div>
			</div>
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
		<div class="copyright">&copy; 2024 www.screenx.com. All rights
			reserved.</div>
	</footer>
</body>
</html>