import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import connectionBD.sqliteConnection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		request.setCharacterEncoding("Cp1251");
		response.setCharacterEncoding("Cp1251");
		
		String login = request.getParameter("Login");
        String password = request.getParameter("Password");
        
        
        sqliteConnection connect =new sqliteConnection();  
        String query = "SELECT * FROM UserInfo WHERE loginUser = ?";
        PreparedStatement statement;
		ResultSet rs = null;
		try {
			
			statement = connect.dbConnector().prepareStatement(query);
			statement.setString(1, login);			
			rs = statement.executeQuery();
			
			if(!rs.isClosed()) {
			while (rs.next()) {				
				
				String paswords = rs.getString("passwordUser");				
				String email = rs.getString("emailUser");
				
				if(paswords.equals(password) ) 
				{
					SetCookie(response, email);
					SetSession(request, login, password);
					response.sendRedirect("Home.jsp");
				}
				else 
				{
					JOptionPane.showMessageDialog(null,
			                "Ошибка Пароля!",
			                "Ответ сервера",
			                JOptionPane.ERROR_MESSAGE);
					response.sendRedirect("Login.jsp");;
				}
			}	
	}	
			else {JOptionPane.showMessageDialog(null,
	                "Такой логин не найден!",
	                "Ответ сервера",
	                JOptionPane.ERROR_MESSAGE);
			response.sendRedirect("Login.jsp");}
	} 
		catch (SQLException e) 
		{
			System.out.println("EROORRR!");
			e.printStackTrace();
		}		
	
	}

	private void SetCookie(HttpServletResponse response,  String email) {	
		Cookie cookieEmail = new Cookie("email_User", email);
		cookieEmail.setMaxAge(30 * 24 * 60 * 60);
		response.addCookie(cookieEmail);
		
		
	}

	private void SetSession(HttpServletRequest request, String login, String password) {
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", login);
		session.setAttribute("passwordUser", password);
		
	}
        
}
