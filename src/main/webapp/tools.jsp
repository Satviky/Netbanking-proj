<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="Nav.jsp"></jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Tools</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	integrity="sha384-9ndCyUa0DKQU7AjntG8MT05BMs85MpIYyfZHhE+o1lFfYj0kIxIDcHSX1zkriQKQ"
	crossorigin="anonymous">
</head>
<body>
	<div class="container mt-5">
		<h3>Financial Tools</h3>
		<p>Explore our user-friendly tools designed to help you manage
			your finances effectively:</p>

		<div class="card mb-3">
			<div class="card-body">
				<h5 class="card-title">EMI Calculator</h5>
				<p class="card-text">Use our EMI Calculator to estimate your
					monthly loan installments. Simply enter the loan amount, interest
					rate, and loan tenure to calculate your EMIs.</p>
				<a href="emiCalculator.jsp" class="btn btn-primary">Use EMI
					Calculator</a>
			</div>
		</div>

		<div class="card mb-3">
			<div class="card-body">
				<h5 class="card-title">Savings Goal Tracker</h5>
				<p class="card-text">Track your savings goals and stay on top of
					your financial planning. Enter your goal amount, current savings,
					and monitor your progress.</p>
				<a href="sgt.jsp" class="btn btn-primary">Track
					Your Savings Goals</a>
			</div>
		</div>

	</div>
</body>
</html>
