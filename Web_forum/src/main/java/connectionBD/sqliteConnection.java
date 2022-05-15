package connectionBD;
import java.sql.Connection;
import java.sql.*;
import java.sql.DriverManager;

public class sqliteConnection {	
	Connection conn = null;
	String url = "jdbc:sqlite:C:/Users/vagne/eclipse-workspace/Web_forum/src/main/dataBase/BD.db";
	
	
	public Connection dbConnector() throws SQLException {
		try {
			Class.forName("org.sqlite.JDBC");
			conn = DriverManager.getConnection(url);
			
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
