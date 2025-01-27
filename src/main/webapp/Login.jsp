<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:include page="Nav.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FBI</title>
<link rel="stylesheet" href="custom.css">
</head>
<body>
<form class="login-form" action="Login" method="post">
		<h2>LOGIN FORM</h2>
	<input type="email" class="form-control" placeholder="ENTER THE EMAIL ADDRESS" name="email">
	<input type="password" class="form-control" placeholder="ENTER THE PASSWORD" name="password">
	
	<input type="submit" class="btn btn-outline-dark" value="LOGIN">
	<a href="Reset.jsp" class="btn btn-outline-dark">Reset Password</a>
	</form>
	
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>