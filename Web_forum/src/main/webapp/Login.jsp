<%@ page language="java" contentType="text/html; charset=Cp1251"
    pageEncoding="Cp1251" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="Cp1251">
<style>
 <%@include file="IndexMain.css" %>
</style>
<title>��������</title>
</head>
<body>
<div class="first">
      <div class="menu">
        <ul>
      <li><a href="Home.jsp">������� ����		</a></li> 
      <li><a href="Registration.jsp">�����������</a></li>  
      <li><a href="Login.jsp">�����				</a></li>
      <li><a href="TehHelp.jsp">���������		</a></li>
      <li class="user"><% String name=(String)session.getAttribute("loginUser");
       if(session.getAttribute("loginUser")==null)
       {
    	   out.print("�� ����� ���: ���������������� ������������");     	   
       }
       else{
       out.print("�� ����� ���: "+name); 
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
        <INPUT TYPE="BUTTON" VALUE="�����" ONCLICK="button1()">
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
������� ��� �����  <br><input type="text" name="Login"><br>
������� ������  <br><input type="password" name="Password"><br><br>

<button type="submit"> ���������</button>	
</form>
 
</div>
</div>
</body>
 <!-- Site footer -->
    <footer class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-sm-12 col-md-6">
            <h6>� ��� ����</h6>
            <p class="text-justify">��� ����-�����, �� ������� ������������ ����� ��������� ���� ����������� � ����� ���� ����������.  </p>
            �� ����� ����� ������ ����������� ��� ����, ��� �� �� ������ ��������� ���� ����������� ��� ��������� ���� ����������.
            ��������� �����������!
          </div>
          <div class="col-xs-6 col-md-3">
            <h6>�������� ������</h6>
            <ul class="footer-links">
                 <li><a href="Home.jsp">������� ����		</a></li> 
      <li><a href="Registration.jsp">�����������</a></li>  
      <li><a href="Login.jsp">�����				</a></li>
      <li><a href="TehHelp.jsp">���������		</a></li>
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