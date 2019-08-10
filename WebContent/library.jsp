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


<title>Library Panel</title>

</head>

<body>

${library_message_delete}

<c:url value="/library.jsp" var="drama_url">

	<c:param name="category_id" value="drama"/>
</c:url>

<c:url value="/library.jsp" var="romantic_url">

	<c:param name="category_id" value="romantic"/>
</c:url>

<c:url value="/library.jsp" var="scifi_url">

	<c:param name="category_id" value="scifi"/>
</c:url>

<c:url value="/library.jsp" var="horror_url">

	<c:param name="category_id" value="horror"/>
</c:url>

<c:url value="/library.jsp" var="satire_url">

	<c:param name="category_id" value="satire"/>
</c:url>

<c:url value="/library.jsp" var="mystery_url">

	<c:param name="category_id" value="mystery"/>
</c:url>

<c:url value="/library.jsp" var="thriller_url">

	<c:param name="category_id" value="thriller"/>
</c:url>

<c:url value="/library.jsp" var="health_url">

	<c:param name="category_id" value="health"/>
</c:url>

<c:url value="/library.jsp" var="history_url">

	<c:param name="category_id" value="history"/>
</c:url>

<c:url value="/library.jsp" var="biography_url">

	<c:param name="category_id" value="biography"/>
</c:url>


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
							<div style = "font-size: 50px"> <div class = "btn btn-success btn-lg">  <i class="fa fa-cogs"></i> Library Control Panel </div> </div>
					 	</h1>
					</div>
						
					<div class="col-sm-4">
						
							<div class="mainmenu pull-right align-baseline">
								<ul class="nav navbar-nav collapse navbar-collapse">
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
<!--/header-middle-->

<!--header-bottom-->
<div class="header-bottom">
			<div class="container">
				<div class="row">
					<div class="">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						
					</div>
					
				</div>
			</div>
		</div><!--/header-bottom-->

</div>
</div>

	<section>
	
		<div class="container">
		
			<div class="row">
				
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Category</h2>
						
						<!--category-books-->
							<div class="panel-group category-products" id="accordian">
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href=${drama_url}>Drama</a></h4>
								</div>
							</div>
														
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href=${thriller_url}>Thriller</a></h4>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href=${romantic_url}>Romantic</a></h4>
								</div>
							</div>
																					
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href=${scifi_url}>Science fiction</a></h4>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href=${satire_url}>Satire</a></h4>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href=${mystery_url}>Mystery</a></h4>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href=${horror_url}>Horror</a></h4>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href=${health_url}>Health</a></h4>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href=${history_url}>History</a></h4>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href=${biography_url}>Biographies</a></h4>
								</div>
							</div>
							
						</div>
						
					<!--featured-books-->
					
						<!--
							<div class="brands_products">
								<h2>Languages</h2>
								<div class="brands-name">
									<ul class="nav nav-pills nav-stacked">
										<li><a href=""> <span class="pull-right">(50)</span>English</a></li>
										<li><a href=""> <span class="pull-right">(56)</span>Hindi</a></li>
										<li><a href=""> <span class="pull-right">(27)</span>Marathi</a></li>
										<li><a href=""> <span class="pull-right">(32)</span>Tamil</a></li>
									</ul>
								</div>
							</div>
						-->
						
					</div>
				</div>
				
				
				<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"  
     								url="jdbc:mysql://localhost/library_management?autoReconnect=true&useSSL=false"  
     								user="root"  password="4159"/>
     								
     			<c:choose>
        
       				<c:when test="${param.category_id == 'drama'}">
	  					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details where book_genre like '%Drama%' and library_id = '<%=session.getAttribute("library_id") %>';  
						</sql:query>
      				</c:when>

       							
       				<c:when test="${param.category_id == 'romantic'}">
	 					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details where book_genre like '%Romantic%' and library_id = '<%=session.getAttribute("library_id") %>';  
						</sql:query>
        			</c:when>
        			
 					<c:when test="${param.category_id == 'scifi'}">
	 					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details where book_genre like '%Science Fiction%' and library_id = '<%=session.getAttribute("library_id") %>';  
						</sql:query>
        			</c:when>
        			
        			<c:when test="${param.category_id == 'horror'}">
	 					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details where book_genre like '%Horror%' and library_id = '<%=session.getAttribute("library_id") %>';  
						</sql:query>
        			</c:when>
        			
        			<c:when test="${param.category_id == 'satire'}">
	 					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details where book_genre like '%Satire%' and library_id = '<%=session.getAttribute("library_id") %>';  
						</sql:query>
        			</c:when>
        			
        			<c:when test="${param.category_id == 'mystery'}">
	 					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details where book_genre like '%Mystery%' and library_id = '<%=session.getAttribute("library_id") %>';  
						</sql:query>
        			</c:when>
        			
        			<c:when test="${param.category_id == 'thriller'}">
	 					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details where book_genre like '%Thriller%' and library_id = '<%=session.getAttribute("library_id") %>';  
						</sql:query>
        			</c:when>
        			
        			<c:when test="${param.category_id == 'health'}">
	 					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details where book_genre like '%Health%' and library_id = '<%=session.getAttribute("library_id") %>';  
						</sql:query>
        			</c:when>
        			
        			<c:when test="${param.category_id == 'history'}">
	 					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details where book_genre like '%History%' and library_id = '<%=session.getAttribute("library_id") %>';  
						</sql:query>
        			</c:when>
        			
        			<c:when test="${param.category_id == 'biography'}">
	 					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details where book_genre like '%Biographies%' and library_id = '<%=session.getAttribute("library_id") %>';  
						</sql:query>
        			</c:when>
        						
        			<c:otherwise>
	  					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details where library_id = '<%=session.getAttribute("library_id") %>';  
						</sql:query>
        			</c:otherwise>

     			</c:choose>
				
				<!--library Details-->
				
					<div class="col-sm-9 padding-right">
					
						<div class="Library Login">
							<h2 class="title text-center">Welcome ${library_username}</h2>
						</div>
										<div class="features_items">
					 
					<c:forEach var="book" items="${rs.rows}">  
					
					<c:url value="/library_book_display.jsp" var="display_url">

						<c:param name="book_id" value="${book.book_id}"/>
					</c:url>
					
					<c:url value="Book_delete" var="delete_url">
					
						<c:param name="book_id" value="${book.book_id}"/> 
					</c:url>

						<div class="col-sm-4">
						
							<div class="product-image-wrapper">
							
								<div class="single-products">
										<div class="productinfo text-center"><a href=${display_url}> <img src=${book.book_image_url} style="height:240px" alt="${book.book_name}" /> </a>
							
										<h2>Rs. <c:out value="${book.book_price}"/></h2>
										<p><c:out value="${book.book_name}"/></p>
									
										<a href=${delete_url} class="btn btn-warning add-to-cart"><i class="glyphicon glyphicon-trash"></i>Delete</a>
									</div>
							 	</div>
							</div>
						</div>
											
					</c:forEach>
		
					</div>
						
					</div>
				<!--library Details-->
			</div>
		</div>
		
		
		
		
		
		
	</section>



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

<!--     
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

 -->

<!-- footer -->

<script>
    $(document).ready(function () {
        $('.dropdown-toggle').dropdown();
    });
</script>

</body>


</html>