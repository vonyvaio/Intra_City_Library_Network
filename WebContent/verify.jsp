<%-- 
    Document   : verify
    Created on : 5 Sep, 2018, 7:36:49 PM
    Author     : HP
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
    </head>
    <body>
        <%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
            
String Username = request.getParameter("Username");  
String Password = request.getParameter("Password"); 
String type = request.getParameter("type"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","avni11412"); 
Statement st= con.createStatement(); 
ResultSet result=st.executeQuery("select * from login where username='"+Username+"' and password='"+Password+"'"); 
if(result.next())
{
    
              //if(result.getString(3).equals("type"))
              //{
               response.sendRedirect("useraccount.html");    
              //}
}
else
{
      out.println("wrong");
  
}
%>
    </body>
</html>
