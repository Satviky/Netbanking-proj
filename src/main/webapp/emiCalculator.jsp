<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:include page="Nav.jsp"></jsp:include>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EMI Calculator</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-9ndCyUa0DKQU7AjntG8MT05BMs85MpIYyfZHhE+o1lFfYj0kIxIDcHSX1zkriQKQ"
          crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
        <h3>EMI Calculator</h3>
        <p>Calculate your loan EMIs easily:</p>
        <form>
            <div class="mb-3">
                <label for="loanAmount" class="form-label">Loan Amount</label>
                <input type="number" id="loanAmount" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="interestRate" class="form-label">Interest Rate (%)</label>
                <input type="number" id="interestRate" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="loanTenure" class="form-label">Loan Tenure (Years)</label>
                <input type="number" id="loanTenure" class="form-control" required>
            </div>
            <button type="button" class="btn btn-primary" onclick="calculateEMI()">Calculate EMI</button>
        </form>
        <div id="emiResult" class="mt-3"></div>
    </div>

    <script>
        function calculateEMI() {
            var principal = document.getElementById('loanAmount').value;
            var rateOfInterest = document.getElementById('interestRate').value / 12 / 100;
            var tenure = document.getElementById('loanTenure').value * 12;
            var emi = principal * rateOfInterest * (Math.pow(1 + rateOfInterest, tenure)) / (Math.pow(1 + rateOfInterest, tenure) - 1);
            document.getElementById('emiResult').innerHTML = "Monthly EMI: &#8377;" + emi.toFixed(2);
        }
    </script>
</body>
</html>
    