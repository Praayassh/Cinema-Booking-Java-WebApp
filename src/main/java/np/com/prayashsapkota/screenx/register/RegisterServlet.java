package np.com.prayashsapkota.screenx.register;

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

@WebServlet("/regform")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		String myName = req.getParameter("name1");
		String myEmail = req.getParameter("email1");
		String myPhone = req.getParameter("phone1");
		String myPass = req.getParameter("pass1");
		String errorMessage = null;
		final String passwordPattern = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!])(?=\\S+$).{8,}$";

		if (myName == null || myName.isEmpty() || myEmail == null || myEmail.isEmpty() || myPhone == null
				|| myPhone.isEmpty() || myPass == null || myPass.isEmpty()) {
			errorMessage = "All fields are required.";
			req.setAttribute("error", errorMessage);
			req.getRequestDispatcher("/register.jsp").forward(req, resp);
		} else if (myPhone.length() != 10) {
			errorMessage = "Phone number must be of 10 digits.";
			req.setAttribute("error", errorMessage);
			req.getRequestDispatcher("/register.jsp").forward(req, resp);
		} else if (!myPass.matches(passwordPattern)) {
			errorMessage = "Please enter a strong password";
			req.setAttribute("error", errorMessage);
			req.getRequestDispatcher("/register.jsp").forward(req, resp);
		} else {
			boolean emailExists = emailExist(req, resp);
			boolean phoneExists = phoneExist(req, resp);

			if (emailExists) {
				errorMessage = "Account with this email already exists.";
				req.setAttribute("error", errorMessage);
				req.getRequestDispatcher("/register.jsp").forward(req, resp);
			} else if (phoneExists) {
				errorMessage = "Account with this phone number already exists.";
				req.setAttribute("error", errorMessage);
				req.getRequestDispatcher("/register.jsp").forward(req, resp);
			} else {
				String token = generateToken();
				sendVerificationEmail(myEmail, token);

				HttpSession session = req.getSession();
				session.setAttribute("name", myName);
				session.setAttribute("email", myEmail);
				session.setAttribute("phone", myPhone);
				session.setAttribute("pass", myPass);
				session.setAttribute("token", token);

				resp.sendRedirect("verification.jsp");
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
					"<div style='text-align: center;'>" + "<h1>ScreenX</h1>" + "<h2>Thank you for registering!</h2>"
							+ "<p>Please verify your email with the following token:</p>"
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

	// To check if email exists or not
	private boolean emailExist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		boolean exist = false;
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		String myEmail = req.getParameter("email1");
		try {
			con = DBConnection.getConnection();
			String query = "SELECT * FROM register WHERE email=?";
			ps = con.prepareStatement(query);
			ps.setString(1, myEmail);
			rs = ps.executeQuery();

			if (rs.next()) {
				exist = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return exist;
	}

	// To check if phone exists or not
	private boolean phoneExist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		boolean exist = false;
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		String myPhone = req.getParameter("phone1");
		try {
			con = DBConnection.getConnection();
			String query = "SELECT * FROM register WHERE phone=?";
			ps = con.prepareStatement(query);
			ps.setString(1, myPhone);
			rs = ps.executeQuery();

			if (rs.next()) {
				exist = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return exist;
	}
}