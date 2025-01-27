package master.utilities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
    private Connection cn = null;

    public ConnectionFactory() {
    }

    public Connection getConn() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingdb", "root", "root"); // Ensure 'BankingDB' matches exactly with your DB name
        } catch (ClassNotFoundException var2) {
            var2.printStackTrace();
        } catch (SQLException var3) {
            var3.printStackTrace();
        }
        return this.cn;
    }
}
