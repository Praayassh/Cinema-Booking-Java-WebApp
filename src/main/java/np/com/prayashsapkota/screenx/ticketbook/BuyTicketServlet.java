package np.com.prayashsapkota.screenx.ticketbook;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		String selectedSeats = request.getParameter("selectedSeats");
		String totalPrice = request.getParameter("totalPrice");

		String email = (String) session.getAttribute("email");
		String location = (String) session.getAttribute("location");
		String cinema = (String) session.getAttribute("cinema");
		String date = (String) session.getAttribute("date");
		String time = (String) session.getAttribute("time");
		

		if (session == null || session.getAttribute("email") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		
		//Check session values and save them
//				if (session != null) {
//					session.setAttribute("email", email);
//					session.setAttribute("selectedSeats", selectedSeats);
//					session.setAttribute("totalPrice", totalPrice);
//					session.setAttribute("location", location);
//					session.setAttribute("cinema", cinema);
//					session.setAttribute("date", date);
//					session.setAttribute("time", time);
//
//					response.sendRedirect("showSessionValues.jsp");
//				}

		if (selectedSeats == null || selectedSeats.isEmpty() || totalPrice == null || totalPrice.isEmpty() || date == null || date.isEmpty()
				|| time == null || time.isEmpty()) {
			request.setAttribute("message", "Please select a seat.");
			request.getRequestDispatcher("/ticketbook.jsp").forward(request, response);
			return;
			
		} else {

			Connection con = null;
			PreparedStatement ps = null;
			try {
				con = DBConnection.getConnection();
				con.setAutoCommit(false);

				String query = "INSERT INTO booking (selected_seats, total_price, location, cinema, date, time, email) VALUES (?, ?, ?, ?, ?, ?, ?)";
				ps = con.prepareStatement(query);

				// Set parameters
				ps.setString(1, selectedSeats);
				ps.setBigDecimal(2, new BigDecimal(totalPrice));
				ps.setString(3, location);
				ps.setString(4, cinema);
				ps.setString(5, date);
				ps.setString(6, time);
				ps.setString(7, email);

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
}