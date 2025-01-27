package master.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.dao.RegisterDao;
import master.dto.RegisterDTO;

/**
 * Servlet implementation class RegisterServe
 */


@WebServlet("/RegisterServe")
public class RegisterServe extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        System.out.println("Received data: " + firstName + ", " + lastName + ", " + email);

        RegisterDTO rdto = new RegisterDTO();
        rdto.setFirstName(firstName);
        rdto.setLastName(lastName);
        rdto.setEmail(email);
        rdto.setPassword(password);

        RegisterDao rdao = new RegisterDao();
        try {
            rdao.insertData(rdto);
            response.getWriter().write("Registration Successful");
            response.sendRedirect("test.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Registration Failed");
        }
    }
}
