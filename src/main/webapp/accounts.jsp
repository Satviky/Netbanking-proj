<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="Nav.jsp"></jsp:include>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Account Types</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	integrity="sha384-9ndCyUa0DKQU7AjntG8MT05BMs85MpIYyfZHhE+o1lFfYj0kIxIDcHSX1zkriQKQ"
	crossorigin="anonymous">
</head>
<body>
	<div class="container mt-5">
		<h3>Account Types</h3>
		<p>Explore the various types of accounts we offer to suit your
			financial needs:</p>

		<div class="card mb-3">
			<div class="card-body">
				<h5 class="card-title">Savings Account</h5>
				<p class="card-text">Our Savings Account offers a safe and
					convenient way to save money. Enjoy competitive interest rates and
					easy access to your funds. Ideal for individuals looking to save
					for the future.</p>
					
				<a href="SavingAC.jsp" class="btn btn-primary">Saving Account </a>
			</div>
		</div>

		<div class="card mb-3">
			<div class="card-body">
				<h5 class="card-title">Salary Account</h5>
				<p class="card-text">The Salary Account is designed for salaried
					individuals, providing seamless salary credits and additional
					benefits. Enjoy zero minimum balance requirements and exclusive
					offers tailored for employees.</p>
					
				<a href="SalaryAC" class="btn btn-primary">Salary Account</a>
			</div>
		</div>

		<div class="card mb-3">
			<div class="card-body">
				<h5 class="card-title">Current Account</h5>
				<p class="card-text">Our Current Account caters to businesses
					and professionals, offering a range of features to manage
					day-to-day transactions. Benefit from high transaction limits,
					overdraft facilities, and dedicated business banking services.</p>
					<a href="CurrentAC.jsp" class="btn btn-primary">Current Account</a>
			</div>
		</div>

	</div>
</body>
</html>
