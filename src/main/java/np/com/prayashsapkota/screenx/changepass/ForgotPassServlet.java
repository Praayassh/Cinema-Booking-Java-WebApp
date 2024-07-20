package np.com.prayashsapkota.screenx.changepass;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import np.com.prayashsapkota.screenx.dbconnection.DBConnection;

@WebServlet("/forgotpass")
public class ForgotPassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession ses = req.getSession();
		String email = req.getParameter("email1");
		ses.setAttribute("email", email);
		Connection con = null;
		PreparedStatement ps = null;
		String message = null;
		ResultSet rs = null;
		if (email == null) {
			message = "Please enter your email";
			req.setAttribute("message", message);
			req.getRequestDispatcher("/forgotpass.jsp").forward(req, resp);
		} else {
			try {
				con = DBConnection.getConnection();
				String query = "SELECT * FROM register WHERE email=?";
				ps = con.prepareStatement(query);
				ps.setString(1, email);
				rs = ps.executeQuery();
				if (rs.next()) {
					String token = generateToken();
					sendVerificationEmail(email, token);
					HttpSession session = req.getSession();
					session.setAttribute("token", token);
					resp.sendRedirect("passotp.jsp");
				} else {
					message = "Please enter a valid email";
					req.setAttribute("message", message);
					req.getRequestDispatcher("/forgotpass.jsp").forward(req, resp);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
	}

	// To generate random 6 digit code for token

	private String generateToken() {
		Random random = new Random();
		int token = random.nextInt(900000) + 100000;
		return String.valueOf(token);
	}

	// To send the verification code in email

	private void sendVerificationEmail(String email, String token) throws ServletException {
		String host = "smtp.gmail.com";
		String from = "veriificatiion@gmail.com";
		String pass = "exuc lejf cfre wqqs";

		Properties props = new Properties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.user", from);
		props.put("mail.smtp.password", pass);
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props);
		MimeMessage message = new MimeMessage(session);

		try {
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			message.setSubject("Email Verification");
			message.setContent(
					"<div style='text-align: center;'>" + "<h1>ScreenX</h1>" + "<h2>Password reset token</h2>"
							+ "<p>Please use the following token:</p>"
							+ "<h1 style='font-size: 24px; font-weight: bold;'>" + token + "</h1>" + "</div>",
					"text/html");
			Transport transport = session.getTransport("smtp");
			transport.connect(host, from, pass);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (MessagingException e) {
			throw new ServletException("Failed to send verification email", e);
		}
	}

}
