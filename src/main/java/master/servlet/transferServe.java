package master.servlet;

import master.dao.RegisterDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/transferServe")
public class transferServe extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fromAccount = request.getParameter("fromAccount");
        String toAccount = request.getParameter("toAccount");
        double amount = Double.parseDouble(request.getParameter("amount"));

        RegisterDao registerDao = new RegisterDao();

        try {
            // Check if toAccount exists
            boolean isToAccountValid = registerDao.isAccountValid(toAccount);
            if (!isToAccountValid) {
                response.getWriter().write("The recipient account does not exist.");
                response.sendRedirect("homepg.jsp");
                return;
            }

            // Check fromAccount balance
            double fromBalance = registerDao.getBalance(fromAccount);
            if (fromBalance < amount) {
                response.getWriter().write("Insufficient funds.");
                response.sendRedirect("homepg.jsp");
                return;
            }

            // Perform the transfer
            double toBalance = registerDao.getBalance(toAccount);
            registerDao.updateBalance(fromAccount, fromBalance - amount);
            registerDao.updateBalance(toAccount, toBalance + amount);

            response.getWriter().write("Money Transfer Successful");
            response.sendRedirect("placeholder.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Money Transfer Failed");
        }
    }
}
