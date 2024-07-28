package np.com.prayashsapkota.screenx.productpage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/book")
public class BookTicketServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String location = request.getParameter("location");
        String cinema = request.getParameter("cinema");
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        if (location == null || location.isEmpty() ||
            cinema == null   || cinema.isEmpty()   ||
            date == null     || date.isEmpty()     ||
            time == null     || time.isEmpty()) {
            
            request.setAttribute("errorMessage", "All fields are required. Please fill in all fields.");
            request.getRequestDispatcher("productpage.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("location", location);
            session.setAttribute("cinema", cinema);
            session.setAttribute("date", date);
            session.setAttribute("time", time);

            response.sendRedirect("ticketbook.jsp");
        }
    }
}