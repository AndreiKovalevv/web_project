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
<title>������� ��������</title>
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
  	    	response.sendRedirect( "Home.jsp");
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
   <H1> <p> ��� ���������� � ���� �� ������ ������!</p></H1>
    
    <% 
        if(name!=null){
        	out.print("�� ����� ���: "+name); 
        }
        else
        {
        	out.print("�� ����� ���: ���������������� ������������");     	
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
		out.print("<br>"+" Id ����������: " + id.get(i)+"<br>");
		out.print("�������� ����������: <a href=Comments.jsp?id=" + id.get(i)+">" +Title.get(i)+ "</a>"+"<br>"+"<hr>");
		
	} 
	statement.close();
	rs.close();
 %>
    <form class="reg"action="CreateEntryServlet" method="POST"><br><br> 
		 <% 
		if(name!=null)
		{ %><br>   
			
			���������:  <br><input type="text" name="EntryTitleSite"><br><br>			
			���������� ������:  <br><textarea  class="Entry" name="EntrySite"> </textarea><br><br>
		  <input type="submit" value="���������" >			
		<%} 		 
		else
		{
			out.print("������������������ ������������ �� ����� ��������� ����������");%><br><br><%
			out.print("���� ��� ��������, �� �������� �����������  ");%><a href="Registration.jsp">�����������</a><br>			
		  <%out.print("���� ���� �������, �� ���������������  ");%><a href="Login.jsp">�����������</a><br>
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