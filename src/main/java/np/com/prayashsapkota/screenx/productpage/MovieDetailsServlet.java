package np.com.prayashsapkota.screenx.productpage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import np.com.prayashsapkota.screenx.dbconnection.DBConnection;

@WebServlet("/movieDetails")
public class MovieDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String movieName = req.getParameter("movie");

        if (movieName != null && !movieName.trim().isEmpty()) {
            Movie movie = getMovieDetails(movieName);

            if (movie != null) {
                req.setAttribute("movie", movie);
                req.getRequestDispatcher("/productpage.jsp").forward(req, resp);
            } else {
                req.setAttribute("error", "Movie not found");
                req.getRequestDispatcher("/errorproductpage.jsp").forward(req, resp);
            }
        } else {
            req.setAttribute("error", "No movie name provided");
            req.getRequestDispatcher("/errorproductpage.jsp").forward(req, resp);
        }
    }

    private Movie getMovieDetails(String movieName) {
        Movie movie = null;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM movies WHERE name=?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, movieName);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                movie = new Movie();
                movie.setName(rs.getString("name"));
                movie.setDirector(rs.getString("director"));
                movie.setGenre(rs.getString("genre"));
                movie.setLanguage(rs.getString("language"));
                movie.setRating(rs.getFloat("rating"));
                movie.setImageUrl(rs.getString("image_url"));
                movie.setDescription(rs.getString("description"));
            }

            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movie;
    }
}