<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.List"%>
<%@ page import="master.dto.Transaction"%>

<jsp:include page="Nav.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Transaction History</title>
</head>
<body>
    <div class="container mt-5">
        <h3 class="text-center">Transaction History</h3>
        <table class="table table-striped mt-3">
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Type</th>
                    <th>Amount</th>
                    <th>Balance</th>
                </tr>
            </thead>
            <tbody>
                <%
                // Sample data for demonstration (Replace with actual data retrieval logic)
                List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
                if (transactions != null) {
                    for (Transaction transaction : transactions) {
                %>
                        <tr>
                            <td><%= transaction.getDate() %></td>
                            <td><%= transaction.getType() %></td>
                            <td><%= transaction.getAmount() %></td>
                            <td><%= transaction.getBalance() %></td>
                        </tr>
                <%
                    }
                } else {
                %>
                        <tr>
                            <td colspan="4" class="text-center">No transactions found.</td>
                        </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
