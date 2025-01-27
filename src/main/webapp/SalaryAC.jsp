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
			A salary account is a type of bank account designed for employees to
			receive their salaries. These accounts typically offer benefits such
			as zero minimum balance, easy access to funds via ATMs, and special
			privileges like discounted loans and credit cards. Employers directly
			deposit salaries into these accounts, ensuring a hassle-free banking
			experience for employees. Salary accounts often come with additional
			perks and services tailored to the employee's needs.
			<ul>
				<li>Zero Balance Account</li>
				<li>More benefit to the account owner</li>
			</ul>
		</div>
		<div class="two">Salary Accounts are a convenient way of paying
			the monthly salaries from the employer to the employee. It not only
			makes it easy for the employer, but also gives Salary Account
			benefits to the employee.</div>
		<div class="three">
			<div>
				<h2>Interested to apply for the Saving Account?</h2>
				<form action="ApplyAccountServlet" method="POST">
					<input type="hidden" name="accountType" value="salary">
					<button class="center btn btn-outline-primary" type="submit">Apply
						Now</button>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>