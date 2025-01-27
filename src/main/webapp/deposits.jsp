<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:include page="Nav.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View All Deposits</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-9ndCyUa0DKQU7AjntG8MT05BMs85MpIYyfZHhE+o1lFfYj0kIxIDcHSX1zkriQKQ"
          crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
        <h3>All Deposits</h3>
        <p>Explore our range of deposit options designed to help you save and grow your money:</p>
        <ul>
            <li><a href="fixedDeposit.jsp">Fixed Deposit</a></li>
            <li><a href="recurringDeposit.jsp">Recurring Deposit</a></li>
        </ul>
    </div>
</body>
</html>
