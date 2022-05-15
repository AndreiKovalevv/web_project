import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import connectionBD.sqliteConnection;

@WebServlet("/TehServlet")
public class TehServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	

		request.setCharacterEncoding("Cp1251");
		response.setCharacterEncoding("Cp1251");
		
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
        String cookieName = "email_User";
        Cookie cookie = null;
        if(cookies !=null) {
            for(Cookie c: cookies) {
                if(cookieName.equals(c.getName())) {
                    cookie = c;
                    break;
                }
            }
        }
		
		 String Question = request.getParameter("QuestionSite");
		 String Login =(String) session.getAttribute("loginUser");
		 String Email = (String) cookie.getValue();
		
		 try { 
	        	
	        	sqliteConnection connect=new sqliteConnection();  				
	    		
	        	String query = "INSERT INTO UserQuestion (LoginBD, QuestiomBD,EmailBDUser) VALUES (?, ?,?);";
	        	PreparedStatement statement =connect.dbConnector().prepareStatement(query);
	        	statement.setString(1, Login);
				statement.setString(2, Question);				
				statement.setString(3, Email);		
				
				statement.executeUpdate();       			
				JOptionPane.showMessageDialog(null,
		                "Ваш вопрос отправлен. Спасибо!",
		                "Ответ сервера",
		                JOptionPane.INFORMATION_MESSAGE);
				   response.sendRedirect("TehHelp.jsp");
	    	
	        	}
	        catch (SQLException throwables) 
	        {
	        	JOptionPane.showMessageDialog(null,
		                "Ваш вопрос не отправлен!",
		                "Ответ сервера",
		                JOptionPane.ERROR_MESSAGE);
	        	  throwables.printStackTrace();
	        	  response.sendRedirect("TehHelp.jsp");	        	
	        }
	}

}
