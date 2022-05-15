package connectionBD;
import java.sql.Connection;
import java.sql.*;
import java.sql.DriverManager;

public class sqliteConnection {	
	Connection conn = null;
	String	server = "localhost";	
	String user = "root";
	String password = "Kirito14";
	  String url = "jdbc:mysql://localhost/bd";

	
	
	public Connection dbConnector() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
;
			conn = DriverManager.getConnection(url,user,password);
			System.out.println("Connection succesfull!");
			return conn;
			
		} 
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("Кошмар");
			return null;
		}
	}
}
