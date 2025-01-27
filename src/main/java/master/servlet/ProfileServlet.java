package master.servlet;

import master.dto.RegisterDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        RegisterDTO user = (RegisterDTO) session.getAttribute("user");
        String profileImage = user != null ? user.getProfilePicturePath() : null;

        if (profileImage == null || profileImage.isEmpty()) {
            profileImage = "Images/default.png"; // Path to your default image
        }

        request.setAttribute("profileImage", profileImage);
        request.getRequestDispatcher("userProfile.jsp").forward(request, response);
    }
}
