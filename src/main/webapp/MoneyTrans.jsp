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
	<h2>Money Transfer</h2>
	<form class="login-form" action="transferServe" method="post">
		<label for="fromAccount">From Account:</label> <input class="form-control" type="text"
			id="fromAccount" name="fromAccount" required><br> <label
			for="toAccount">To Account:</label> <input class="form-control" type="text" id="toAccount"
			name="toAccount" required><br> <label for="amount">Amount:</label>
		<input type="number" id="amount" name="amount" required class="border border-primary"><br>

		<button class="center btn btn-outline-primary" type="submit">Transfer</button>
	</form>

</body>
</html>