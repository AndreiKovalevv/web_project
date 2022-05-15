import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import connectionBD.sqliteConnection;

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("Cp1251");
		response.setCharacterEncoding("Cp1251");
		
		String logins = request.getParameter("Login");     
        String passwords = request.getParameter("Password");
        String UserName = request.getParameter("UserName");     
        String UserSurname = request.getParameter("UserSurname");
        String UserCountru = request.getParameter("UserCountru");     
        String UserGender = request.getParameter("UserGender");
        String UserPhone = request.getParameter("UserPhone");     
        String UserTown = request.getParameter("UserTown");
        String UserEmail = request.getParameter("UserEmail");     
        String UserAge = request.getParameter("UserAge");
		
        try { 
        	
        	sqliteConnection connect=new sqliteConnection();  				
    		
        	String query = "INSERT INTO UserInfo (loginUser, passwordUser,nameUser,surnameUser,countruUser,genderUser,phoneUser,townUser,emailUser,ageUser) VALUES (?, ?,?,?,?,?,?,?,?,?);";
        	PreparedStatement statement =connect.dbConnector().prepareStatement(query);
        	statement.setString(1, logins);
			statement.setString(2, passwords);		
			statement.setString(3, UserName);
			statement.setString(4, UserSurname);	
			statement.setString(5, UserCountru);
			statement.setString(6, UserGender);	
			statement.setString(7, UserPhone);
			statement.setString(8, UserTown);	
			statement.setString(9, UserEmail);
			statement.setString(10, UserAge);	
			statement.executeUpdate();       			
    			
			JOptionPane.showMessageDialog(null,
	                "Регистрация прошла успешно. Спасибо!",
	                "Ответ сервера",
	                JOptionPane.INFORMATION_MESSAGE);
			   response.sendRedirect("Home.jsp");    		
        	}
        catch (SQLException throwables) 
        {
        	JOptionPane.showMessageDialog(null,
	                "Регистрация не прошла!",
	                "Ответ сервера",
	                JOptionPane.ERROR_MESSAGE);
			response.sendRedirect("Registration.jsp");
        	throwables.printStackTrace();
        	
        }
       
       
	}

}
