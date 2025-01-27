package master.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/showCaptcha")
public class showCaptcha extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the email from the request
        String email = request.getParameter("email");
        
        // Store the email in the session for later use
        request.getSession().setAttribute("email", email);
        
        // Redirect the user to the CAPTCHA page
        response.sendRedirect("captcha.jsp");
    }
}
