package master.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import master.dto.RegisterDTO;
import master.dto.Transaction;

@WebServlet("/TransactionHistoryServlet")
public class TransactionHistoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        RegisterDTO user = (RegisterDTO) session.getAttribute("user");

        // For demonstration, create sample transactions (Replace with actual data retrieval)
        List<Transaction> transactions = user.getTransactions(); // Assuming RegisterDTO has a method to get transactions

        request.setAttribute("transactions", transactions);
        request.getRequestDispatcher("transactionHistory.jsp").forward(request, response);
    }
}
