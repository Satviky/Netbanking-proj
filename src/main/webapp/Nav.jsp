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
				<a class="navbar-brand"> <img class="logo-inv"
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
								src="<%= profileImage != null ? profileImage : "Images/default.png" %>"
								alt="&#128640;" style="border-radius:50px">

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
						<li><a class="dropdown-item" href="fd.jsp">Fixed
								Deposit</a></li>
						<li><a class="dropdown-item" href="recDep.jsp">Recurring
								Deposit</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="deposits.jsp">View
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
						<li><a class="dropdown-item" href="placeholder.jsp">Private Banking</a></li>
						<li><a class="dropdown-item" href="transactionHistory.jsp">Transaction History</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="placeholder.jsp">View all Options</a></li>
					</ul></li>
				<li class="nav-item"><a class="nav-link" href="supportTickets.jsp">Support</a></li>
				<li class="nav-item"><a class="nav-link disabled"
					aria-disabled="true">Live Support</a></li>
			</ul>
		</nav>

	</header>


	<!-- JavaScript at the end of the body for improved loading speed -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>


</body>


</html>
