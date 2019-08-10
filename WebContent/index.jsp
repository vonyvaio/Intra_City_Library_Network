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
	
	if ((String)session.getAttribute("category_string") == "admin") {
		
		response.sendRedirect("Admin_Control_Panel.jsp");
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

${cart_message}

<c:url value="/index.jsp" var="drama_url">

	<c:param name="category_id" value="drama"/>
</c:url>

<c:url value="/index.jsp" var="romantic_url">

	<c:param name="category_id" value="romantic"/>
</c:url>

<c:url value="/index.jsp" var="scifi_url">

	<c:param name="category_id" value="scifi"/>
</c:url>

<c:url value="/index.jsp" var="horror_url">

	<c:param name="category_id" value="horror"/>
</c:url>

<c:url value="/index.jsp" var="satire_url">

	<c:param name="category_id" value="satire"/>
</c:url>

<c:url value="/index.jsp" var="mystery_url">

	<c:param name="category_id" value="mystery"/>
</c:url>

<c:url value="/index.jsp" var="thriller_url">

	<c:param name="category_id" value="thriller"/>
</c:url>

<c:url value="/index.jsp" var="health_url">

	<c:param name="category_id" value="health"/>
</c:url>

<c:url value="/index.jsp" var="history_url">

	<c:param name="category_id" value="history"/>
</c:url>

<c:url value="/index.jsp" var="biography_url">

	<c:param name="category_id" value="biography"/>
</c:url>

<c:url value="/index.jsp" var="english_url">

	<c:param name="category_id" value="English"/>
</c:url>

<c:url value="/index.jsp" var="hindi_url">

	<c:param name="category_id" value="Hindi"/>
</c:url>

<c:url value="/index.jsp" var="tamil_url">

	<c:param name="category_id" value="Tamil"/>
</c:url>

<c:url value="/index.jsp" var="marathi_url">

	<c:param name="category_id" value="Marathi"/>
</c:url>

<div class="header-middle">


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
				  		
				  			<c:choose>
        
       							<c:when test="${category_string == 'student'}">
	  								<li><a href="account.jsp"><i class="fa fa-user"></i> Account</a></li>
      							</c:when>

       							<c:when test="${category_string == 'member'}">
	 								<li><a href="account.jsp"><i class="fa fa-user"></i> Account</a></li>
        						</c:when>
        						
							</c:choose>
							
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
	  		
  		
  		
	<!-- Division Header -->

	
	<!-- carousel -->
	
	<section id="slider">
	
		<div class="container">
		
			<div class="row">
			
				<div class="col-sm-12">
				
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>
						
						<div class="carousel-inner">
							
							<div class="item active">
								<div class="col-sm-6">
									<h1><span>INFINITY</span>-BOOKSTORE</h1>
									<h2>Best Seller</h2>
									<p> The Lord of the Rings is one of the best-selling novels ever written, with over 150 million copies sold. </p>
									<div>
									<br> <br>
                                    </div>
                                </div>
								
							<div class="col-sm-6" >
								<img src="images/home/book1.jpeg" alt="" />
								<img src="images/home/pricing.png"  class="pricing" alt="" />
							</div>
							</div>
							
							
							<div class="item">
								<div class="col-sm-6">
									<h1><span>INFINITY</span>-BOOKSTORE</h1>
									<h2>Best Drama </h2>
									<p>The focus of Wilson's attention in Fences is Troy, a head of household who struggles with providing for his family. </p>
								<div> 
								<br>
								<br>                                                                            
                                </div>
								</div>
								
								<div class="col-sm-6">
									<img src="images/home/book2.jpeg" class="" alt="" />
									<img src="images/home/pricing.png"  class="pricing" alt="" />
								</div>
							</div>
							
							<div class="item">
								<div class="col-sm-6">
									<h1><span>INFINITY</span>-BOOKSTORE</h1>
									<h2>Best Thriller </h2>
									<p>The film follows an alcoholic divorce who becomes involved in a missing persons investigation. </p>
									<div>
                                     <br><br>
                                     </div>
								</div>
								
								<div class="col-sm-6">
									<img src="images/home/book3.jpeg" class="" alt="" />
									<img src="images/home/pricing.png" class="pricing" alt="" />
								</div>
							</div>
							
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
					
					
					
				</div>
			</div>
		</div>
	</section>

<!-- carousel -->
	
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
									<h4 class="panel-title">
										<a href=${drama_url}>Drama</a>
									</h4>
								</div>
							 </div>
							 
							 
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a href=${romantic_url}>Romantic</a>
									
									</h4>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a href=${scifi_url}>Science Fiction</a>
									</h4>
								</div>
								
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href=${horror_url}>Horror</a></h4>
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
									<h4 class="panel-title"><a href=${thriller_url}>Thriller</a></h4>
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
					<!--category-Books-->
					
					<!--languages-->
						<div class="brands_products">
							<h2>Languages</h2>
							<div class="brands-name">
								<ul class="nav nav-pills nav-stacked">
								
								<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"  
     								url="jdbc:mysql://localhost/library_management?autoReconnect=true&useSSL=false"  
     								user="root"  password="4159"/>
					
								<sql:query dataSource="${db}" var="rs">  
							
									select * from language_count;  
								</sql:query>
								
								<c:forEach var="book" items="${rs.rows}">  
					
									<c:if test = "${book.language == 'English'}">
										<li><a href=${english_url}> <span class="pull-right">(<c:out value="${book.l_count}"/>)</span>English</a></li>
									</c:if>
									
									<c:if test = "${book.language == 'Hindi'}">
										<li><a href=${hindi_url}> <span class="pull-right">(<c:out value="${book.l_count}"/>)</span>Hindi</a></li>
									</c:if>
									
									<c:if test = "${book.language == 'Marathi'}">
										<li><a href=${marathi_url}> <span class="pull-right">(<c:out value="${book.l_count}"/>)</span>Marathi</a></li>
									</c:if>
									
									<c:if test = "${book.language == 'Tamil'}">
										<li><a href=${tamil_url}> <span class="pull-right">(<c:out value="${book.l_count}"/>)</span>Tamil</a></li>
									</c:if>
								
								</c:forEach>	
								</ul>
							</div>
						</div>
					<!--/languages-->
					</div>
				</div>
				
				
				<!--features books-->
				
				<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"  
     								url="jdbc:mysql://localhost/library_management?autoReconnect=true&useSSL=false"  
     								user="root"  password="4159"/>
     								
     			<c:choose>
        
       				<c:when test="${param.category_id == 'drama'}">
       				
	  					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details where book_genre like '%Drama%';  
						</sql:query>
      				</c:when>

       							
       				<c:when test="${param.category_id == 'romantic'}">
	 					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details where book_genre like '%Romantic%';  
						</sql:query>
        			</c:when>
        			
 					<c:when test="${param.category_id == 'scifi'}">
	 					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details where book_genre like '%Science Fiction%';  
						</sql:query>
        			</c:when>
        			
        			<c:when test="${param.category_id == 'horror'}">
	 					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details where book_genre like '%Horror%';  
						</sql:query>
        			</c:when>
        			
        			<c:when test="${param.category_id == 'satire'}">
	 					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details where book_genre like '%Satire%';  
						</sql:query>
        			</c:when>
        			
        			<c:when test="${param.category_id == 'mystery'}">
	 					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details where book_genre like '%Mystery%';  
						</sql:query>
        			</c:when>
        			
        			<c:when test="${param.category_id == 'thriller'}">
	 					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details where book_genre like '%Thriller%';  
						</sql:query>
        			</c:when>
        			
        			<c:when test="${param.category_id == 'health'}">
	 					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details where book_genre like '%Health%';  
						</sql:query>
        			</c:when>
        			
        			<c:when test="${param.category_id == 'history'}">
	 					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details where book_genre like '%History%';  
						</sql:query>
        			</c:when>
        			
        			<c:when test="${param.category_id == 'biography'}">
	 					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details where book_genre like '%Biographies%';  
						</sql:query>
        			</c:when>
        			
        			<c:when test="${param.category_id == 'English'}">
	 					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details where book_language like '%English%';  
						</sql:query>
        			</c:when>
        			
        			<c:when test="${param.category_id == 'Hindi'}">
	 					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details where book_language like '%Hindi%';  
						</sql:query>
        			</c:when>
        			
        			<c:when test="${param.category_id == 'Tamil'}">
	 					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details where book_language like '%Tamil%';  
						</sql:query>
        			</c:when>
        			
        			<c:when test="${param.category_id == 'Marathi'}">
	 					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details where book_language like '%Marathi%';  
						</sql:query>
        			</c:when>
        						
        			<c:otherwise>
	  					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details;  
						</sql:query>
        			</c:otherwise>

     			</c:choose>
     			
     			<div class="col-sm-9 padding-right">
					
					
				<div class="features_items">
				
				<%
					String temp_string = request.getParameter("category_id");
				
					if (temp_string == null) {
						
				%>
						<h2 class="title text-center">Featured Books</h2>
				<%	
					}
					
					else {
				%>
						<h2 class="title text-center"> <%= temp_string %> </h2>
				<%
					}
				%>
				
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
					
					<!--features_items-->
					
					
					
					
					<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"  
     								url="jdbc:mysql://localhost/library_management?autoReconnect=true&useSSL=false"  
     								user="root"  password="4159"/>
					
					
					<sql:query dataSource="${db}" var="rs">
					  
							 select * from book_details order by total_hit desc limit 6;
					</sql:query>
					
					
					<c:choose>
        				
        				<c:when test="${result.rowCount == 0}">
            				/* No results */
        				</c:when>
        				
        				<c:otherwise>
            			
        			<!--recommended_items-->
					
					<div class="recommended_items">
					
					
						<h2 class="title text-center">recommended items</h2>
						
						<div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
						
							<ol class="carousel-indicators">
								
								<li data-target="#recommended-item-carousel" data-slide-to="0" class="active"></li>
								<li data-target="#recommended-item-carousel" data-slide-to="1"></li>

							</ol>
						
						<div class="carousel-inner">
							
							<% int count=0; int i=0; %>
															
								<c:forEach var="book" items="${rs.rows}">  
					
									<c:url value="/Book_display.jsp" var="display_url">

										<c:param name="book_id" value="${book.book_id}"/>
									</c:url>
					
									<c:url value="/Add_to_cart" var="cart_url">
						
										<c:param name="book_id" value="${book.book_id}" />
									</c:url>
									
									<% if (count == 0) { %> 
									
									<div class="item active">
									
									<% } else if ( (i%3) == 0) { %>
									
									<div class="item">
									
									<%}%>

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
								
								<%count++; i++;%>
								
								<% if (count == 3) { %>
								
									</div>	
								<% } else if ( (i%3) == 0 ) { %>
								
									</div>
								<% } %>
								

							</c:forEach>
								
								
						</div>
							
							<!-- Left and right controls -->
							
							 <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
							 
								<i class="fa fa-angle-left"></i>
							 </a>
							 
							 <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
							 
								<i class="fa fa-angle-right"></i>
							 </a>			
						</div>
					</div> 
			
					<!--recommended_items-->
				
				</c:otherwise>
    				
    			</c:choose>				
					
					
				</div>
			</div>
		</div>
	</section>
	
    <script src="js/jquery.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>

	<!-- 	<script src="js/bootstrap.min.js"></script> -->

</div>

</div>

<br><br>

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

<!--    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 --> 

<!-- footer -->

</body>
</html>