<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    <jsp:include page="Nav.jsp"></jsp:include>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Savings Goal Tracker</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-9ndCyUa0DKQU7AjntG8MT05BMs85MpIYyfZHhE+o1lFfYj0kIxIDcHSX1zkriQKQ"
          crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
        <h3>Savings Goal Tracker</h3>
        <p>Set and track your savings goals:</p>
        <form>
            <div class="mb-3">
                <label for="goalName" class="form-label">Goal Name</label>
                <input type="text" id="goalName" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="goalAmount" class="form-label">Goal Amount</label>
                <input type="number" id="goalAmount" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="currentSavings" class="form-label">Current Savings</label>
                <input type="number" id="currentSavings" class="form-control" required>
            </div>
            <button type="button" class="btn btn-primary" onclick="trackGoal()">Track Goal</button>
        </form>
        <div id="goalResult" class="mt-3"></div>
    </div>

    <script>
        function trackGoal() {
            var goalName = document.getElementById('goalName').value;
            var goalAmount = document.getElementById('goalAmount').value;
            var currentSavings = document.getElementById('currentSavings').value;
            var remainingAmount = goalAmount - currentSavings;
            document.getElementById('goalResult').innerHTML = goalName + " Goal: " + remainingAmount.toFixed(2) + " remaining.";
        }
    </script>
</body>
</html>
    