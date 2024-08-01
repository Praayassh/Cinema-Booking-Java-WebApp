package np.com.prayashsapkota.screenx.ticketbook;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import np.com.prayashsapkota.screenx.dbconnection.DBConnection;

@WebServlet("/bookt")
public class BuyTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String movieName = (String) session.getAttribute("movieName");
        String selectedSeats = request.getParameter("selectedSeats");
        String totalPrice = request.getParameter("totalPrice");
        String email = (String) session.getAttribute("email");
        String location = (String) session.getAttribute("location");
        String cinema = (String) session.getAttribute("cinema");
        String date = (String) session.getAttribute("date");
        String time = (String) session.getAttribute("time");

        if (movieName == null || movieName.isEmpty() || selectedSeats == null || selectedSeats.isEmpty() 
                || totalPrice == null || totalPrice.isEmpty() || date == null || date.isEmpty()
                || time == null || time.isEmpty()) {
            request.setAttribute("message", "Please select a seat.");
            request.getRequestDispatcher("/ticketbook.jsp").forward(request, response);
            return;
        }

     
        try {
            con = DBConnection.getConnection();
            con.setAutoCommit(false);

            String query = "INSERT INTO booking (movieName, selected_seats, total_price, location, cinema, date, time, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(query);

            ps.setString(1, movieName);
            ps.setString(2, selectedSeats);
            ps.setBigDecimal(3, new BigDecimal(totalPrice));
            ps.setString(4, location);
            ps.setString(5, cinema);
            ps.setString(6, date);
            ps.setString(7, time);
            ps.setString(8, email);

            int count = ps.executeUpdate();
            if (count > 0) {
                con.commit();
                response.sendRedirect("bookingconfirmed.jsp");
            } else {
                con.rollback();
                request.setAttribute("message", "Database error.");
                request.getRequestDispatcher("/ticketbook.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            if (con != null) {
                try {
                    con.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
            request.setAttribute("message", "Database error: " + e.getMessage());
            request.getRequestDispatcher("/ticketbook.jsp").forward(request, response);
        } finally {
            try {
                if (ps != null)
                    ps.close();
                if (con != null)
                    con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}   