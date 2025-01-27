<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ page import="master.dto.RegisterDTO"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
    HttpSession userSession = request.getSession(false); // Get existing session without creating a new one
    RegisterDTO user = null;
    String profileImage = "Images/default.png"; // Default image

    if (userSession != null) {
        user = (RegisterDTO) userSession.getAttribute("user");
        if (user != null) {
            profileImage = user.getProfilePicturePath();
            if (profileImage == null || profileImage.isEmpty()) {
                profileImage = "Images/default.png"; // Default image
            } else {
                profileImage = request.getContextPath() + "/" + profileImage;
            }
        }
    }

    // Debug statements to check paths
    System.out.println("User: " + (user != null ? user.getEmail() : "No user"));
    System.out.println("Profile Image Path: " + profileImage);
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NextGen</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link rel="stylesheet" href="custom.css">
</head>
<body>
	<header>
		<nav class="navbar">
			<div class="container-fluid">
				<a class="navbar-brand"> <img
					src="Images/logo.svg" alt="" width="30"
					height="24" class="d-inline-block align-text-top"> Finance
					Bank Of India
				</a>
				<div class="d-flex">
					<form class="d-flex" role="search">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
					<a href="userProfile.jsp">
						<div class="profile-picture circle">
							<!-- <img id="profileImg"
								src="<%=request.getAttribute("profileImage")%>"
								alt="&#128640;">
						 -->

							<img id="profileImg"
								src="<%=profileImage != null ? profileImage : "Images/default.png"%>"
								alt="&#128640;" style="border-radius: 50px">

						</div>
					</a>
				</div>

			</div>
		</nav>

		<nav>
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="homepg.jsp">Home Page</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
					role="button" aria-expanded="false">Account</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="SavingAC.jsp">Saving
								Account</a></li>
						<li><a class="dropdown-item" href="CurrentAC.jsp">Current
								Account</a></li>
						<li><a class="dropdown-item" href="SalaryAC.jsp">Salary
								Account</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
					role="button" aria-expanded="false">Deposits</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="placeholder.jsp">Fixed
								Deposit</a></li>
						<li><a class="dropdown-item" href="placeholder.jsp">Recurring
								Deposit</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#placeholder.jsp">View
								all Deposits</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
					role="button" aria-expanded="false">Payment</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="MoneyTrans.jsp">Money
								transfer</a></li>
						<li><a class="dropdown-item" href="billPayment.jsp">Bill
								Payment and Recharges</a></li>
						<li><a class="dropdown-item" href="placeholder.jsp">Tax
								Payment</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="placeholder.jsp">View
								all Payment Options</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="placeholder.jsp"
					role="button" aria-expanded="false">Tools</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="emiCalculator.jsp">Emi Calculator</a></li>
						<li><a class="dropdown-item" href="sgt.jsp"> Saving Goal tracker
								</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="tools.jsp">View all tools</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
					role="button" aria-expanded="false">Loans</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="pLoan.jsp">Personal Loan</a></li>
						<li><a class="dropdown-item" href="homeLoan.jsp">Home Loan</a></li>
						<li><a class="dropdown-item" href="carloan.jsp">Car Loan</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="loanover.jsp">View all options.</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
					role="button" aria-expanded="false">Special Services</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="transactionHistory.jsp">Transaction
								History</a></li>
						<li><a class="dropdown-item" href="placeholder.jsp">Mutual Fund</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="insurance.jsp">Insurance</a></li>
						<li><a class="dropdown-item" href="placeholder.jsp">View
								all Options</a></li>
					</ul></li>

				<li class="nav-item"><a class="btn btn-success"
					href="Login.jsp">Login</a></li>

				<li class="nav-item"><a class=" btn btn-danger"
					href="register.jsp">Register</a></li>

			</ul>
		</nav>

	</header>

	<div class="test-wrapper">
		<div class="test-one">
			<div class="card" style="width: 18rem;">
				<img class="card-img-top" src="Images/bank_account_1.jpeg" alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Create Account</h5>
					<p class="card-text">Check some of the account types offered by us at FBI.</p>
					<a href="accounts.jsp" class="btn btn-primary">Home Page</a>
				</div>
			</div>
		</div>
		<div class="test-two">
			<div class="card" style="width: 18rem;">
				<img class="card-img-top" src="Images/payment-r1.png" alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Want to make payment?</h5>
					<p class="card-text">Pay efficiently and securely using our payment services</p>
					<a href="MoneyTrans.jsp" class="btn btn-primary">It's Payment Time.</a>
				</div>
			</div>
		</div>
		<div class="test-three">
			<div class="card" style="width: 18rem;">
				<img class="card-img-top" src="Images/saving1.jpeg" alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Tools</h5>
					<p class="card-text">We offer some User-Friendly tools at FBI</p>
					<a href="tools.jsp" class="btn btn-primary">User Friendly Tool</a>
				</div>
			</div>
		</div>
		<div class="test-four">
			<div class="card" style="width: 18rem;">
				<img class="card-img-top" src="Images/bank_2.jpeg" alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Profile</h5>
					<p class="card-text">Customize your banking profile and feel good.</p>
					<a href="userProfile.jsp" class="btn btn-primary">Profile</a>
				</div>
			</div>
		</div>
		<div class="test-five">
			<div class="card" style="width: 18rem;">
				<img class="card-img-top" src="Images/payment_making.jpeg" alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Bill payment or recharge</h5>
					<p class="card-text">Forgot to pay your bill?We got that covered for you.</p>
					<a href="billPayment.jsp" class="btn btn-primary">Bill payment</a>
				</div>
			</div>
		</div>
		<div class="test-six">
			<div class="card" style="width: 18rem;">
				<img class="card-img-top" src="Images/cust_sup.jpeg" alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Have a complain?</h5>
					<p class="card-text">Raise a ticket and make yourself heard.</p>
					<a href="supportTickets.jsp" class="btn btn-primary">Raise a ticket</a>
				</div>
			</div>
		</div>
	</div>



	<!-- JavaScript at the end of the body for improved loading speed -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>


</body>


</html>
