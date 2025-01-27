<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="master.dto.RegisterDTO" %>
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

<jsp:include page="Nav.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Profile</title>
</head>
<body>
    <div class="container mt-5">
        <div class="card mx-auto" style="max-width: 500px;">
            <div class="card-header text-center">
                <h3>User Profile</h3>
            </div>
            <div class="card-body text-center">
                <%
                if (session.getAttribute("errorMessage") != null) {
                %>
                <div class="alert alert-danger"><%=session.getAttribute("errorMessage")%></div>
                <%
                session.removeAttribute("errorMessage");
                %>
                <%
                }
                %>
                <%
                if (session.getAttribute("successMessage") != null) {
                %>
                <div class="alert alert-success"><%=session.getAttribute("successMessage")%></div>
                <%
                session.removeAttribute("successMessage");
                %>
                <%
                }
                %>
                <div class="profile-picture mb-3 pp-div">
                    <img id="profileImg" src="<%= profileImage %>" alt="Profile Picture">
                </div>
                <%
                if (user != null) {
                %>
                <h5><%=user.getFirstName()%>
                    <%=user.getLastName()%></h5>
                <p>
                    <strong>Email:</strong>
                    <%=user.getEmail()%></p>
                <%
                } else {
                %>
                <p>No user details found.</p>
                <%
                }
                %>

                <a href="TransactionHistoryServlet" class="btn btn-primary">View
                    Transaction History</a> <a href="updateProfile.jsp"
                    class="btn btn-primary">Update Profile</a>
            </div>
        </div>
    </div>
</body>
</html>
