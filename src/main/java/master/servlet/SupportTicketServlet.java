package master.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import master.dto.RegisterDTO;
import master.dto.SupportTicket;

@WebServlet("/SupportTicketServlet")
public class SupportTicketServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        RegisterDTO user = (RegisterDTO) session.getAttribute("user");

        String subject = request.getParameter("subject");
        String description = request.getParameter("description");

        // Create a new support ticket
        SupportTicket ticket = new SupportTicket();
        ticket.setId(generateTicketId()); // Implement a method to generate unique ticket IDs
        ticket.setSubject(subject);
        ticket.setDescription(description);
        ticket.setStatus("Open");

        // Add the ticket to the user's list of tickets
        if (user.getSupportTickets() == null) {
            user.setSupportTickets(new ArrayList<>());
        }
        user.getSupportTickets().add(ticket);

        // Update the session with the new list of tickets
        session.setAttribute("user", user);

        // Redirect to the support tickets page
        response.sendRedirect("supportTickets.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        RegisterDTO user = (RegisterDTO) session.getAttribute("user");

        // Set the user's tickets as a request attribute
        request.setAttribute("tickets", user.getSupportTickets());

        // Forward to the support tickets JSP
        request.getRequestDispatcher("supportTickets.jsp").forward(request, response);
    }

    private int generateTicketId() {
        // Implement a method to generate unique ticket IDs
        return (int) (Math.random() * 10000);
    }
}
