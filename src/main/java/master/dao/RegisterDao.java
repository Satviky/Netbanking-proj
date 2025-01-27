package master.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import master.dto.RegisterDTO;
import master.utilities.ConnectionFactory;

public class RegisterDao {
	private Connection cn = null;
	private Statement st = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	private String insert_sql = "INSERT INTO Customers (FirstName, LastName, Email, PasswordHash) VALUES (?, ?, ?, ?)";
	private String select_sql = "SELECT * FROM Customers WHERE Email = ?";

	public void insertData(RegisterDTO rdto) {
		try {
			ConnectionFactory con = new ConnectionFactory();
			this.cn = con.getConn();
			if (this.cn != null) {
				System.out.println("Database connection established.");
				this.ps = this.cn.prepareStatement(this.insert_sql);
				this.ps.setString(1, rdto.getFirstName());
				this.ps.setString(2, rdto.getLastName());
				this.ps.setString(3, rdto.getEmail());
				this.ps.setBytes(4, rdto.getPassword().getBytes());

				System.out.println("Preparing to insert data:");
				System.out.println("FirstName: " + rdto.getFirstName());
				System.out.println("LastName: " + rdto.getLastName());
				System.out.println("Email: " + rdto.getEmail());
				System.out.println("PasswordHash: " + new String(rdto.getPassword().getBytes()));

				int rowsAffected = this.ps.executeUpdate();
				System.out.println("Rows affected: " + rowsAffected);
			} else {
				System.err.println("Failed to establish a database connection.");
			}
		} catch (SQLException se) {
			System.err.println("SQL Exception occurred while inserting data.");
			se.printStackTrace();
		} finally {
			closeResources();
		}
	}

	public boolean isAccountValid(String email) {
		boolean isValid = false;
		try {
			ConnectionFactory con = new ConnectionFactory();
			this.cn = con.getConn();
			this.ps = this.cn.prepareStatement(this.select_sql);
			this.ps.setString(1, email);
			this.rs = this.ps.executeQuery();
			if (this.rs.next()) {
				isValid = true;
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			closeResources();
		}
		return isValid;
	}

	public double getBalance(String email) {
		double balance = -1;
		String sql = "SELECT Balance FROM Balances WHERE Email = ?";
		try {
			ConnectionFactory con = new ConnectionFactory();
			this.cn = con.getConn();
			this.ps = this.cn.prepareStatement(sql);
			this.ps.setString(1, email);
			this.rs = this.ps.executeQuery();
			if (this.rs.next()) {
				balance = this.rs.getDouble("Balance");
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			closeResources();
		}
		return balance;
	}

	// Update balance for a given email
	public void updateBalance(String email, double newBalance) {
		String sql = "UPDATE Balances SET Balance = ? WHERE Email = ?";
		try {
			ConnectionFactory con = new ConnectionFactory();
			this.cn = con.getConn();
			this.ps = this.cn.prepareStatement(sql);
			this.ps.setDouble(1, newBalance);
			this.ps.setString(2, email);
			this.ps.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			closeResources();
		}
	}

	// Add a new balance entry for a user
	public void addBalance(String email, double initialBalance) {
		String sql = "INSERT INTO Balances (Email, Balance) VALUES (?, ?)";
		try {
			ConnectionFactory con = new ConnectionFactory();
			this.cn = con.getConn();
			this.ps = this.cn.prepareStatement(sql);
			this.ps.setString(1, email);
			this.ps.setDouble(2, initialBalance);
			this.ps.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			closeResources();
		}
	}

	public boolean checkLogin(String email, String password) {
		boolean flag = false;
		String sql = "SELECT * FROM Customers WHERE Email = ? AND PasswordHash = ?";
		try {
			ConnectionFactory con = new ConnectionFactory();
			cn = con.getConn();
			ps = cn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setBytes(2, password.getBytes());
			rs = ps.executeQuery();
			if (rs.next()) {
				flag = true;
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			closeResources();
		}
		return flag;
	}

	public void updatePassword(String email, String newPassword) {
		String sql = "UPDATE Customers SET PasswordHash = ? WHERE Email = ?";
		try {
			ConnectionFactory con = new ConnectionFactory();
			this.cn = con.getConn();
			this.ps = this.cn.prepareStatement(sql);
			this.ps.setBytes(1, newPassword.getBytes());
			this.ps.setString(2, email);
			this.ps.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			closeResources();
		}
	}

	public RegisterDTO getUserByEmail(String email) throws Exception {
		try (Connection conn = new ConnectionFactory().getConn()) {
			String query = "SELECT firstName, lastName, email FROM customers WHERE email = ?";
			PreparedStatement stmt = conn.prepareStatement(query);
			stmt.setString(1, email);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				RegisterDTO user = new RegisterDTO();
				user.setFirstName(rs.getString("firstName"));
				user.setLastName(rs.getString("lastName"));
				user.setEmail(rs.getString("email"));
				// Ensure all necessary fields are set
				return user;
			} else {
				return null; // User not found
			}
		}
	}

	public void updateProfilePicture(String email, String profilePicturePath) {
		String sql = "UPDATE Customers SET profile_picture_path = ? WHERE email = ?";
		try {
			ConnectionFactory con = new ConnectionFactory();
			this.cn = con.getConn();
			this.ps = this.cn.prepareStatement(sql);
			this.ps.setString(1, profilePicturePath);
			this.ps.setString(2, email);
			this.ps.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			closeResources();
		}
	}

	private void closeResources() {
		try {
			if (rs != null)
				rs.close();
			if (st != null)
				st.close();
			if (ps != null)
				ps.close();
			if (cn != null)
				cn.close();
		} catch (SQLException se) {
			se.printStackTrace();
		}
	}
}
