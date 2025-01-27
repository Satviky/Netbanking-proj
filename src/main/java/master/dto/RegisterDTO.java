package master.dto;

import java.util.ArrayList;
import java.util.List;

public class RegisterDTO {
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private String accType;
	private String profilePicturePath;
	private double balance;
	private List<Transaction> transactions;
	private List<SupportTicket> supportTickets;

	public RegisterDTO() {
		this.transactions = new ArrayList<>(); // Initialize the transactions list
		this.supportTickets = new ArrayList<>();
	}

	// Getters and setters
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAccType() {
		return accType;
	}

	public void setAccType(String accType) {
		this.accType = accType;
	}

	public String getProfilePicturePath() {
		return profilePicturePath;
	}

	public void setProfilePicturePath(String profilePicturePath) {
		this.profilePicturePath = profilePicturePath;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public List<Transaction> getTransactions() {
		return transactions;
	}

	public void setTransactions(List<Transaction> transactions) {
		this.transactions = transactions;
	}

	public void addTransaction(Transaction transaction) {
		this.transactions.add(transaction);
	}

	public List<SupportTicket> getSupportTickets() {
		return supportTickets;
	}

	public void setSupportTickets(List<SupportTicket> supportTickets) {
		this.supportTickets = supportTickets;
	}
}
