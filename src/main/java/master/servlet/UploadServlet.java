package master.servlet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import master.dto.RegisterDTO;
import master.dao.RegisterDao;
import javax.servlet.annotation.MultipartConfig;

@WebServlet("/UploadServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1MB
		maxFileSize = 1024 * 1024 * 5, // 5MB
		maxRequestSize = 1024 * 1024 * 10 // 10MB
)
public class UploadServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		RegisterDTO user = (RegisterDTO) session.getAttribute("user");

		if (user != null) {
			Part filePart = request.getPart("profileImage");
			String fileName = getFileName(filePart);
			String basePath = getServletContext().getRealPath("/") + "uploadedFiles" + File.separator + user.getEmail();
			File uploadDir = new File(basePath);

			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}

			String savePath = basePath + File.separator + fileName;
			filePart.write(savePath);

			// Save the path to the database
			String profilePicturePath = "uploadedFiles/" + user.getEmail() + "/" + fileName;
			RegisterDao registerDao = new RegisterDao();
			registerDao.updateProfilePicture(user.getEmail(), profilePicturePath);

			// Update the session attribute
			user.setProfilePicturePath(profilePicturePath);
			session.setAttribute("user", user);

			// Redirect to profile page with success message
			response.sendRedirect("ProfileServlet?success=Profile picture updated successfully");
		} else {
			response.sendRedirect("ProfileServlet?error=User not logged in");
		}
	}

	private String getFileName(Part part) {
		for (String cd : part.getHeader("content-disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				String filename = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
				return filename;
			}
		}
		return null;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		RegisterDTO user = (RegisterDTO) session.getAttribute("user");
		String profileImage = (String) session.getAttribute("profileImage");

		if (profileImage == null || profileImage.isEmpty()) {
			profileImage = "Images/default.png"; // Path to your default image
		}

		request.setAttribute("profileImage", profileImage);
		request.getRequestDispatcher("userProfile.jsp").forward(request, response);
	}
}
