<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:include page="Nav.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home Loan</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-9ndCyUa0DKQU7AjntG8MT05BMs85MpIYyfZHhE+o1lFfYj0kIxIDcHSX1zkriQKQ"
          crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
        <h3>Home Loan</h3>
        <p>Apply for a home loan to make your dream home a reality:</p>
        <form action="HomeLoanServlet" method="post">
            <div class="mb-3">
                <label for="loanAmount" class="form-label">Loan Amount</label>
                <input type="number" id="loanAmount" name="loanAmount" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="loanTerm" class="form-label">Loan Term (Years)</label>
                <input type="number" id="loanTerm" name="loanTerm" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="income" class="form-label">Annual Income</label>
                <input type="number" id="income" name="income" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Apply Now</button>
        </form>
    </div>
</body>
</html>
