<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<jsp:include page="Nav.jsp"></jsp:include>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Profile Picture</title>
</head>
<body>
    <div class="container">
        <h1>Update Profile Picture</h1>
        <form action="UploadServlet" method="POST" enctype="multipart/form-data">
            <input class="btn btn-primary" type="file" name="profileImage" accept="image/*" required>
            <button class="btn btn-primary" type="submit">Upload</button>
        </form>
    </div>
</body>
</html>
