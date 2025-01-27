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

@WebServlet("/resetPassword")
public class ResetPassword extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String captcha = request.getParameter("captcha");
        String correctCaptcha = "12345";
        if (!captcha.equals(correctCaptcha)) {
            response.getWriter().write("Incorrect CAPTCHA.");
            response.sendRedirect("captcha.jsp");
            return;
        }

        String email = (String) request.getSession().getAttribute("email");
        String newPassword = request.getParameter("newPassword");

        RegisterDao registerDao = new RegisterDao();
        boolean isAccountValid = registerDao.isAccountValid(email);
        if (isAccountValid) {
            registerDao.updatePassword(email, newPassword);
            response.getWriter().write("Password has been reset successfully.");
            response.sendRedirect("Login.jsp");
        } else {
            response.getWriter().write("Account does not exist.");
            response.sendRedirect("Reset.jsp");
        }
    }
}
