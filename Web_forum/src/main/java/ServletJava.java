

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ServletJava")
public class ServletJava extends HttpServlet {
	private static final long serialVersionUID = 1L;
  

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("Cp1251");
		request.setCharacterEncoding("Cp1251");
		response.setCharacterEncoding("Cp1251");
		 PrintWriter pw = response.getWriter();
		 if(request.getParameter("Login")=="") 
		 {
			 pw.println("Не зашли");
		 }
		 else 
		 {
			 pw.println( "Вы вошли как " + request.getParameter("Login") );
		 }
		 
	}

}
