import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.swing.JOptionPane;

import connectionBD.sqliteConnection;

@WebServlet("/CreateEntryServlet")
public class CreateEntryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("Cp1251");
		response.setCharacterEncoding("Cp1251");		
		 String EntryTitleS = request.getParameter("EntryTitleSite");
		 String EntryS = request.getParameter("EntrySite"); 
		 try { 	        	
	        	sqliteConnection connect=new sqliteConnection();  	    		
	        	String query = "INSERT INTO Entry (title_entry,content_entry) VALUES (?, ?);";
	        	PreparedStatement statement =connect.dbConnector().prepareStatement(query);
	        	statement.setString(1, EntryTitleS);
				statement.setString(2, EntryS);		
			
				statement.executeUpdate();       			
				JOptionPane.showMessageDialog(null,
		                "Ваш комментарий отправлен. Спасибо!",
		                "Ответ сервера",
		                JOptionPane.INFORMATION_MESSAGE);
				   response.sendRedirect("Home.jsp");	    	
	        	}
	        catch (SQLException throwables) 
	        {
	        	JOptionPane.showMessageDialog(null,
		                "Ваш комментарий не отправлен!",
		                "Ответ сервера",
		                JOptionPane.ERROR_MESSAGE);	   
	        	  throwables.printStackTrace();
	        	  response.sendRedirect("Home.jsp" );	        	       	
	        }
	}

	

}
