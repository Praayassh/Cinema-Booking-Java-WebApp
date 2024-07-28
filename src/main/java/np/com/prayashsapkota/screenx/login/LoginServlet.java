package np.com.prayashsapkota.screenx.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import np.com.prayashsapkota.screenx.dbconnection.DBConnection;

@WebServlet("/loginform")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("loginemail");
		String password = req.getParameter("loginpass");
		HttpSession ses = req.getSession();
		ses.setAttribute("email", email);

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String message = null;
		
		try {
			con = DBConnection.getConnection();
			String query = "SELECT * FROM register WHERE email=? AND password=?";
			ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			rs = ps.executeQuery();

			if (rs.next()) {
				resp.sendRedirect("homepage.jsp");
			} else {
				message = "Invalid Email and password. Please try again.";
				req.setAttribute("message", message);
				req.getRequestDispatcher("/login.jsp").forward(req, resp);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}