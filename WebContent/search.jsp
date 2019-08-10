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


	if ((String)session.getAttribute("catgory_string") == "admin") {
		
		response.sendRedirect("admin_login.jsp");
	}
	
	if ((String)session.getAttribute("catgory_string") == "library") {
		
		response.sendRedirect("library.jsp");
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

<title>SEARCH BAR</title>

</head>


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

<body>

<div class = "container">

<div class = "row"> <br> </div>

			<div class="row">
			
		 		 <div class="col-sm-3">
		 		  		
		 			<div class="">
						<a href="index.jsp"> <img src="images/home/logo.png" style=" height:70px; width:150px;"  align="left"/> </a>
					</div>
				 </div>
				  
				 <div class="col-sm-8 text-right"> 
	  			  
	  			 	<div class = "row">
	  			 	
	  			 	<form action="search.jsp" name="search_form" id="search_form">
	  			  	
	  			 		<div class="searchbar"> <input name = "search_string" id = "search_string" class = "c" placeholder='Search...' class='js-search' type="text"><button type="submit" style="width:0px; color:green"><i class="i1 fa fa-search"></i></button></div>
	  			 	</form>
	  			 	
					</div>
 
	  			</div>
	  		</div>



</div>



<div class="header-middle">

	<div class = "container">
	
	
	<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"  
     								url="jdbc:mysql://localhost/library_management?autoReconnect=true&useSSL=false"  
     								user="root"  password="4159"/>
     	
     	
     <c:choose>
        
       				<c:when test="${param.search_string != ''}">
       				
	  					<sql:query dataSource="${db}" var="rs">  
							select * from book_details where book_name like '%${param.search_string}%' UNION select * from book_details where book_author like '%${param.search_string}%' UNION select * from book_details where book_publisher like '%${param.search_string}%' UNION select * from book_details where book_genre like '%${param.search_string}%';  
						</sql:query>
      				</c:when>

       				<c:otherwise>
	  					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details;  
						</sql:query>
        			</c:otherwise>

     			</c:choose>	
	
	<div class="row"> <br> </div>
	<div class="row"> <br> </div>
	
		<div class="features_items">
				
				 	<c:forEach var="book" items="${rs.rows}">  
					
					<c:url value="/Book_display.jsp" var="display_url">

						<c:param name="book_id" value="${book.book_id}"/>
					</c:url>
					
					<c:url value="/Add_to_cart" var="cart_url">
						
						<c:param name="book_id" value="${book.book_id}" />
					</c:url>

						<div class="col-sm-4">
						
							<div class="product-image-wrapper">
							
								<div class="single-products">
										
										<div class="productinfo text-center"><a href=${display_url}> <img src=${book.book_image_url} style="height:240px" alt="${book.book_name}" /> </a>
							
											<h3> <c:out value="${book.book_name}"/> </h3>
									
										<h3 class = "text-info">&#8377; <c:out value="${book.book_price}"/></h3>
																			
										<c:if test = "${category_string == 'student'}">
											
											<h3 class = "text-info"> Rent for &#8377; <c:out value="${book.rent_price}"/> </h3>
											
										</c:if>
										
										
										 							
										<a href=${display_url} class="btn btn-default add-to-cart"><i class="fa fa-info-circle"></i>View Book Details</a>
									  
									</div>
							 	</div>
							</div>
						</div>

					</c:forEach>
		
		
		</div>			
	
	</div>


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
    
  <!-- FOOTER -->  


<script	src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

<script type = "text/javascript" src = "https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.js"></script>
<script type = "text/javascript" src = "https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<script type = "text/javascript" src = "https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/additional-methods.js"></script>
<script type = "text/javascript" src = "https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/additional-methods.min.js"></script>

<script>


$(document).ready(function() {
	$("#search_form").validate ({
		
		rules: {
			
			search_string: {
				
				required: true
			}
			
		}		
	});
});

</script>




</body>
</html>