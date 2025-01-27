package master.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import master.utilities.ConnectionFactory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/ApplyAccountServlet")
public class ApplyAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountType = request.getParameter("accountType");
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        try (Connection conn = new ConnectionFactory().getConn() ){
            // Check if the user's account type is already set
            String checkQuery = "SELECT acc_type FROM customers WHERE email = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
            checkStmt.setString(1, email);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                String existingAccountType = rs.getString("acc_type");

                if (existingAccountType != null && !existingAccountType.isEmpty()) {
                    // User already has an account type
                    session.setAttribute("errorMessage", "You already have a " + existingAccountType + " account.");
                    response.sendRedirect("userProfile.jsp");
                } else {
                    // User does not have an account type, proceed with updating it
                    String updateQuery = "UPDATE customers SET acc_type = ? WHERE email = ?";
                    PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
                    updateStmt.setString(1, accountType);
                    updateStmt.setString(2, email);
                    updateStmt.executeUpdate();

                    session.setAttribute("successMessage", "Successfully applied for a " + accountType + " account.");
                    response.sendRedirect("userProfile.jsp");
                }
            } else {
                // Edge case: User not found in the table
                session.setAttribute("errorMessage", "User not found.");
                response.sendRedirect("userProfile.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "An error occurred while processing your application.");
            response.sendRedirect("userProfile.jsp");
        }
    }
}
