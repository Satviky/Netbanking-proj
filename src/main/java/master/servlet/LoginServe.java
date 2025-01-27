package master.servlet;

import master.dao.RegisterDao;
import master.dto.RegisterDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Login")
public class LoginServe extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        RegisterDao registerDao = new RegisterDao();
        try {
            boolean isValidUser = registerDao.checkLogin(email, password);
            if (isValidUser) {
                HttpSession session = request.getSession();
                RegisterDTO user = registerDao.getUserByEmail(email); // Fetch user details
                session.setAttribute("user", user);

                // Redirect to profile.jsp
                response.sendRedirect("userProfile.jsp");
            } else {
                // Redirect to login page with error message
                response.sendRedirect("login.jsp?error=Invalid Email or Password");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=Login Failed");
        }
    }
}
