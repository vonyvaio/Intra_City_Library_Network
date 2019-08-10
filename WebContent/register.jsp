<%-- 
    Document   : register
    Created on : 23 Sep, 2018, 7:52:58 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
String Username = request.getParameter("Username");            
String Firstname = request.getParameter("First Name");
String Lastname = request.getParameter("Last Name");
String Emailaddress = request.getParameter("Email Address");
String Mobilenumber=request.getParameter("Mobile Number");
String address1 = request.getParameter("Address Line 1");
String address2 = request.getParameter("Address Line 2");
String Zipcode=request.getParameter("Zipcode");
String password = request.getParameter("Password");
String type = request.getParameter("type");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","avni11412"); 
Statement st= con.createStatement(); 
int i=st.executeUpdate("insert into register values('"+Firstname+"','"+Lastname+"','"+Emailaddress+"','"+Mobilenumber+"','"+address1+"','"+address2+"','"+Zipcode+"','"+password+"','"+type+"','"+Username+"')"); 
int j=st.executeUpdate("insert into login values('"+Username+"','"+password+"','"+type+"')"); 

if(i>0)
{
    response.sendRedirect("login.html");    
}
else
{
      out.println("wrong");
  
}
%>
        
    </body>
</html>
