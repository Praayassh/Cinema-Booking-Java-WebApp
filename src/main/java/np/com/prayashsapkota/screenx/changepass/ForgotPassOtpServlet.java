package np.com.prayashsapkota.screenx.changepass;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/otppass")
public class ForgotPassOtpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String otp = req.getParameter("otp1");
        HttpSession session = req.getSession();
        String sessionOtp = (String) session.getAttribute("token");

        if (sessionOtp != null && sessionOtp.equals(otp)) {
            session.removeAttribute("token");
            resp.sendRedirect("changepass.jsp");
        } else {
            String message="Incorrect otp.";
            req.setAttribute("message", message);
            req.getRequestDispatcher("/passotp.jsp").forward(req, resp);
        }
    }
}