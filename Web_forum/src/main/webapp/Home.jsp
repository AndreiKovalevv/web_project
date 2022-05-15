<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=Cp1251"
    pageEncoding="Cp1251" %>
 <%@ page import="java.sql.SQLException, java.sql.Connection, java.sql.DriverManager, connectionBD.sqliteConnection, java.io.PrintWriter, java.sql.Connection, java.sql.ResultSet, java.sql.Statement, java.sql.*" %>
        
<!DOCTYPE html>
<html>
<head>
<style>
   <%@include file='IndexMain.css' %>
</style>
<meta charset="Cp1251">
<title>Главная страница</title>
</head>
<body>
<div class="first">
      <div class="menu">
        <ul>
      <li><a href="Home.jsp">Главное меню		</a></li> 
      <li><a href="Registration.jsp">Регистрация</a></li>  
      <li><a href="Login.jsp">Логин				</a></li>
      <li><a href="TehHelp.jsp">Поддержка		</a></li>
      <li class="user"><% String name=(String)session.getAttribute("loginUser");
       if(session.getAttribute("loginUser")==null)
       {
    	   out.print("Вы вошли как: Неавторизованный пользователь");     	   
       }
       else{
       out.print("Вы вошли как: "+name); 
       }
       %>
													</li>
     <li>   <% 
        if(request.getParameter("buttonName") != null) 
        {
           	session.invalidate();
  	    	response.sendRedirect( "Home.jsp");
  	    }
   		%>
    <FORM NAME="logOut" METHOD="POST">
        <INPUT TYPE="HIDDEN" NAME="buttonName">
        <INPUT TYPE="BUTTON" VALUE="Выйти" ONCLICK="button1()">
    </FORM>
	       <SCRIPT >        
		        function button1()
		        {
		            document.logOut.buttonName.value = "yes";
		            logOut.submit();
		        }      
		    </SCRIPT>
		           									</li>
        </ul> 
    </div>
   <H1> <p> Все обсуждения и темы на данный момент!</p></H1>
    
    <% 
        if(name!=null){
        	out.print("Вы вошли как: "+name); 
        }
        else
        {
        	out.print("Вы вошли как: Неавторизованный пользователь");     	
        }
        
    %>

 <%
 sqliteConnection connect=new sqliteConnection();

  String query = "SELECT * FROM Entry"; 
  Statement statement = connect.dbConnector().createStatement();
  ResultSet rs = null;
  rs = statement.executeQuery(query);
 
  ArrayList <Integer> id = new ArrayList<Integer>();
  ArrayList <String> Title = new ArrayList<String>();
  while(rs.next())
  {
	id.add(rs.getInt("id_entry"));
	Title.add(rs.getString("title_entry"));
	
  }
	for(int i = 0; i<id.size();i++)
	{
		out.print("<br>"+" Id обсуждения: " + id.get(i)+"<br>");
		out.print("Название обсуждения: <a href=Comments.jsp?id=" + id.get(i)+">" +Title.get(i)+ "</a>"+"<br>"+"<hr>");
		
	} 
	statement.close();
	rs.close();
 %>
    <form class="reg"action="CreateEntryServlet" method="POST"><br><br> 
		 <% 
		if(name!=null)
		{ %><br>   
			
			Заголовок:  <br><input type="text" name="EntryTitleSite"><br><br>			
			Содержание записи:  <br><textarea  class="Entry" name="EntrySite"> </textarea><br><br>
		  <input type="submit" value="Отправить" >			
		<%} 		 
		else
		{
			out.print("Неавторизированные пользователи не могут оставлять обсуждения");%><br><br><%
			out.print("Если нет аккаунта, то пройдите регистрацию  ");%><a href="Registration.jsp">Регистрация</a><br>			
		  <%out.print("Если есть аккаунт, то авторизируйтесь  ");%><a href="Login.jsp">Авторизация</a><br>
		  <%	
		}
		%>
	</form>
 </div>

</body>
  <!-- Site footer -->
    <footer class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-sm-12 col-md-6">
            <h6>О чём сайт</h6>
            <p class="text-justify">Это сайт-форум, на котором пользователи могут оставлять свои комментарии в каком либо обсуждении.  </p>
            На сайте нужно пройти регистрацию для того, что бы вы смогли оставлять свои комментарии или создавать свои обсуждения.
            Приянтого пользования!
          </div>
          <div class="col-xs-6 col-md-3">
            <h6>Бысстрые ссылки</h6>
            <ul class="footer-links">
                 <li><a href="Home.jsp">Главное меню		</a></li> 
      <li><a href="Registration.jsp">Регистрация</a></li>  
      <li><a href="Login.jsp">Логин				</a></li>
      <li><a href="TehHelp.jsp">Поддержка		</a></li>
            </ul>
          </div>
        </div>
        <hr>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-sm-6 col-xs-12">
            <p class="copyright-text">Copyright &copy; 2022 All Rights Reserved by 
         <a href="#">Scanfcode</a>.
            </p>
          </div>

       
        </div>
      </div>
</footer>
</html>