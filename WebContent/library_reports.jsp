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

	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	response.setHeader("Pragma", "no-cache");

	response.setHeader("Expires", "0");


	if (session.getAttribute("library_id") == null) {
		
		request.setAttribute("library_error", "<div class=\"alert alert-danger alert-dismissible fade in\">\r\n" + 
				"    					<a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\r\n" + 
				"    					<strong>Please login first to access library control panel</strong>\r\n" + 
				" 					</div>");
		
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

%>
 
    
<!DOCTYPE html>

<html>

<head>
	<meta charset="ISO-8859-1">

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
	<link href="css/Footer-with-button-logo.css" rel="stylesheet">
	<link href="css/horizontal_rule.css" rel="stylesheet">


<title>Library Panel: Your Reports</title>

<style>

	.error {
		
		color: red
	}
	
	.valid {
	
		color: green
	}


</style>


</head>


<body>

${report_details}

<!--header-middle-->
	
<div class = "container">

	<div class = "row">	
		
		<div class="header-middle">
			
			<div class="container">
				
				<div class="row">
	
					<div class="col-sm-3">
						
						<a href="library.jsp"><img src="images/home/logo.png" style="height:70px; width:150px" alt=""  align="left"/></a>
					</div>
					
					<div class = "col-sm-5 text-center align-middle">
						
						<h1>
							
							<div style ="font-size: 50px"> <div class = "btn btn-success btn-lg"><i class="fa fa-cogs"></i> Library Control Panel </div> </div>
					 	</h1>
					</div>
						
					<div class="col-sm-4">
						
							<div class="mainmenu pull-right align-baseline">
								<ul class="nav navbar-nav collapse navbar-collapse">
									<li><a href="library.jsp"><i class="fa fa-home"></i> Home</a></li>
									<li class="dropdown"><a href="#"> Activities<i class="fa fa-angle-down"></i> </a>
                               		   <ul role="menu" class="sub-menu">
                                   		  <li> <a href="insert_book.jsp">Insert</a> </li> 
									 	  <li> <a href="library_buy_order_details.jsp">View Buy Order Details</a> </li>
									 	  <li> <a href="library_rent_order_details.jsp">View Rent Order Details</a> </li>
									 	  <li> <a href="library_reports.jsp">Library_reports</a> </li>
                                  	   </ul>
                               		</li> 
                               		<li> <a href="Library_logout"> <i class="fa fa-user"></i> Logout </a> </li>
								</ul>
							</div>
						
				    </div>
				 </div>
			</div>
		</div>
		
	</div>
</div>		

<!--/header-middle-->


<hr>

	<!-- SEARCH BAR -->

<div class="container">

	<div class="row">
	
		<form name="search_form" id="search_form" action="library_reports.jsp">
		
			<div class = "col-sm-4">
			
				<div class="filter">
					<select class="form-control" name="filter_attribute" id="filter_attribute">
        			
        				<option value=""> Search By </option>
        				<option value="1"> Most Sold </option>
        				<option value="2"> Most Rented </option>
       		 			<option value="3"> Book Name </option>
        				<option value="4"> Author Name </option>
        				<option value="5"> Genre </option>
        				<option value="6"> Most Sold According to Date </option>
	        			<option value="7"> Most Rented According to Date </option>
    	    		</select>
        		</div>
			</div>
			
			
      		<div class = "s_string">
      		</div>

			<div class = "col-sm-1">
			
				<button type="submit" class="btn btn-success" ><i class="glyphicon glyphicon-search"></i> Search</button>
			</div>
			
			
		</form>	
	</div>
	
	
</div>

	<!-- SEARCH BAR -->





<%!

	Connection con = null;

	PreparedStatement st = null;
	PreparedStatement st1 = null;
	
	ResultSet rs = null;
	ResultSet rs1 = null;

	PrintWriter out;
	HttpSession session;

	String JDBC_PATH = "jdbc:mysql://localhost/library_management?autoReconnect=true&useSSL=false";
	String DB_USERNAME = "root";
	String DB_PASS = "4159";

	String DRIVER = "com.mysql.cj.jdbc.Driver";

%>


<%

	try {
		
		Class.forName(DRIVER);
		con = DriverManager.getConnection(JDBC_PATH, DB_USERNAME, DB_PASS);
		
		int library_id = Integer.parseInt((String) session.getAttribute("library_id"));
		
		String book_image_url;
		
		String book_id;
		String book_name;
		String book_price;
		String book_author;
		String book_publisher;
		String book_genre;
		
		String book_buy_price;
		String book_rent_price;
		String book_discount;
		
		String no_of_copies_sold;
		String no_of_copies_rented;
		
		String book_language;
		
		String customer_id;
		String category_string;
		String customer_name = "";
		String customer_email = "";
		String customer_phone = "";
		String customer_address = "";
		
		String buy_order_id;
		String buy_date;
		String quantity_purchased;
		
		String rent_order_id;
		String rent_date;
		String due_date;
		String fine;
	
		String Query;
		String temp;

%>

<%

	if ( (request.getParameter("filter_attribute") == null) && (request.getParameter("search_string") == null) && ( ( request.getParameter("from_date") == null ) || ( request.getParameter("to_date") == null ) ) ) {
		
%>

	<div class = "container ">
		
		<div class = "row text-center">
			<div class = "col-sm-12">
		
				<h1 class="text-info"><i class="fa fa-search"></i> START SEARCHING</h1>
			</div>
		</div>	
	</div>

<%		
	}

	else {
%>


<%

	if ( request.getParameter("search_string").isEmpty() ) {
		
%>

	<%
		if (request.getParameter("filter_attribute").equals("1")) {
			
			Query = "select * from book_details where library_id = " + library_id + " order by buy_hit desc;";
			//Query = "select * from book_details where buy_hit = (select max(buy_hit) from book_details where library_id = " + library_id + ") and library_id = " + library_id + ";";
			st=con.prepareStatement(Query);
			rs = st.executeQuery();
			
			while (rs.next()) {
				
				book_image_url = rs.getString("book_image_url");
				
				book_id = rs.getString ("book_id");
				book_name = rs.getString ("book_name");
				book_author = rs.getString ("book_author");
				book_publisher = rs.getString ("book_publisher");
				book_genre = rs.getString ("book_genre");
				
				book_buy_price = rs.getString ("book_price");
				book_rent_price = rs.getString ("rent_price");
				book_discount = rs.getString ("discount_price");
				
				no_of_copies_sold = rs.getString ("buy_hit");
				no_of_copies_rented = rs.getString ("rent_hit");
				
	%>
	
		<div class = "container text-left">
		
			<div class = "row"> <br> </div>
		
			<div class = "row bg-info">
			
				<div class = "col-sm-3">
				
					Preview
				</div>	
				
				<div class = "col-sm-3">
				
					General Details
				</div>
				
				<div class = "col-sm-3">
				
					Price Details
				</div>
				
				<div class = "col-sm-3">
				
					Status
				</div>
			
			</div>
			
			<div class = "row"> <br> </div>
			
			<div class = "row">
			
				<div class = "col-sm-3">
				
					<a href="library_book_display.jsp?book_id=<%=book_id%>"> <img src = <%= book_image_url %> style="height:240px"> </a>
				</div>	
				
				<div class = "col-sm-3">
				
					<div class = "row">
					
						Book ID:  <%= book_id %>
					</div>
					
					<div class = "row">
					
						Book Name:  <%= book_name %>
					</div>
					
					<div class = "row">
					
						Book Author:  <%= book_author %>
					
					</div>
					
					<div class = "row">
					
						Book Publisher:	 <%= book_publisher %>				
					</div>
					
					<div class = "row">
					
						Book Genre:	<%= book_genre %>				
					</div>
				
				</div>
				
				<div class = "col-sm-3">
				
					<div class = "row">
					
						Book Buy Price:  <%= book_buy_price %>
					</div>
					
					<div class = "row">
					
						Book Rent Price: <%=book_rent_price %>
					</div>
					
					<div class = "row">
					
						Book Discount (%): <%=book_discount %>
					</div>
				
				</div>
				
				<div class = "col-sm-3">
				
					<div class = "row">
					
						No of Copies Sold: <%= no_of_copies_sold %>
					</div>
					
					<div class = "row">
					
						No of Copies Rented till Now: <%= no_of_copies_rented %>					
					</div>
				
				</div>
				
			
			</div>
			
		</div>
		
		<hr class="hr-success">
		
		<%	} %>
	<% } %>
	
	
	
	<%
		if (request.getParameter("filter_attribute").equals("6")) {
			
			String t1 = request.getParameter("from_date");
			String t2 = request.getParameter("to_date");
			
			Query = "select * from book_details join buy_order_details on (book_details.book_id = buy_order_details.book_id) where book_details.library_id = " + library_id + " and buy_order_details.buy_date between '" + t1 + "' and '" + t2 + "' ;";
			//Query = "select * from book_details where buy_hit = (select max(buy_hit) from book_details where library_id = " + library_id + ") and library_id = " + library_id + ";";
			st=con.prepareStatement(Query);
			rs = st.executeQuery();

			
			while (rs.next()) {
				
				book_image_url = rs.getString("book_details.book_image_url");
				
				System.out.println (book_image_url);
				
				book_id = rs.getString ("book_id");
				book_name = rs.getString ("book_name");
				book_author = rs.getString ("book_author");
				book_publisher = rs.getString ("book_publisher");
				book_genre = rs.getString ("book_genre");
				
				book_buy_price = rs.getString ("book_price");
				book_rent_price = rs.getString ("rent_price");
				book_discount = rs.getString ("discount_price");
				
				no_of_copies_sold = rs.getString ("buy_hit");
				no_of_copies_rented = rs.getString ("rent_hit");
				
	%>
	
		<div class = "container text-left">
		
			<div class = "row"> <br> </div>
		
			<div class = "row bg-info">
			
				<div class = "col-sm-3">
				
					Preview
				</div>	
				
				<div class = "col-sm-3">
				
					General Details
				</div>
				
				<div class = "col-sm-3">
				
					Price Details
				</div>
				
				<div class = "col-sm-3">
				
					Status
				</div>
			
			</div>
			
			<div class = "row"> <br> </div>
			
			<div class = "row">
			
				<div class = "col-sm-3">
				
					<a href="library_book_display.jsp?book_id=<%=book_id%>"> <img src = <%= book_image_url %> style="height:240px"> </a>
				</div>	
				
				<div class = "col-sm-3">
				
					<div class = "row">
					
						Book ID:  <%= book_id %>
					</div>
					
					<div class = "row">
					
						Book Name:  <%= book_name %>
					</div>
					
					<div class = "row">
					
						Book Author:  <%= book_author %>
					
					</div>
					
					<div class = "row">
					
						Book Publisher:	 <%= book_publisher %>				
					</div>
					
					<div class = "row">
					
						Book Genre:	<%= book_genre %>				
					</div>
				
				</div>
				
				<div class = "col-sm-3">
				
					<div class = "row">
					
						Book Buy Price:  <%= book_buy_price %>
					</div>
					
					<div class = "row">
					
						Book Rent Price: <%=book_rent_price %>
					</div>
					
					<div class = "row">
					
						Book Discount (%): <%=book_discount %>
					</div>
				
				</div>
				
				<div class = "col-sm-3">
				
					<div class = "row">
					
						No of Copies Sold: <%= no_of_copies_sold %>
					</div>
					
					<div class = "row">
					
						No of Copies Rented till Now: <%= no_of_copies_rented %>					
					</div>
				
				</div>
				
			
			</div>
			
		</div>
		
		<hr class="hr-success">
		
		<%	} %>
	<% } %>
	
	
	<%
		if (request.getParameter("filter_attribute").equals("7")) {
			
			String t1 = request.getParameter("from_date");
			String t2 = request.getParameter("to_date");
			
			Query = "select * from book_details join rent_order_details on (book_details.book_id = rent_order_details.book_id) where book_details.library_id = " + library_id + " and rent_order_details.issue_date between '" + t1 + "' and '" + t2 + "' ;";
			//Query = "select * from book_details where buy_hit = (select max(buy_hit) from book_details where library_id = " + library_id + ") and library_id = " + library_id + ";";
			st=con.prepareStatement(Query);
			rs = st.executeQuery();

			
			while (rs.next()) {
				
				book_image_url = rs.getString("book_details.book_image_url");
				
				System.out.println (book_image_url);
				
				book_id = rs.getString ("book_id");
				book_name = rs.getString ("book_name");
				book_author = rs.getString ("book_author");
				book_publisher = rs.getString ("book_publisher");
				book_genre = rs.getString ("book_genre");
				
				book_buy_price = rs.getString ("book_price");
				book_rent_price = rs.getString ("rent_price");
				book_discount = rs.getString ("discount_price");
				
				no_of_copies_sold = rs.getString ("buy_hit");
				no_of_copies_rented = rs.getString ("rent_hit");
				
	%>
	
		<div class = "container text-left">
		
			<div class = "row"> <br> </div>
		
			<div class = "row bg-info">
			
				<div class = "col-sm-3">
				
					Preview
				</div>	
				
				<div class = "col-sm-3">
				
					General Details
				</div>
				
				<div class = "col-sm-3">
				
					Price Details
				</div>
				
				<div class = "col-sm-3">
				
					Status
				</div>
			
			</div>
			
			<div class = "row"> <br> </div>
			
			<div class = "row">
			
				<div class = "col-sm-3">
				
					<a href="library_book_display.jsp?book_id=<%=book_id%>"> <img src = <%= book_image_url %> style="height:240px"> </a>
				</div>	
				
				<div class = "col-sm-3">
				
					<div class = "row">
					
						Book ID:  <%= book_id %>
					</div>
					
					<div class = "row">
					
						Book Name:  <%= book_name %>
					</div>
					
					<div class = "row">
					
						Book Author:  <%= book_author %>
					
					</div>
					
					<div class = "row">
					
						Book Publisher:	 <%= book_publisher %>				
					</div>
					
					<div class = "row">
					
						Book Genre:	<%= book_genre %>				
					</div>
				
				</div>
				
				<div class = "col-sm-3">
				
					<div class = "row">
					
						Book Buy Price:  <%= book_buy_price %>
					</div>
					
					<div class = "row">
					
						Book Rent Price: <%=book_rent_price %>
					</div>
					
					<div class = "row">
					
						Book Discount (%): <%=book_discount %>
					</div>
				
				</div>
				
				<div class = "col-sm-3">
				
					<div class = "row">
					
						No of Copies Sold: <%= no_of_copies_sold %>
					</div>
					
					<div class = "row">
					
						No of Copies Rented till Now: <%= no_of_copies_rented %>					
					</div>
				
				</div>
				
			
			</div>
			
		</div>
		
		<hr class="hr-success">
		
		<%	} %>
	<% } %>
	
	
	<%
		if (request.getParameter("filter_attribute").equals("2")) {
			
			Query = "select * from book_details where library_id = " + library_id + " order by rent_hit desc;";
			//Query = "select * from book_details where rent_hit = (select max(rent_hit) from book_details where library_id = " + library_id + ") and library_id = " + library_id + ";";
			st=con.prepareStatement(Query);
			rs = st.executeQuery();
			
			while (rs.next()) {
				
				book_image_url = rs.getString("book_image_url");
				
				book_id = rs.getString ("book_id");
				book_name = rs.getString ("book_name");
				book_author = rs.getString ("book_author");
				book_publisher = rs.getString ("book_publisher");
				book_genre = rs.getString ("book_genre");
				
				book_buy_price = rs.getString ("book_price");
				book_rent_price = rs.getString ("rent_price");
				book_discount = rs.getString ("discount_price");
				
				no_of_copies_sold = rs.getString ("buy_hit");
				no_of_copies_rented = rs.getString ("rent_hit");
				
				
				
				
	%>
	
		<div class = "container text-left">
		
			<div class = "row"> <br> </div>
		
			<div class = "row bg-info">
			
				<div class = "col-sm-3">
				
					Preview
				</div>	
				
				<div class = "col-sm-3">
				
					General Details
				</div>
				
				<div class = "col-sm-3">
				
					Price Details
				</div>
				
				<div class = "col-sm-3">
				
					Status
				</div>
			
			</div>
			
			<div class = "row"> <br> </div>
			
			<div class = "row">
			
				<div class = "col-sm-3">
				
					<a href="library_book_display.jsp?book_id=<%=book_id%>"> <img src = <%= book_image_url %> style="height:240px"> </a>
				</div>	
				
				<div class = "col-sm-3">
				
					<div class = "row">
					
						Book ID:  <%= book_id %>
					</div>
					
					<div class = "row">
					
						Book Name:  <%= book_name %>
					</div>
					
					<div class = "row">
					
						Book Author:  <%= book_author %>
					
					</div>
					
					<div class = "row">
					
						Book Publisher:	 <%= book_publisher %>				
					</div>
					
					<div class = "row">
					
						Book Genre:	<%= book_genre %>				
					</div>
				
				</div>
				
				<div class = "col-sm-3">
				
					<div class = "row">
					
						Book Buy Price:  <%= book_buy_price %>
					</div>
					
					<div class = "row">
					
						Book Rent Price: <%=book_rent_price %>
					</div>
					
					<div class = "row">
					
						Book Discount (%): <%=book_discount %>
					</div>
				
				</div>
				
				<div class = "col-sm-3">
				
					<div class = "row">
					
						No of Copies Sold: <%= no_of_copies_sold %>
					</div>
					
					<div class = "row">
					
						No of Copies Rented till Now: <%= no_of_copies_rented %>					
					</div>
				
				</div>
				
			
			</div>
			
		</div>
		
		<hr class="hr-success">
		
		<%	} %>
	<% } %>


	
	
		<%
		if (request.getParameter("filter_attribute").equals("7")) {
	%> 
	
		<div class = "container ">
		
		<div class = "row text-center">
			<div class = "col-sm-12">
		
				<h1 class="text-info"> Please Enter String </h1>
			</div>
		</div>	
	</div>
	
	<%}%>
	
<% } %>



<%

	if ( !request.getParameter("search_string").isEmpty() ) {
		
%>

	<%
		if (request.getParameter("filter_attribute").equals("3")) {
			
			temp = request.getParameter("search_string").toString();
			
			Query = "select * from book_details where book_name like '%" + temp + "%' and library_id = " + library_id + ";";
			st=con.prepareStatement(Query);
			rs = st.executeQuery();
			
			while (rs.next()) {
				
				book_image_url = rs.getString("book_image_url");
				
				book_id = rs.getString ("book_id");
				book_name = rs.getString ("book_name");
				book_author = rs.getString ("book_author");
				book_publisher = rs.getString ("book_publisher");
				book_genre = rs.getString ("book_genre");
				
				book_buy_price = rs.getString ("book_price");
				book_rent_price = rs.getString ("rent_price");
				book_discount = rs.getString ("discount_price");
				
				no_of_copies_sold = rs.getString ("buy_hit");
				no_of_copies_rented = rs.getString ("rent_hit");
	%>
	
		<div class = "container text-left">
		
			<div class = "row"> <br> </div>
		
			<div class = "row bg-info">
			
				<div class = "col-sm-3">
				
					Preview
				</div>	
				
				<div class = "col-sm-3">
				
					General Details
				</div>
				
				<div class = "col-sm-3">
				
					Price Details
				</div>
				
				<div class = "col-sm-3">
				
					Status
				</div>
			
			</div>
			
			<div class = "row"> <br> </div>
			
			<div class = "row">
			
				<div class = "col-sm-3">
				
					<a href="library_book_display.jsp?book_id=<%=book_id%>"> <img src = <%= book_image_url %> style="height:240px"> </a>
				</div>	
				
				<div class = "col-sm-3">
				
					<div class = "row">
					
						Book ID:  <%= book_id %>
					</div>
					
					<div class = "row">
					
						Book Name:  <%= book_name %>
					</div>
					
					<div class = "row">
					
						Book Author:  <%= book_author %>
					
					</div>
					
					<div class = "row">
					
						Book Publisher:	 <%= book_publisher %>				
					</div>
					
					<div class = "row">
					
						Book Genre:	<%= book_genre %>				
					</div>
				
				</div>
				
				<div class = "col-sm-3">
				
					<div class = "row">
					
						Book Buy Price:  <%= book_buy_price %>
					</div>
					
					<div class = "row">
					
						Book Rent Price: <%=book_rent_price %>
					</div>
					
					<div class = "row">
					
						Book Discount (%): <%=book_discount %>
					</div>
				
				</div>
				
				<div class = "col-sm-3">
				
					<div class = "row">
					
						No of Copies Sold: <%= no_of_copies_sold %>
					</div>
					
					<div class = "row">
					
						No of Copies Rented till Now: <%= no_of_copies_rented %>					
					</div>
				
				</div>
				
			
			</div>
			
		</div>
		
		<hr class="hr-success">
		
		<%	} %>
	<% } %>


<%
		if (request.getParameter("filter_attribute").equals("4")) {
			
			temp = request.getParameter("search_string").toString();
			
			Query = "select * from book_details where book_author like '%" + temp + "%' and library_id = " + library_id + ";";
			st=con.prepareStatement(Query);
			rs = st.executeQuery();
			
			while (rs.next()) {
				
				book_image_url = rs.getString("book_image_url");
				
				book_id = rs.getString ("book_id");
				book_name = rs.getString ("book_name");
				book_author = rs.getString ("book_author");
				book_publisher = rs.getString ("book_publisher");
				book_genre = rs.getString ("book_genre");
				
				book_buy_price = rs.getString ("book_price");
				book_rent_price = rs.getString ("rent_price");
				book_discount = rs.getString ("discount_price");
				
				no_of_copies_sold = rs.getString ("buy_hit");
				no_of_copies_rented = rs.getString ("rent_hit");
	%>
	
		<div class = "container text-left">
		
			<div class = "row"> <br> </div>
		
			<div class = "row bg-info">
			
				<div class = "col-sm-3">
				
					Preview
				</div>	
				
				<div class = "col-sm-3">
				
					General Details
				</div>
				
				<div class = "col-sm-3">
				
					Price Details
				</div>
				
				<div class = "col-sm-3">
				
					Status
				</div>
			
			</div>
			
			<div class = "row"> <br> </div>
			
			<div class = "row">
			
				<div class = "col-sm-3">
				
					<a href="library_book_display.jsp?book_id=<%=book_id%>"> <img src = <%= book_image_url %> style="height:240px"> </a>
				</div>	
				
				<div class = "col-sm-3">
				
					<div class = "row">
					
						Book ID:  <%= book_id %>
					</div>
					
					<div class = "row">
					
						Book Name:  <%= book_name %>
					</div>
					
					<div class = "row">
					
						Book Author:  <%= book_author %>
					
					</div>
					
					<div class = "row">
					
						Book Publisher:	 <%= book_publisher %>				
					</div>
					
					<div class = "row">
					
						Book Genre:	<%= book_genre %>				
					</div>
				
				</div>
				
				<div class = "col-sm-3">
				
					<div class = "row">
					
						Book Buy Price:  <%= book_buy_price %>
					</div>
					
					<div class = "row">
					
						Book Rent Price: <%=book_rent_price %>
					</div>
					
					<div class = "row">
					
						Book Discount (%): <%=book_discount %>
					</div>
				
				</div>
				
				<div class = "col-sm-3">
				
					<div class = "row">
					
						No of Copies Sold: <%= no_of_copies_sold %>
					</div>
					
					<div class = "row">
					
						No of Copies Rented till Now: <%= no_of_copies_rented %>					
					</div>
				
				</div>
				
			
			</div>
			
		</div>
		
		<hr class="hr-success">
		
		<%	} %>
	<% } %>


	<%
		if (request.getParameter("filter_attribute").equals("5")) {
			
			temp = request.getParameter("search_string").toString();
			
			Query = "select * from book_details where book_genre like '%" + temp + "%' and library_id = " + library_id + ";";
			st=con.prepareStatement(Query);
			rs = st.executeQuery();
			
			while (rs.next()) {
				
				book_image_url = rs.getString("book_image_url");
				
				book_id = rs.getString ("book_id");
				book_name = rs.getString ("book_name");
				book_author = rs.getString ("book_author");
				book_publisher = rs.getString ("book_publisher");
				book_genre = rs.getString ("book_genre");
				
				book_buy_price = rs.getString ("book_price");
				book_rent_price = rs.getString ("rent_price");
				book_discount = rs.getString ("discount_price");
				
				no_of_copies_sold = rs.getString ("buy_hit");
				no_of_copies_rented = rs.getString ("rent_hit");
	%>
	
		<div class = "container text-left">
		
			<div class = "row"> <br> </div>
		
			<div class = "row bg-info">
			
				<div class = "col-sm-3">
				
					Preview
				</div>	
				
				<div class = "col-sm-3">
				
					General Details
				</div>
				
				<div class = "col-sm-3">
				
					Price Details
				</div>
				
				<div class = "col-sm-3">
				
					Status
				</div>
			
			</div>
			
			<div class = "row"> <br> </div>
			
			<div class = "row">
			
				<div class = "col-sm-3">
				
					<a href="library_book_display.jsp?book_id=<%=book_id%>"> <img src = <%= book_image_url %> style="height:240px"> </a>
				</div>	
				
				<div class = "col-sm-3">
				
					<div class = "row">
					
						Book ID:  <%= book_id %>
					</div>
					
					<div class = "row">
					
						Book Name:  <%= book_name %>
					</div>
					
					<div class = "row">
					
						Book Author:  <%= book_author %>
					
					</div>
					
					<div class = "row">
					
						Book Publisher:	 <%= book_publisher %>				
					</div>
					
					<div class = "row">
					
						Book Genre:	<%= book_genre %>				
					</div>
				
				</div>
				
				<div class = "col-sm-3">
				
					<div class = "row">
					
						Book Buy Price:  <%= book_buy_price %>
					</div>
					
					<div class = "row">
					
						Book Rent Price: <%=book_rent_price %>
					</div>
					
					<div class = "row">
					
						Book Discount (%): <%=book_discount %>
					</div>
				
				</div>
				
				<div class = "col-sm-3">
				
					<div class = "row">
					
						No of Copies Sold: <%= no_of_copies_sold %>
					</div>
					
					<div class = "row">
					
						No of Copies Rented till Now: <%= no_of_copies_rented %>					
					</div>
				
				</div>
				
			
			</div>
			
		</div>
		
		<hr class="hr-success">
		
		<%	} %>
	<% } %>





<% } %>
<%		
	

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

<!-- Footer -->

<div class="content"> </div>
    
    <footer id="myFooter">
    
        <div class="container">
            
            <div class="row">
                
                <div class="col-sm-3">
                    <h2 class="logo"><a href="library.jsp"> <img src="images/home/logo.png" style=" height:70px; width:150px;"  align="left"/> </a> </h2>
                </div>
                
                <div class="col-sm-2">
                    
                    <h5>Get started</h5>
                    <ul>
                        <li><a href="library.jsp">Home</a></li>
                        <li><a href="Library_logout">Sign up</a></li>
                        
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


<script	src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

<script type = "text/javascript" src = "https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.js"></script>
<script type = "text/javascript" src = "https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<script type = "text/javascript" src = "https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/additional-methods.js"></script>
<script type = "text/javascript" src = "https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/additional-methods.min.js"></script>	

<script>

	var fadeTime = 300;
	
	$(document).ready(function() {

		$('.filter select').change(function() {

			 var value = $(this).val();
			 
			 if (value == 1) {
				 
			 	var strin = "<input type=\"hidden\" name=\"search_string\" id=\"search_string\"><input type=\"hidden\" name=\"from_date\" id=\"from_date\"><input type=\"hidden\" name=\"to_date\" id=\"to_date\">"
				$('.s_string').html (strin);
			 }
			 
			if (value == 2) {
				 
				var strin = "<input type=\"hidden\" name=\"search_string\" id=\"search_string\"><input type=\"hidden\" name=\"from_date\" id=\"from_date\"><input type=\"hidden\" name=\"to_date\" id=\"to_date\">";
				$('.s_string').html (strin);
			 }
			 
			if (value == 3) {
				
				var strin = "<div class = \"col-sm-4\"><div class=\"form-group\"><input type=\"hidden\" name=\"from_date\" id=\"from_date\"><input type=\"hidden\" name=\"to_date\" id=\"to_date\"><input type=\"text\" class=\"form-control\"  placeholder=\"Enter search string\" name=\"search_string\" id=\"search_string\"></div></div>";
				$('.s_string').html (strin);
			}
			 
			if (value == 4) {
				
				var strin = "<div class = \"col-sm-4\"><div class=\"form-group\"><input type=\"hidden\" name=\"from_date\" id=\"from_date\"><input type=\"hidden\" name=\"to_date\" id=\"to_date\"><input type=\"text\" class=\"form-control\"  placeholder=\"Enter search string\" name=\"search_string\" id=\"search_string\"></div></div>";
				$('.s_string').html (strin);
			}

			if (value == 5) {
				 
				var strin = "<div class = \"col-sm-4\"><div class=\"form-group\"><input type=\"hidden\" name=\"from_date\" id=\"from_date\"><input type=\"hidden\" name=\"to_date\" id=\"to_date\"><input type=\"text\" class=\"form-control\"  placeholder=\"Enter search string\" name=\"search_string\" id=\"search_string\"></div></div>";
				$('.s_string').html (strin);
			}
			
			if (value == 6) {
				 
				var strin = "<div class = \"col-sm-3\"><div class=\"form-group row\"><label for=\"example-date-input\" class=\"col-1 col-form-label\">From</label><div class=\"col-2\"><input type=\"hidden\" name=\"search_string\" id=\"search_string\"><input class=\"form-control\" type=\"date\" id=\"from_date\" name=\"from_date\"></div></div></div><div class = \"col-sm-3\"><div class=\"form-group row\"><label for=\"example-date-input\" class=\"col-1 col-form-label\">To</label><div class=\"col-2\"><input class=\"form-control\" type=\"date\" id=\"to_date\" name=\"to_date\"></div></div></div>";
				$('.s_string').html (strin);
			}
			
			if (value == 7) {
				 
				var strin = "<div class = \"col-sm-3\"><div class=\"form-group row\"><label for=\"example-date-input\" class=\"col-1 col-form-label\">From</label><div class=\"col-2\"><input type=\"hidden\" name=\"search_string\" id=\"search_string\"><input class=\"form-control\" type=\"date\" id=\"from_date\" name=\"from_date\"></div></div></div><div class = \"col-sm-3\"><div class=\"form-group row\"><label for=\"example-date-input\" class=\"col-1 col-form-label\">To</label><div class=\"col-2\"><input class=\"form-control\" type=\"date\" id=\"to_date\" name=\"to_date\"></div></div></div>";
				$('.s_string').html (strin);
			}

			
		});
	});
	


</script>



<script type = "text/javascript">


jQuery.validator.addMethod("accept", function(value, element, param) {
	
    return value.match(new RegExp("^" + param + "$"));
});

	$(document).ready (function () {
		
		$("#search_form").validate ({
			
			rules: {
				
				filter_attribute: {
					
					required: true
				},
				
				search_string: {
					
					required: false,					
					accept: "[a-zA-Z0-9 ]+"
				},
				
				
				from_date: {
					
					required: true
				},
				
				to_date: {
					
					required: true
				}
			},
			
			messages: {

			}
						
		});
	});

</script>

</body>

</html>



<!-- 
	<div class = "container ">
		
		<div class = "row text-center">
			<div class = "col-sm-12">
		
				<h1 class="text-info"> NOTHING TO SHOW </h1>
			</div>
		</div>	
	</div>
	
 -->