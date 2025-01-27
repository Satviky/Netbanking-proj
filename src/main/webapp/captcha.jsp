<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	
    <jsp:include page="Nav.jsp"></jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Solve CAPTCHA</title>
</head>
<body>
	<h2>Solve CAPTCHA</h2>
	<form action="resetPassword" method="post">
		<label for="captcha">Enter the text shown in the image:</label> <input
			type="text" id="captcha" name="captcha" required><br> <img
			src="captchaImage.png" alt="CAPTCHA Image"><br> <label
			for="newPassword">New Password:</label> <input type="password"
			id="newPassword" name="newPassword" required><br>
		<button type="submit">Submit</button>
	</form>
	
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
