<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=Cp1251"
    pageEncoding="Cp1251" %>

 <%@ page import="java.sql.SQLException,connectionBD.sqliteConnection, java.io.PrintWriter, java.sql.Connection, java.sql.ResultSet, java.sql.Statement, java.sql.*" %>
        
<!DOCTYPE html>
<html>
<head>
<style>
   <%@include file='IndexMain.css' %>
</style>
<meta charset="Cp1251">
<title>����������</title>
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

 <% 
 String id = request.getParameter("id"); 
 
 System.out.println("�������� ������� ��������� "+request.getParameter("id") );
 
 sqliteConnection connect=new sqliteConnection();

 String query = "SELECT * FROM Entry WHERE id_entry="+id; 
 System.out.println(query);
 
 Statement statement = connect.dbConnector().createStatement();
 ResultSet rs = null;

 rs = statement.executeQuery(query);

 ArrayList <String> Content = new ArrayList<String>();
 ArrayList <Integer> ids = new ArrayList<Integer>();
 ArrayList <String> Title = new ArrayList<String>();
 while(rs.next())
 {
	ids.add(rs.getInt("id_entry"));
	Title.add(rs.getString("title_entry"));
	Content.add(rs.getString("content_entry"));
 }
	for(int i = 0; i<ids.size();i++)
	{
		out.print("<br>"+" Id ����������: " + ids.get(i)+"<br>");
		out.print("<h4>"+"�������� ������: " +Title.get(i)+"</h4>");
		out.print("- " + Content.get(i)+"<br>"+"<hr>");
	} 	
	

 	String query3 = "SELECT COUNT(Entry_id) FROM Comments WHERE Entry_id="+id; 
	Statement statement3 = connect.dbConnector().createStatement();
	ResultSet rs3 = null;
	rs3 = statement.executeQuery(query3);
	int count = 0;
 	if(rs3.next()) {
 	    count = rs3.getInt(1);	      
 	}

	String query2 = "SELECT * FROM Comments WHERE Entry_id="+id; 
	Statement statement2 = connect.dbConnector().createStatement();
	ResultSet rs2 = null;
	rs2 = statement.executeQuery(query2);
	ArrayList <Integer> EntryId = new ArrayList<Integer>();
 	ArrayList <String> Author = new ArrayList<String>();
 	ArrayList <String> comment = new ArrayList<String>();	
 	while(rs2.next())
	 { 			
		EntryId.add(rs2.getInt("Entry_id"));
		Author.add(rs2.getString("author_comments"));
		comment.add(rs2.getString("comment_comments"));
	 }
 	for(int z = 0; z < count;z++)
	{
		
		out.print("<br>"+"�����: " + Author.get(z)+"<br>");
		out.print("-   " + comment.get(z)+"<br>"+"<hr>");
	}  	
 	
 	statement3.close();
	rs3.close();

 	statement2.close();
	rs2.close();
	
	statement.close();
	rs.close();
%>
	<%
			 System.out.println();
			 
			 String id2 = request.getParameter("id");
			 System.out.println("request.getParameter id2  " + id2);
			 %> 
    <form class="reg"action="CreateCommentsServlet" method="POST"><br><br> 
		 <% 
		if(name!=null)
		{ %><br> �� �������� ����������� ��� ����� �������:
			<%out.print(name);
			 System.out.println();			 
			 %>   
			<br><br>
			��� �����������:  <br><textarea name="CommentsSite"></textarea><br><br>
			<INPUT TYPE="HIDDEN"  name="ids" value="<%= id %>"/><!-- ��� ���� ����� �������� ������ ��������� ������ -->
			<% System.out.println("� ����� ���� ��� HIDDEN "+ id);
			System.out.println();%>   
		  <input type="submit" value="���������" >			
		<%} 		 
		else
		{
			out.print("������������������ ������������ �� ����� ��������� �������");%><br><br><%
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