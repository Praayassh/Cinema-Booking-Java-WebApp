package np.com.prayashsapkota.screenx.register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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

@WebServlet("/verify")
public class VerifyEmailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    Connection con = null;
    PreparedStatement ps = null;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String action = req.getParameter("action");

        if ("verify".equals(action)) {
            handleVerification(req, resp, session);
        } else if ("resend".equals(action)) {
            handleResend(req, resp, session);
        }
    }

    private void handleVerification(HttpServletRequest req, HttpServletResponse resp, HttpSession session)
            throws ServletException, IOException {
        String token = req.getParameter("token");
        String sessionToken = (String) session.getAttribute("token");

        if (token != null && token.equals(sessionToken)) {
            String phone = (String) session.getAttribute("phone");
            String fullname = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
            String password = (String) session.getAttribute("pass");

            if (fullname != null && email != null && phone != null && password != null) {
                try {
                    con = DBConnection.getConnection();
                    String insert = "INSERT INTO register (phone, fullname, email, password) VALUES (?, ?, ?, ?)";
                    ps = con.prepareStatement(insert);
                    ps.setString(1, phone);
                    ps.setString(2, fullname);
                    ps.setString(3, email);
                    ps.setString(4, password);
                    int count = ps.executeUpdate();

                    if (count > 0) {
                        req.setAttribute("message", "Verification successful!");
                        req.getRequestDispatcher("/verificationsuccess.jsp").forward(req, resp);
                    } else {
                        req.setAttribute("error", "Registration failed. Please try again.");
                        req.getRequestDispatcher("/register.jsp").forward(req, resp);
                    }
                } catch (SQLException e) {
                    e.printStackTrace(); // Print the stack trace for debugging
                    req.setAttribute("error", "Database error: " + e.getMessage()); // Show the actual SQL exception
                    req.getRequestDispatcher("/register.jsp").forward(req, resp);
                } finally {
                    try {
                        if (ps != null) ps.close();
                        if (con != null) con.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            } else {
                req.setAttribute("error", "Missing registration information.");
                req.getRequestDispatcher("/register.jsp").forward(req, resp);
            }
            session.invalidate();
        } else {
            req.setAttribute("error", "Invalid verification token.");
            req.getRequestDispatcher("/verification.jsp").forward(req, resp);
        }
    }

    private void handleResend(HttpServletRequest req, HttpServletResponse resp, HttpSession session)
            throws ServletException, IOException {
        String email = (String) session.getAttribute("email");
        String token = generateToken();
        session.setAttribute("token", token);

        try {
            sendVerificationEmail(email, token);
            req.setAttribute("message", "Verification code has been resent.");
        } catch (MessagingException e) {
            e.printStackTrace(); // Print the stack trace for debugging
            req.setAttribute("error", "Failed to resend verification email. " + e.getMessage());
        }

        req.getRequestDispatcher("/verification.jsp").forward(req, resp);
    }

    private String generateToken() {
        Random random = new Random();
        int token = random.nextInt(900000) + 100000;
        return String.valueOf(token);
    }

    private void sendVerificationEmail(String email, String token) throws MessagingException {
        String host = "smtp.gmail.com";
        String from = "YOOUR_EMAIL";                      //CHANGE EMAIL
        String pass = "YOUR IN APP PASSWORD";             // CHANGE PASSWORD

        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        message.setFrom(new InternetAddress(from));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
        message.setSubject("Email Verification");
        message.setText("Please verify your email with the following token: " + token);

        Transport transport = session.getTransport("smtp");
        transport.connect(host, from, pass);
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
    }
}