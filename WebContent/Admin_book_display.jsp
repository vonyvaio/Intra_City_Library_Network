<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix = "fn" uri="http://java.sun.com/jsp/jstl/functions" %>


 <% 

	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	response.setHeader("Pragma", "no-cache");

	response.setHeader("Expires", "0");
	
	if ((String)session.getAttribute("category_string") != "admin") {
		
		response.sendRedirect("admin_login.jsp");	
	}

%>


<!DOCTYPE html>

<html lang="en">

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
	<link href="css/Footer-with-button-logo.css" rel="stylesheet">


<title>Infinity Book Store</title>


</head>


<body>

<div class="header-middle">

	<!-- Divison Header -->
		<div class="container">
		
			<div class="row">
			
				<div class="col-sm-3">
		 		  		
		 			<div class="">
						<a href="library.jsp"> <img src="images/home/logo.png" style=" height:70px; width:150px;"  align="left"/> </a>
					</div>
					
				 </div>
				 
				 <div class="col-sm-8 text-center"> 
	  			  
	  			 	<div class = "row">
	  			  	
	  			 		<div class = "text-center">
	  			  	
	  			 			<div class="shop-menu pull-right">
						
				  				<ul class="nav navbar-nav">
				  			
				  				<li><a href="Admin_Control_Panel.jsp"><i class="fa fa-home"></i> Home</a></li>
				  			
				  									
								<li><a href="contact_us.jsp"><i class="fa fa-star"></i> Contact</a></li>

								<li><a href="Admin_logout"><i class="fa fa-lock"></i> Logout</a></li>

							</ul>
						</div>
					</div>
					
				</div>
 
	  			</div>
	  		</div>
	  		
  		</div>
  	</div>
  		
	<!-- Division Header -->
	
	<div class="row"> <br> </div>

	<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"  
     								url="jdbc:mysql://localhost/library_management?autoReconnect=true&useSSL=false"  
     								user="root"  password="4159"/>
     								
     								
	<sql:query dataSource="${db}" var="rs">  
		SELECT * from book_details where book_id =  <%= Integer.parseInt( request.getParameter("book_id") ) %>;
	</sql:query>
	

	
		<div class="container">
		
			<c:forEach var="book" items="${rs.rows}"> 
				

					<!--book-details-->
				
				<div class="col-sm-4">
				
					<div class="view-product text-right">
						
						<img src=${book.book_image_url} alt=${book.book_name} style=" width:300px;" />
					</div>
				</div>
				
				<div class = "col-sm-1"></div>
						
				<div class="col-sm-7 text-left">
					
						<!--Book-information-->
					
					<div class = "row text-left">	
								
						<h2>${book.book_name}</h2>
					</div>
					
					<div> <br> </div>
							
					<div class = "row text-left">
							
						<p> ${book.book_description} </p>
					</div>
							
					<div> <br> </div>
							
					<div class="row text-info">
						
						<div class="col-sm-3">
							
							<h4> &#8377 ${book.book_price} </h4>
						</div>
					</div>
					
					<div class="row text-info">
						
						<div class="col-sm-3 text-left">
						
							<h4> Rent Price &#8377; <c:out value="${book.rent_price}"/> </h4>
						</div>
					</div>
					
					<div> <br> </div>
					<div> <br> </div>		

					<div class = "row">
							
						<p> <b> Author: ${book.book_author} </b> </p>
						<p> <b> Language: ${book.book_language} </b> </p>
						<p> <b> Genre: ${book.book_genre} </b> </p>
						<p> <b> Publisher: ${book.book_publisher} </b> </p>
					</div>
					
					<div> <br> </div>
						
				</div>
							
						<!--Book-information-->
				</c:forEach>	
			</div>

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
                        <li><a href="Admin_Control_Panel.jsp">Home</a></li>
                        
                       
	 					<li><a href="Admin_logout">Sign up</a></li>
        				    					
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

</body>
</html>