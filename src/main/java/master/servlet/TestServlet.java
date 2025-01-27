package master.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BankingDB", "root", "root");
            if (cn != null) {
                String insert_sql = "INSERT INTO Customers (FirstName, LastName, Email, PasswordHash) VALUES ('Test', 'User', 'testuser@example.com', 'password123')";
                PreparedStatement ps = cn.prepareStatement(insert_sql);
                int rowsAffected = ps.executeUpdate();
                response.getWriter().write("Rows affected: " + rowsAffected);
                ps.close();
                cn.close();
            } else {
                response.getWriter().write("Failed to connect to the database.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().write("An error occurred: " + e.getMessage());
        }
    }
}
