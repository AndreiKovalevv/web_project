import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import connectionBD.sqliteConnection;


@WebServlet("/CreateCommentsServlet")
public class CreateCommentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("Cp1251");
		response.setCharacterEncoding("Cp1251");	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("Cp1251");
		response.setCharacterEncoding("Cp1251");
		
		HttpSession session = request.getSession();	

		 String Author =(String) session.getAttribute("loginUser");
		 String Comment = request.getParameter("CommentsSite");
		 String id_entry = request.getParameter("ids"); 
		 try { 
	        	
	        	sqliteConnection connect=new sqliteConnection();  				
	    		
	        	String query = "INSERT INTO Comments (author_comments,comment_comments,Entry_id) VALUES (?, ?,?);";
	        	PreparedStatement statement =connect.dbConnector().prepareStatement(query);
	        	statement.setString(1, Author);
				statement.setString(2, Comment);		
				statement.setString(3, id_entry);
			
				statement.executeUpdate();       			
				JOptionPane.showMessageDialog(null,
		                "Ваш комментарий отправлен. Спасибо!",
		                "Ответ сервера",
		                JOptionPane.INFORMATION_MESSAGE);
				   response.sendRedirect("Comments.jsp?id=" + id_entry);
	    	
	        	}
	        catch (SQLException throwables) 
	        {
	        	JOptionPane.showMessageDialog(null,
		                "Ваш комментарий не отправлен!",
		                "Ответ сервера",
		                JOptionPane.ERROR_MESSAGE);
	        	System.out.println(id_entry);
	        	  throwables.printStackTrace();
	        	  response.sendRedirect("Comments.jsp?id=" + id_entry);	        	       	
	        }
	}

}
