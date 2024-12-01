
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB_Connection {

    private static final String URL = "jdbc:mysql://localhost:3306/HY360_Project_2025";
    private static final String USER = "root"; // Default XAMPP user
    private static final String PASSWORD = ""; // Leave blank if no password

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
