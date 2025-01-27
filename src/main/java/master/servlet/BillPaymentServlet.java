package master.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import master.dto.RegisterDTO;
import master.dto.Transaction;

@WebServlet("/BillPaymentServlet")
public class BillPaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        RegisterDTO user = (RegisterDTO) session.getAttribute("user");

        String billType = request.getParameter("billType");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String billNumber = request.getParameter("billNumber");

        // Deduct the amount from the user's account balance (for demonstration purposes)
        double newBalance = user.getBalance() - amount;
        user.setBalance(newBalance);

        // Update the session with the new balance
        session.setAttribute("user", user);

        // Redirect to confirmation page
        response.sendRedirect("paymentConfirmation.jsp");
    }
}
