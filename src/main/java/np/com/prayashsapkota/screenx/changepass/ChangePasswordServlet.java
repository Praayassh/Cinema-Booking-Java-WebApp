package np.com.prayashsapkota.screenx.changepass;

import java.io.IOException;
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

@WebServlet("/changepass")

public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession ses = req.getSession();
		String email = (String) ses.getAttribute("email");
		String pass1 = req.getParameter("pass1");
		String pass2 = req.getParameter("pass2");
		String message = null;
		Connection con = null;
		PreparedStatement ps = null;
		final String passwordPattern = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!])(?=\\S+$).{8,}$";

		if (pass1 == null && pass2 == null) {
			message = "All fields are required";
			req.setAttribute("message", message);
			req.getRequestDispatcher("/changepass.jsp").include(req, resp);
		} else if (!pass1.matches(passwordPattern) && !pass2.matches(passwordPattern)) {
			message = "Please enter a strong password.";
			req.setAttribute("message", message);
			req.getRequestDispatcher("/changepass.jsp").include(req, resp);
		} else if (!pass1.equals(pass2)) {
			message = "Passsword doesn't match.";
			req.setAttribute("message", message);
			req.getRequestDispatcher("/changepass.jsp").include(req, resp);
		} else {
			if (pass1 != null && pass2 != null) {
				try {
					con = DBConnection.getConnection();
					String query = "UPDATE register SET password=?  WHERE email=?";
					ps = con.prepareStatement(query);
					ps.setString(1, pass1);
	                ps.setString(2, email);
					int count = ps.executeUpdate();
					if (count > 0) {
						String successMessage = "Password Changed Sucessfully. Please login";
						req.setAttribute("successMessage", successMessage);
						req.getRequestDispatcher("/login.jsp").include(req, resp);
					} else {
						message = "Failed to update password.";
						req.setAttribute("message", message);
						req.getRequestDispatcher("/changepass.jsp").include(req, resp);
					}
				} catch (SQLException e) {
					e.printStackTrace();
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
			} else {
				message = "Error occured. Please try again.";
				req.setAttribute("message", message);
				req.getRequestDispatcher("/changepass.jsp").include(req, resp);
			}

		}
	}

}
