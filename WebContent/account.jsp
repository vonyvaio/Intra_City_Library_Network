<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix = "fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<%@ page import = "java.io.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.servlet.*" %>


<% 

	if ((String) session.getAttribute("category_string") == null) {
	
		request.setAttribute("account_error_message", "<script type = \"text/javascript\">\r\n" + 
			"\r\n" + 
			"	alert (\"Please Login First To View Account Details\");\r\n" + 
			"\r\n" + 
			"</script>");
	
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}


	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	response.setHeader("Pragma", "no-cache");

	response.setHeader("Expires", "0");
%>
    
<!DOCTYPE html>

<html>

<head>

	<meta charset="ISO-8859-1">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 
	<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css"> 
 
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
	
	<link href="css/searchbar.css" rel="stylesheet">
	<link href="css/account.css" rel="stylesheet">
	<link href="css/Footer-with-button-logo.css" rel="stylesheet">
	<link href="css/horizontal_rule.css" rel="stylesheet">

<title>Account Details</title>

</head>

<body>

${account_message}


<div class="row"> <br> <br> </div>

	<!-- Divison Header -->
		<div class="container">
		
			<div class="row">
			
		 		<div class="col-sm-3">
		 		  		
		 			<div class="">
						<a href="index.jsp"> <img src="images/home/logo.png" style=" height:70px; width:150px;"  align="left"/> </a>
					</div>
				  </div>
				  <div class="col-sm-8 text-center"> 
	  			  
	  			  <div class = "row">
	  			  	
	  			  <div class = "text-center">
	  			  	
	  			  <div class="shop-menu pull-right">
						
				  		<ul class="nav navbar-nav">
							
							<li><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>
							<li><a href="contact_us.jsp"><i class="fa fa-star"></i> Contact</a></li>
							<li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i> Cart</a></li>
							
							<c:choose>
        
       							<c:when test="${category_string == 'student'}">
	  								<li><a href="Student_logout"><i class="fa fa-lock"></i> Logout</a></li>
      							</c:when>

       							<c:when test="${category_string == 'member'}">
	 								<li><a href="Member_logout"><i class="fa fa-lock"></i> Logout</a></li>
        						</c:when>
        						
        						<c:otherwise>
	  								<li><a href="login.jsp"><i class="fa fa-lock"></i> Login</a></li>
        						</c:otherwise>

     						</c:choose>
		
							<li> 
								<form action="search.jsp" name="search_form" id="search_form">
	  			  	
	  			 		<div class="searchbar"> <input name = "search_string" id = "search_string" class = "c" placeholder='Search...' class='js-search' type="text"><button type="submit" style="width:0px; color:green"><i class="i1 fa fa-search"></i></button></div>
	  			 	</form>							
							</li>							
						</ul>
					</div>
					</div>
					
				</div>
 
	  			</div>
	  			</div>
	  		
  		</div>
  		
	<!-- Division Header -->

<div class="row"> <br> <br> </div>


<%!

	Connection con = null;

	PreparedStatement st = null;
		
	ResultSet rs = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	
	PrintWriter out;
	HttpSession session;

	String JDBC_PATH = "jdbc:mysql://localhost/library_management?autoReconnect=true&useSSL=false";
	String DB_USERNAME = "root";
	String DB_PASS = "4159";

	String DRIVER = "com.mysql.cj.jdbc.Driver";
	
	String category_string;
	String Query;
	
	String library_name;
	String book_name;
	String book_image_url;

%>


<!-- NAV TABS -->

<div class = "container">

<div class = "col-sm-4">

<div class="tab">


  <button class="tablinks" onclick="openDetail (event, 'P_INFO')" id="defaultOpen"> <span class="glyphicon glyphicon-user"></span> Personal Information</button>
  
  <button class="tablinks" onclick="openDetail (event, 'Orders')"><span class="glyphicon glyphicon-shopping-cart"></span> My Orders</button>

<%

	category_string = (String) session.getAttribute("category_string");
	

	if (category_string.equals("student")) {
		
%>
		
		<a href="Student_logout"> <button class="tablinks" onclick="openDetail (event, 'Tokyo')"><span class="glyphicon glyphicon-log-out"></span> Logout</button> </a>

<%

	}

	if (category_string.equals("member")) {
	
%>

		<a href="Member_logout"><button class="tablinks" onclick="openDetail (event, 'Tokyo')"><span class="glyphicon glyphicon-log-out"></span> Logout</button> </a>

<%
	}

	if (category_string.equals("library")) {

%>
		<a href="Library_logout"><button class="tablinks" onclick="openDetail (event, 'Tokyo')"><span class="glyphicon glyphicon-log-out"></span> Logout</button> </a>

<%
	}

%>
  
  
</div>

</div>

<div class = "col-sm-8 text-center">
	
<div id="P_INFO" class="tabcontent">

<%

try {
	
			//initializing connection

		Class.forName(DRIVER);
		con = DriverManager.getConnection(JDBC_PATH, DB_USERNAME, DB_PASS);


	if (category_string.equals("student")) {
		
		Query = "SELECT * from student_details where student_id =" + Integer.parseInt( (String)session.getAttribute("student_id") ) + ";";
		
		st = con.prepareStatement(Query);
		rs = st.executeQuery();
		
		rs.next();
	
		
%>
							<!--  Student Details -->
					
        				<div class = "col-sm-8 text-center">	
							
							<div class = "row"> <br> </div>
							
							<div class = "row"> Your Student Id </div>
							
							<div class = "row"> <br> </div>
							
							<div class = "row">
								<div class="input-group">
      								<span class="input-group-addon"><i class="glyphicon glyphicon-text-width"></i></span>
      								<input type="text" class="form-control" value=<%= rs.getString ("student_id")%> disabled>
    							</div>
    						</div>
    						
    						<div class = "row"> <hr> </div>
    						
    							<!--  -->
    						
    						<div class = "row"> <br> </div>
							
							<div class = "row"> Your Registered Username </div>
							
							<div class = "row"> <br> </div>
							
							<div class = "row">
								<div class="input-group">
      								<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      								<input type="text" class="form-control" value=<%= rs.getString ("student_username") %> disabled>
    							</div>
    						</div>
    						
    						<div class = "row"> <hr> </div>
    						
    						
    							<!--  -->
    						
    						<div class = "row"> <br> </div>
							
							<div class = "row"> Your First Name </div>
							
							<div class = "row"> <br> </div>
							
							<div class = "row">
								<div class="input-group">
      								<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      								<input type="text" class="form-control" value = <%= rs.getString ("student_first_name") %> disabled>
    							</div>
    						</div>
    						
    						<div class = "row"> <hr> </div>
    						
    							
    							<!--  -->
    						
    						<div class = "row"> <br> </div>
							
							<div class = "row"> Your Last Name </div>
							
							<div class = "row"> <br> </div>
							
							<div class = "row">
								<div class="input-group">
      								<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      								<input type="text" class="form-control" value = <%= rs.getString ("student_last_name") %> disabled>
    							</div>
    						</div>
    						
    						<div class = "row"> <hr> </div>
    						
    							<!--  -->
    						
    						<div class = "row"> <br> </div>
							
							<div class = "row"> Your Email ID </div>
							
							<div class = "row"> <br> </div>
							
							<div class = "row">
								<div class="input-group">
      								<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
      								<input type="text" class="form-control" value = <%= rs.getString ("student_email") %> disabled>
    							</div>
    						</div>
    						
    						<div class = "row"> <hr> </div>
    						
    							<!--  -->
    						
    						<div class = "row"> <br> </div>
							
							<div class = "row"> Your Registered Address </div>
							
							<div class = "row"> <br> </div>
							
							<div class = "row">
								<div class="input-group">
      								<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
      								<input type="text" class="form-control" value = <%= rs.getString ("student_address") %> disabled>
    							</div>
    						</div>
    						
    						<div class = "row"> <hr> </div>
    						
    							<!--  -->
    						
    						<div class = "row"> <br> </div>
							
							<div class = "row"> Your Registered Pincode </div>
							
							<div class = "row"> <br> </div>
							
							<div class = "row">
								<div class="input-group">
      								<span class="input-group-addon"><i class="glyphicon glyphicon-chevron-right"></i></span>
      								<input type="text" class="form-control" value = <%= rs.getString ("student_pincode") %> disabled>
    							</div>
    						</div>
    						
    						<div class = "row"> <hr> </div>
    						
    						
    						
    						<!--  -->
    						
    						<div class = "row"> <br> </div>
							
							<div class = "row"> Your Registered Contact Number </div>
							
							<div class = "row"> <br> </div>
							
							<div class = "row">
								<div class="input-group">
      								<span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
      								<input type="text" class="form-control" value = <%= rs.getString ("student_contact_no") %> disabled>
    							</div>
    						</div>
    						
    						<div class = "row"> <hr> </div>
							
							<!--  -->
    						
    						<div class = "row"> <br> </div>
							
							<div class = "row"> Your Registered College Name </div>
							
							<div class = "row"> <br> </div>
							
							<div class = "row">
								<div class="input-group">
      								<span class="input-group-addon"><i class="glyphicon glyphicon-education"></i></span>
      								<input type="text" class="form-control" value = <%= rs.getString ("student_college_name") %> disabled>
    							</div>
    						</div>
    						
    						
    					</div>
								
					<!--  Student Details -->
      						
<%

	}
	
		if (category_string.equals("member")) {
	
			Query = "SELECT * from member_details where member_id =" + Integer.parseInt( (String)session.getAttribute("member_id") ) + ";";
	
			st = con.prepareStatement(Query);
			rs = st.executeQuery();
	
			rs.next();
%>
			
			<!--  Member Details -->
			
				<div class = "col-sm-8 text-center">	
							
							<div class = "row"> <br> </div>
							
							<div class = "row"> Your Member Id </div>
							
							<div class = "row"> <br> </div>
							
							<div class = "row">
								<div class="input-group">
      								<span class="input-group-addon"><i class="glyphicon glyphicon-text-width"></i></span>
      								<input type="text" class="form-control" value=<%= rs.getString ("member_id")%> disabled>
    							</div>
    						</div>
    						
    						<div class = "row"> <hr> </div>
    						
    							<!--  -->
    						
    						<div class = "row"> <br> </div>
							
							<div class = "row"> Your Registered Username </div>
							
							<div class = "row"> <br> </div>
							
							<div class = "row">
								<div class="input-group">
      								<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      								<input type="text" class="form-control" value=<%= rs.getString ("member_username") %> disabled>
    							</div>
    						</div>
    						
    						<div class = "row"> <hr> </div>
    						
    						
    							<!--  -->
    						
    						<div class = "row"> <br> </div>
							
							<div class = "row"> Your First Name </div>
							
							<div class = "row"> <br> </div>
							
							<div class = "row">
								<div class="input-group">
      								<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      								<input type="text" class="form-control" value = <%= rs.getString ("member_first_name") %> disabled>
    							</div>
    						</div>
    						
    						<div class = "row"> <hr> </div>
    						
    							
    							<!--  -->
    						
    						<div class = "row"> <br> </div>
							
							<div class = "row"> Your Last Name </div>
							
							<div class = "row"> <br> </div>
							
							<div class = "row">
								<div class="input-group">
      								<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      								<input type="text" class="form-control" value = <%= rs.getString ("member_last_name") %> disabled>
    							</div>
    						</div>
    						
    						<div class = "row"> <hr> </div>
    						
    							<!--  -->
    						
    						<div class = "row"> <br> </div>
							
							<div class = "row"> Your Email ID </div>
							
							<div class = "row"> <br> </div>
							
							<div class = "row">
								<div class="input-group">
      								<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
      								<input type="text" class="form-control" value = <%= rs.getString ("member_email") %> disabled>
    							</div>
    						</div>
    						
    						<div class = "row"> <hr> </div>
    						
    							<!--  -->
    						
    						<div class = "row"> <br> </div>
							
							<div class = "row"> Your Registered Address </div>
							
							<div class = "row"> <br> </div>
							
							<div class = "row">
								<div class="input-group">
      								<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
      								<input type="text" class="form-control" value = <%= rs.getString ("member_address") %> disabled>
    							</div>
    						</div>
    						
    						<div class = "row"> <hr> </div>
    						
    							<!--  -->
    						
    						<div class = "row"> <br> </div>
							
							<div class = "row"> Your Registered Pincode </div>
							
							<div class = "row"> <br> </div>
							
							<div class = "row">
								<div class="input-group">
      								<span class="input-group-addon"><i class="glyphicon glyphicon-chevron-right"></i></span>
      								<input type="text" class="form-control" value = <%= rs.getString ("member_pincode") %> disabled>
    							</div>
    						</div>
    						
    						<div class = "row"> <hr> </div>
    						
    						
    						
    						<!--  -->
    						
    						<div class = "row"> <br> </div>
							
							<div class = "row"> Your Registered Contact Number </div>
							
							<div class = "row"> <br> </div>
							
							<div class = "row">
								<div class="input-group">
      								<span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
      								<input type="text" class="form-control" value = <%= rs.getString ("member_contact_no") %> disabled>
    							</div>
    						</div>
    						
    						<div class = "row"> <hr> </div>
							
						</div>
			
			<!--  Member Details -->
<%
		}
	
%>    				
</div>



<div id="Orders" class="tabcontent">

<div class = "row bg-info">
  
  		<div class = "col-sm-3">
  		
  			Preview
  		</div>
  		
  		<div class="col-sm-1"></div>
  	
  		<div class = "col-sm-4 text-left">
  		
  			Book Details
  		</div>
  		
  		<div class = "col-sm-4 text-left">
  		
  			Order Details
  		</div>
</div>

<% if (category_string.equals("student")) { %>
	
	<div class = "row"> <br> </div>

	<div class = "row bg-success"> <h4> RENT ORDER DETAILS </h4> </div>
	
	<div class = "row"> <br> </div>
	
	
	<%
	
	Query = "select * from rent_order_details where customer_id = " +Integer.parseInt((String) session.getAttribute ("student_id")) + " and category_string = 'student'";
	st = con.prepareStatement(Query);
	rs = st.executeQuery(); 
	
	while (rs.next()) {
	
	Query = "select * from book_details where book_id = " + Integer.parseInt ( rs.getString ("book_id") ) + ";";
	st = con.prepareStatement(Query);
	rs1 = st.executeQuery();
	rs1.next();

	book_image_url = rs1.getString("book_image_url");
	book_name = rs1.getString ("book_name");
	
	Query = "select * from library_details where library_id = " + Integer.parseInt ( rs.getString ("library_id") ) + ";";
	st = con.prepareStatement (Query);
	rs1 = st.executeQuery();
	rs1.next();
	
	library_name = rs1.getString ("library_name");

%>

<div class = "row"> <br> </div>

  	<div class = "row"> <hr> </div>

	 <div class = "row">

		<div class = "col-sm-3"> 
		
		
			<img src = <%=book_image_url%> style="height:240px">
		</div>
	
		<div class="col-sm-1"></div>
		
		<div class = "col-sm-4 text-left">
		
			<div class = "row">Rent ID: <%= rs.getString("rent_order_id") %> </div>
			<div class = "row">Book ID: <%= rs.getString("book_id") %></div>
			<div class = "row">Book Name: <%= book_name %></div>
		</div>
	
		<div class = "col-sm-4 text-left">
		
			<div class = "row">Rented From (ID): <%= rs.getString("library_id") %></div>
			<div class = "row">Rented From: <%= library_name %></div>
			<div class = "row">Issue Date: <%= rs.getString("issue_date") %></div>
			<div class = "row">Due Date: <%= rs.getString("due_date") %> </div>
			<div class = "row">Status: <%= rs.getString("status") %> </div>
			
			<% if (rs.getString("status").equals("RENTED")) { %>
  				
  				<div class = "row"> <br> </div>
  			
  				<a href="Return_rent_book?book_id=<%= rs.getString("book_id")%>&rent_id=<%= rs.getString("rent_order_id")%>" class="btn btn-info btn-sm pull-left">
  				
          			<span class="glyphicon glyphicon-circle-arrow-left"></span> Return
        		</a>
  			<% } %>
  			
		</div>
</div>
	
	<% } } %>
	
<%

	if (category_string.equals("student")) {
%>


<div class = "row"> <br> </div>

<div class = "row bg-success"> <h4> BUY ORDER DETAILS </h4> </div>

<div class = "row"> <br> </div>


<%		
		Query = "select * from buy_order_details where customer_id = " +Integer.parseInt((String) session.getAttribute ("student_id")) + " and category_string = 'student'";
		st = con.prepareStatement(Query);
		rs = st.executeQuery();
		
		while (rs.next()) {
		
		Query = "select * from book_details where book_id = " + Integer.parseInt ( rs.getString ("book_id") ) + ";";
		st = con.prepareStatement(Query);
		rs1 = st.executeQuery();
		rs1.next();

		book_image_url = rs1.getString("book_image_url");
		book_name = rs1.getString ("book_name");
		
		Query = "select * from library_details where library_id = " + Integer.parseInt ( rs.getString ("library_id") ) + ";";
		st = con.prepareStatement (Query);
		rs1 = st.executeQuery();
		rs1.next();
		
		library_name = rs1.getString ("library_name");

%>
	
	  	<div class = "row"> <hr> </div>
  
  	 	<div class = "row">
  
  		<div class = "col-sm-3">
  		
  			<img src = <%=book_image_url%> style="height:240px">
  		</div>
  	
  		<div class="col-sm-1"></div>
  		
  		<div class = "col-sm-4 text-left">
  		
  			<div class = "row">Buy ID: <%= rs.getString("buy_order_id") %> </div>
  			<div class = "row">Book ID: <%= rs.getString("book_id") %></div>
  			<div class = "row">Book Name: <%= book_name %></div>
  		</div>
  	
  		<div class = "col-sm-4 text-left">
  		
  			<div class = "row">Buyed From (ID): <%= rs.getString("library_id") %></div>
  			<div class = "row">Buyed From: <%= library_name %></div>
  			<div class = "row">Quantity Delivered: <%= rs.getString("book_quantity") %></div>
  			<div class = "row">Order Date: <%= rs.getString("buy_date") %> </div>
  		</div>
	</div>
	
	
<% } } %>

<%
	if (category_string.equals("member")) {
		
		Query = "select * from buy_order_details where customer_id = " +Integer.parseInt((String) session.getAttribute ("member_id")) + " and category_string = 'member'";
		st = con.prepareStatement(Query);
		rs = st.executeQuery();
		
		while (rs.next()) {
		
		Query = "select book_image_url, library_id, book_name from book_details where book_id = " + Integer.parseInt ( rs.getString ("book_id") ) + ";";
		st = con.prepareStatement(Query);
		rs1 = st.executeQuery();
		rs1.next();

		book_image_url = rs1.getString("book_image_url");
		book_name = rs1.getString ("book_name");
		
		Query = "select library_name from library_details where library_id = " + Integer.parseInt ( rs.getString ("library_id") ) + ";";
		st = con.prepareStatement (Query);
		rs1 = st.executeQuery();
		rs1.next();
		
		library_name = rs1.getString ("library_name");
		
%>

	
  
  	<div class = "row"> <hr> </div>
  
  	 <div class = "row">
  
  		<div class = "col-sm-3">
  		
  			<img src = <%=book_image_url%> style="height:240px">
  		</div>
  	
  		<div class="col-sm-1"></div>
  		
  		<div class = "col-sm-4 text-left">
  		
  			<div class = "row">Buy ID: <%= rs.getString("buy_order_id") %> </div>
  			<div class = "row">Book ID: <%= rs.getString("book_id") %></div>
  			<div class = "row">Book Name: <%= book_name %></div>
  		</div>
  	
  		<div class = "col-sm-4 text-left">
  		
  			<div class = "row">Buyed From: <%= rs.getString("library_id") %></div>
  			<div class = "row">Buyed From: <%= library_name %></div>
  			<div class = "row">Quantity Delivered: <%= rs.getString("book_quantity") %></div>
  			<div class = "row">Order Date: <%= rs.getString("buy_date") %> </div>
		</div>
	</div>
	

<%
		}
		
	}
	
	} catch (Exception e) {

		out.println (e);

	}

	finally {

		try {

			if (con != null) {
		
				con.close ();
			}

			if (st != null) {
		
				st.close ();
			}

			if (rs != null) {
		
				rs.close ();
			}

		} catch (Exception e) {

				out.println(e);
			}
	}

%>

  
</div>

<div id="Tokyo" class="tabcontent">

  <h3>Logout</h3>

</div>

</div>

</div>

<!-- NAV TABS -->


<!-- SCRIPT -->

<script>

function openDetail (evt, cityName) {
	
    var i, tabcontent, tablinks;
    
    tabcontent = document.getElementsByClassName("tabcontent");
    
    for (i = 0; i < tabcontent.length; i++) {
    	
        tabcontent[i].style.display = "none";
    }
    
    tablinks = document.getElementsByClassName("tablinks");
    
    for (i = 0; i < tablinks.length; i++) {
    	
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    
    document.getElementById(cityName).style.display = "block";
    
    evt.currentTarget.className += " active";
    
} //end of function

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();

</script>

<!-- SCRIPT -->


<br><br><br>

<!-- Footer -->

<div class="content"> </div>
    
    <footer id="myFooter">
    
        <div class="container">
            
            <div class="row">
                
                <div class="col-sm-3">
                    <h2 class="logo"><a href="index.jsp"> <img src="images/home/logo.png" style=" height:70px; width:150px;"  align="left"/> </a> </h2>
                </div>
                
                <div class="col-sm-2">
                    
                    <h5>Get started</h5>
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        
                        <c:choose>
        
       							<c:when test="${category_string == 'student'}">
	  								<li><a href="Student_logout">Sign up</a></li>
      							</c:when>

       							<c:when test="${category_string == 'member'}">
	 								<li><a href="Member_logout">Sign up</a></li>
        						</c:when>

        						<c:otherwise>
	  								<li><a href="login.jsp">Sign up</a></li>
        						</c:otherwise>

     						</c:choose>
                     </ul>
                </div>
                
                <div class="col-sm-2">
                    <h5>About us</h5>
                    <ul>
                        <li><a href="#">Company Information</a></li>
                        
                        <li><a href="#">Reviews</a></li>
                    </ul>
                </div>
                
                <div class="col-sm-2">
                    <h5>Support</h5>
                    <ul>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">Help desk</a></li>
                        <li><a href="#">Forums</a></li>
                    </ul>
                    
                </div>
                
                <div class="col-sm-3">
                    <div class="social-networks">
                        <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                        <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
                        <a href="#" class="google"><i class="fa fa-google-plus"></i></a>
                    </div>
                    
                   <a href = "contact_us.jsp"><button type="button" class="btn">Contact us</button> </a>
                </div>
            </div>
        </div>
        
        <div class="footer-copyright">
            <p>Developed By Shreya Bhattad, Avni Soni, Narendra Chordiya, Ashutosh Danwe @ MiniProject_PICT </p>
        </div>
        
    </footer>

<!-- footer -->

</body>
</html>