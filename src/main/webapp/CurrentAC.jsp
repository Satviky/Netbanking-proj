<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="Nav.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Current Account</title>
<link rel="stylesheet" href="custom.css">
</head>
<body>

	<div class="wrapper">
		<div class="one" id="">
			A current account is designed for businesses and individuals who need
			to perform frequent transactions. It provides features like unlimited
			deposits and withdrawals, overdraft facilities, and easy access to
			funds. Current accounts typically require a higher minimum balance
			and do not earn interest. They are ideal for handling day-to-day
			banking needs and managing operational expenses efficiently.
			<ul>
				<li>Zero Balance Account</li>
				<li>More benefit to the account owner</li>
				<li>Enables business persons to keep the flow of money smooth
					and get and make payments on time.</li>
				<li>Overdraft facilities are available to tide over any
					temporary cash flow issues.</li>
			</ul>
		</div>
		<div class="two">You can open one in any bank by completing
			formalities like submitting PAN card, Certificate of Incorporation,
			address proof of the company, ID and address proof of partners and
			directors etc.</div>
		<div class="three">
			<div>
				<h2>Interested to apply for the Saving Account?</h2>
				<form action="ApplyAccountServlet" method="POST">
					<input type="hidden" name="accountType" value="current">
					<button class="center btn btn-outline-primary" type="submit">Apply
						Now</button>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>