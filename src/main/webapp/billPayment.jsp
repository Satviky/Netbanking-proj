<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<jsp:include page="Nav.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bill Payment</title>
</head>
<body>
    <div class="container mt-5">
        <div class="card mx-auto" style="max-width: 600px;">
            <div class="card-header text-center">
                <h3>Bill Payment</h3>
            </div>
            <div class="card-body">
                <form action="BillPaymentServlet" method="post">
                    <div class="mb-3">
                        <label for="billType" class="form-label">Bill Type</label>
                        <select id="billType" name="billType" class="form-select">
                            <option value="Electricity">Electricity</option>
                            <option value="Water">Water</option>
                            <option value="Internet">Internet</option>
                            <option value="Phone">Phone</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="amount" class="form-label">Amount</label>
                        <input type="number" id="amount" name="amount" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="billNumber" class="form-label">Bill Number</label>
                        <input type="text" id="billNumber" name="billNumber" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Pay Bill</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>

<jsp:include page="Footer.jsp"></jsp:include>
    