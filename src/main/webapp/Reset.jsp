<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:include page="Nav.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Password Reset</title>
</head>
<body>
    <h2>Reset Password</h2>
    <form action="showCaptcha" method="post">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>
        <button type="submit">Reset Password</button>
    </form>

<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
    