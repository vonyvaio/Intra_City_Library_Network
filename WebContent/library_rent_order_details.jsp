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


<title>Rent Order Details</title>

</head>

<body>

${library_rent_order_details_message}




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


<div class = "row"> <br> </div>
<div class = "row"> <br> </div>

<!-- Rent Order Details -->


<div class = "container">

	<div class = "row text-center bg-success text-danger">
		
		<h1>Rent Order Details</h1>
	</div>
	
	
	<div class = "row"> <br> </div>
	
	<div class = "row bg-info text-left">
	
	
		<div class = "col-sm-3">
		
			Preview
		</div>
		
		<div class = "col-sm-3">
			
			Item Details
		</div>
		
		<div class = "col-sm-3">
		
			Customer Details
		</div>
		
		<div class = "col-sm-3">
		
			Order Details
		</div>
	
	</div>
	
	<div class = "row"> <br> </div>
	
	
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
	
		String Query;
		
		String book_id;
		String book_name;
		String book_price;
		String rent_price;
		String library_id;
		String book_language;
		String book_image_url;
		
		String customer_id;
		String category_string;
		String customer_name;
		String customer_email;
		String customer_phone;
		String customer_address;
		
		String rent_order_id;
		String rent_date;
		String due_date;
		String quantity_purchased;
		String fine;
		
		
		Query = "select * from rent_order_details where library_id = " + Integer.parseInt((String) session.getAttribute ("library_id")) + ";";
		st = con.prepareStatement(Query);
		rs = st.executeQuery();
		
		while (rs.next()) {
		
			rent_order_id = rs.getString("rent_order_id");
			book_id = rs.getString("book_id");
			library_id = rs.getString("library_id");
		
			customer_id = rs.getString("customer_id");
			category_string = "student";
		
			rent_date = rs.getString("issue_date");
			due_date = rs.getString("due_date");
			
			Query = "select * from book_details where book_id = " + Integer.parseInt(book_id) +";";
			st = con.prepareStatement(Query);
			rs1 = st.executeQuery();
			
			rs1.next();
			
			book_image_url = rs1.getString("book_image_url");
			book_name = rs1.getString("book_name");
			book_price = rs1.getString("book_price");
			rent_price = rs1.getString("rent_price");
			book_language = rs1.getString("book_language");
			
			
			Query = "select * from student_details where student_id = " + Integer.parseInt(customer_id) +";";
			st = con.prepareStatement(Query);
			rs1 = st.executeQuery();
			
			rs1.next();
			
			customer_name = rs1.getString("student_first_name");
			customer_name = customer_name + " " + rs1.getString("student_last_name");
			
			customer_email = rs1.getString("student_email");
			customer_phone = rs1.getString("student_contact_no");
			customer_address = rs1.getString("student_address");

			%>
			
			
			<div class  = "row"> 
			
			<div class = "col-sm-3 text-left">
			
				<img src = <%= book_image_url %> style="height:240px">
			</div>
			
			<div class = "col-sm-3 text-left">
				
				 <div class="row">
				 
				 	Book ID: <%= book_id %>
				 </div>
				 
				 <div class="row">
				 
				 	Book Name: <%= book_name %>
				 </div>
				 
				 <div class="row">
				 
				 	Book Price: <%= book_price %>
				 </div>
				 
				 <div class="row">
				 
				 	Rent Price: <%= rent_price %>
				 </div>
				 
				 <div class="row">
				 
				 	Library ID: <%= library_id %>
				 </div>
				 
				 <div class="row">
				 
				 	Book Language: <%= book_language %>
				 </div>
				
			</div>
			
			
			<div class = "col-sm-3 text-left">
			
				<div class="row">
				 
				 	Customer ID: <%= customer_id %>
				 </div>
				 
				 <div class="row">
				 
				 	Customer Type: Student
				 </div>
				 
				 <div class="row">
				 
				 	Customer Name: <%= customer_name %>
				 </div>
				 
				 <div class="row">
				 
				 	Customer Email: <%= customer_email %>
				 </div>
				 
				 <div class="row">
				 
				 	Customer Phone: <%= customer_phone %>
				 </div>
				 
				 <div class="row">
				 
				 	Customer Address: <%= customer_address %>
				 </div>
				
			</div>
			
			
			<div class = "col-sm-3 text-left">
			
				<div class="row">
				 
				 	Rent Order Id: <%= rent_order_id %>
				 </div>
				 
				 <div class="row">
				 
				 	Rent Date: <%= rent_date %>
				 </div>
				 
				 <div class="row">
				 
				 	Due Date: <%= due_date %>
				 </div>
				 
				 <div class="row">
				 
				 	Rent Quantity: 1
				 </div>
				 
				 <div class="row">
				 
				 	Fine: 0
				 </div>
				
			</div>
		
		</div>
		
		<div class = "row"> <br> </div>
		
		<hr class = "hr-success">
		
		<div class = "row"> <br> </div>
			

<%		}
	
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


<!-- RentOrder Details -->




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

<script>
    $(document).ready(function () {
        $('.dropdown-toggle').dropdown();
    });
</script>

</body>


</html>