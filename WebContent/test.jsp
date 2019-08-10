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
						<a href="index.jsp"> <img src="images/home/logo.png" style=" height:70px; width:150px;"  align="left"/> </a>
					</div>
				  </div>
				  <div class="col-sm-8 text-center"> 
	  			  
	  			  <div class = "row">
	  			  	
	  			  <div class = "text-center">
	  			  	
	  			  <div class="shop-menu pull-right">
						
				  		<ul class="nav navbar-nav">
							
							<li><a href="#"><i class="fa fa-user"></i> Account</a></li>
							<li><a href="contact_us.jsp"><i class="fa fa-star"></i> Contact</a></li>
							<li><a href="cart.html"><i class="fa fa-shopping-cart"></i> Cart</a></li>
							
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
		
							<li> <div class="searchbar"> <input class = "c" placeholder='Search...' class='js-search' type="text"> <i class="i1 fa fa-search"></i> </div> </li>							
						</ul>
					</div>
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
										<a href="drama.html">Drama</a>
									</h4>
								</div>
							 </div>
							 
							 
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a href="romantic.html">Romantic</a>
									
									</h4>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a href="science-fiction.html">Science Fiction</a>
									</h4>
								</div>
								
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="horror.html">Horror</a></h4>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Satire</a></h4>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Mystery</a></h4>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Thriller</a></h4>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Health</a></h4>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">History</a></h4>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Biographies</a></h4>
								</div>
							</div>
							
						</div>
					<!--category-Books-->
					
					
					<!--languages-->
						<div class="brands_products">
							<h2>Languages</h2>
							<div class="brands-name">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="#"> <span class="pull-right">(50)</span>English</a></li>
									<li><a href="#"> <span class="pull-right">(56)</span>Hindi</a></li>
									<li><a href="#"> <span class="pull-right">(27)</span>Marathi</a></li>
									<li><a href="#"> <span class="pull-right">(32)</span>Tamil</a></li>
									
								</ul>
							</div>
						</div>
					<!--/languages-->
					</div>
				</div>
				
				
				<!--features books-->
								
				<div class="col-sm-9 padding-right">
					
					
				<div class="features_items">
					 <h2 class="title text-center">Featured Books</h2>
						
						<div class="col-sm-4">
						
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center"><a href="agameofthrones.html"><img src="images/shop/agot.jpg" style="height:240px" alt="" /></a>
											<h2>Rs.500</h2>
											
											<p>A Game Of Thrones</p>
											<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
								</div>
								
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										
									</ul>
								</div>
							</div>
						</div>
						
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="images/shop/Room.jpg" style="height:240px" alt="" />
										<h2>Rs.300</h2>
										<p>Room</p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
									
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										
									</ul>
								</div>
							</div>
						</div>
						
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="images/shop/irobot.jpg" style="height:240px"  alt="" />
										<h2>Rs.250</h2>
										<p>I Robot</p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
									
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										
									</ul>
								</div>
							</div>
						</div>
						
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="images/shop/shiningnovel.jpg" style="height:240px" alt="" />
										<h2>Rs.300</h2>
										<p>The Shining Novel</p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
									
									<img src="images/home/new.png" class="new" alt="" />
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										
									</ul>
								</div>
							</div>
						</div>
						
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="images/shop/thehauntingofthehillhouse.JPG" style="height:240px" alt="" />
										<h2>Rs.</h2>
										<p></p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
									
									<img src="images/home/sale.png" class="new" alt="" />
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										
									</ul>
								</div>
							</div>
						</div>
						
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="images/shop/hamlet.jpg" style="height:240px" alt="" />
										<h2>Rs.140</h2>
										<p>Hamlet</p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
									
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										
									</ul>
								</div>
							</div>
						</div> 
						
					</div>
					
					<!--features_items-->
					
					
					<!--recommended_items-->
					
					<div class="recommended_items">
						<h2 class="title text-center">recommended items</h2>
						
						<div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
							
								<div class="item active">
									
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/shop/davincicode.jpg"  alt="" />
													<h2>Rs.200</h2>
													<p>DaVinci Code</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
									
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend2.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
									
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend3.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
								</div>
								
								<div class="item">	
								
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend1.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
									
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend2.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
									
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend3.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
								</div>
								
							</div>
							
							 <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
								<i class="fa fa-angle-left"></i>
							  </a>
							  <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
								<i class="fa fa-angle-right"></i>
							  </a>			
						</div>
					</div> 
					
					<!--recommended_items-->
					
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