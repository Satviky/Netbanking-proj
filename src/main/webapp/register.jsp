<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
    <jsp:include page="Nav.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<form class="login-form" action="RegisterServe" method="post">
	<h2 class="txt-mid">Register</h2>
		<label for="firstName">First Name:</label> <input class="form-control" type="text"
			id="firstName" name="firstName" required><br> 
		<label
			for="lastName">Last Name:</label> <input class="form-control" type="text" id="lastName"
			name="lastName" required><br> 
			<label for="email">Email:</label>
		<input class="form-control" type="email" id="email" name="email" required><br>
		<label for="password">Password:</label> <input class="form-control" type="password"
			id="password" name="password" required><br>
		<button class="btn btn-outline-dark" type="submit">Register</button>
	</form>
	
	<h6 class="alert alert-danger poppins-medium txt-mid">You Will have to login again in the website.</h6>
</body>
</html>

<jsp:include page="Footer.jsp"></jsp:include>