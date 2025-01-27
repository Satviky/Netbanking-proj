<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="Nav.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Saving Account</title>
<link rel="stylesheet" href="custom.css">
</head>
<body>

	<div class="wrapper">
		<div class="one" id="faq1">A Savings Account is a fundamental
			financial product offered by FBI, designed to help individuals save
			and grow their money. With FBI Savings Account, customers can
			experience the convenience of easy access to their funds, competitive
			interest rates and a range of Digital Banking services. Start your
			journey towards saving money with FBI Savings Account today.
			<h3>Benefits</h3>
			<ul>
  <li> Interest Rates ranging from 3% to 7% </li>
  <li> Saving account allows account holder to link it with fixed deposit within the same bank, maximising their investment option. </li>
</ul>
</div>
		<div class="two">Received a paycheck? Wanna spend it all? How about creating a saving account, 
		a fantastic tool to manage your finances.</div>
		<div class="three">
			<div>
				<h2>Interested to apply for the Saving Account?</h2>
				<h6>What are you waiting for?</h6>
				<form action="ApplyAccountServlet" method="POST">
					<input type="hidden" name="accountType" value="savings">
					<button class="center btn btn-outline-primary" type="submit">Apply Now</button>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>