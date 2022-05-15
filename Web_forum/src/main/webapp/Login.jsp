<%@ page language="java" contentType="text/html; charset=Cp1251"
    pageEncoding="Cp1251" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="Cp1251">
<style>
 <%@include file="IndexMain.css" %>
</style>
<title>Проверка</title>
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
  	    	response.sendRedirect("Home.jsp");
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
 <div class="prereg">
<form class="reg"action="LoginServlet" method="POST"><br><br>
Введите ваш логин  <br><input type="text" name="Login"><br>
Введите пароль  <br><input type="password" name="Password"><br><br>

<button type="submit"> Отправить</button>	
</form>
 
</div>
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