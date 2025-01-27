<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List"%>
<%@ page import="master.dto.SupportTicket"%>
    
    <jsp:include page="Nav.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Support Tickets</title>
</head>
<body>
    <div class="container mt-5">
        <h3>Support Tickets</h3>
        <p>Submit and track your support requests:</p>
        <form action="SupportTicketServlet" method="post">
            <div class="mb-3">
                <label for="ticketSubject" class="form-label">Subject</label>
                <input type="text" id="ticketSubject" name="subject" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="ticketDescription" class="form-label">Description</label>
                <textarea id="ticketDescription" name="description" class="form-control" rows="4" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Submit Ticket</button>
        </form>
        <h4 class="mt-5">Your Support Tickets</h4>
        <table class="table table-striped mt-3">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Subject</th>
                    <th>Description</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                List<SupportTicket> tickets = (List<SupportTicket>) request.getAttribute("tickets");
                if (tickets != null) {
                    for (SupportTicket ticket : tickets) {
                %>
                        <tr>
                            <td><%= ticket.getId() %></td>
                            <td><%= ticket.getSubject() %></td>
                            <td><%= ticket.getDescription() %></td>
                            <td><%= ticket.getStatus() %></td>
                        </tr>
                <%
                    }
                } else {
                %>
                        <tr>
                            <td colspan="4" class="text-center">No tickets found.</td>
                        </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
    