package master.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/UserProfile")
public class profiledet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String profileImage = (String) session.getAttribute("profileImage");
        String userName = (String) session.getAttribute("userName");
        String userEmail = (String) session.getAttribute("userEmail");
        Double userBalance = (Double) session.getAttribute("userBalance");

        if (profileImage == null || profileImage.isEmpty()) {
            profileImage = "default.jpg"; // Path to your default image
        }

        request.setAttribute("profileImage", profileImage);
        request.setAttribute("userName", userName);
        request.setAttribute("userEmail", userEmail);
        request.setAttribute("userBalance", userBalance);

        request.getRequestDispatcher("userProfile.jsp").forward(request, response);
    }
}
