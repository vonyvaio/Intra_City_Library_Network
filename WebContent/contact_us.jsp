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
	<link href="css/Footer-with-button-logo.css" rel="stylesheet">
	
	
	 <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
	
	
<title>Contact Us</title>

</head>

<body>

${feedback_message}

	<br> <br>

	<!-- Divison Header -->
	
		<div class="container">
		
			<div class="row">
			
		 		<div class="col-sm-3">
		 		  		
		 			<div class="">
		 				
		 				<c:choose>
        
       							<c:when test="${category_string == 'student'}">
	  								<a href="index.jsp"> <img src="images/home/logo.png" style=" height:70px; width:150px;"  align="left"/> </a>
      							</c:when>

       							<c:when test="${category_string == 'member'}">
	 								<a href="index.jsp"> <img src="images/home/logo.png" style=" height:70px; width:150px;"  align="left"/> </a>
        						</c:when>

        						<c:when test="${category_string == 'library'}">
	 								<a href="library.jsp"> <img src="images/home/logo.png" style=" height:70px; width:150px;"  align="left"/> </a>
        						</c:when>
        						
        						<c:otherwise>
        							<a href="index.jsp"> <img src="images/home/logo.png" style=" height:70px; width:150px;"  align="left"/> </a>
        						</c:otherwise>
        						
     					</c:choose>
		 			
						
					</div>
				  </div>
				  <div class="col-sm-8 text-center"> 
	  			  
	  			  <div class = "row">
	  			  	
	  			  <div class = "text-center">
	  			  	
	  			  <div class="shop-menu pull-right">
						
				  		<ul class="nav navbar-nav">
				  		
				  		<c:choose>
        
       							<c:when test="${category_string == 'student'}">
	  								<li><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>
      							</c:when>

       							<c:when test="${category_string == 'member'}">
	 								<li><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>
        						</c:when>

        						<c:when test="${category_string == 'library'}">
	 								<li><a href="library.jsp"><i class="fa fa-home"></i> Home</a></li>
        						</c:when>
        						
        						<c:when test="${category_string == 'admin'}">
	 								<li><a href="Admin_Control_Panel.jsp"><i class="fa fa-home"></i> Home</a></li>
        						</c:when>
        						
        						<c:otherwise>
        							<li><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>
        						</c:otherwise>
        						
     						</c:choose>
				  		
				  			<c:choose>
        
       							<c:when test="${category_string == 'student'}">
	  								<li><a href="contact_us.jsp"><i class="fa fa-user"></i> Account</a></li>
      							</c:when>

       							<c:when test="${category_string == 'member'}">
	 								<li><a href="contact_us.jsp"><i class="fa fa-user"></i> Account</a></li>
        						</c:when>

        						<c:when test="${category_string == 'library'}">
	 								<li><a href="library.jsp"><i class="fa fa-user"></i> Account</a></li>
        						</c:when>
        						
        						<c:when test="${category_string == 'admin'}">
	 								<li><a href="Admin_Control_Panel.jsp"><i class="fa fa-user"></i> Account</a></li>
        						</c:when>
        						
     						</c:choose>
				  		
				  			<c:choose>
        
       							<c:when test="${category_string == 'student'}">
	  								<li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i> Cart</a></li>
      							</c:when>

       							<c:when test="${category_string == 'member'}">
	 								<li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i> Cart</a></li>
        						</c:when>
							</c:choose>
				  		
							
							
							<c:choose>
        
       							<c:when test="${category_string == 'student'}">
	  								<li><a href="Student_logout"><i class="fa fa-lock"></i> Logout</a></li>
      							</c:when>

       							<c:when test="${category_string == 'member'}">
	 								<li><a href="Member_logout"><i class="fa fa-lock"></i> Logout</a></li>
        						</c:when>

        						<c:when test="${category_string == 'library'}">
	 								<li><a href="Library_logout"><i class="fa fa-lock"></i> Logout</a></li>
        						</c:when>
        						
        						<c:when test="${category_string == 'admin'}">
	 								<li><a href="Admin_logout"><i class="fa fa-lock"></i> Logout</a></li>
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
	
		<br> <br>    
				
    		<div class="row">
    		  	
	    	<div class="col-sm-7">
				
				<div class = "row">
                   
                 <div class = "col-sm-2"> </div>  
                   
					<div class = "col-sm-9">
					
					<div class="login-form">
					
					<div class="contact-info">
						
						<h2 class="title text-center">Get In Touch</h2>
						
						<form action = "Feedback" id = "submit_form"method = "post" >
							
							<div class="form-group col-md-5">
							
								<div class = "row">	
									<div class="input-group">
      									<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      									<input type="text" placeholder="Enter Name" name="name" class="form-control">
    								</div>
    							</div>
    						</div>
    						
    						<div class="form-group col-md-1"></div>
							
							<div class="form-group col-md-6">
								
								<div class = "row">	
									<div class="input-group">
      									<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
      									<input type="email" placeholder="Enter Email" name="email" class="form-control">
    								</div>
    							</div>
							</div>
                            
                            <div class="form-group col-md-12">
				            	
				            	<div class = "row">	
									<div class="input-group">
      									<span class="input-group-addon"><i class="	glyphicon glyphicon-info-sign"></i></span>
      									<input type="text" placeholder="Subject" name="subject" class="form-control">
    								</div>
    							</div>
				            </div>
                            
                            <div class="form-group col-md-12">
                            
                            	<div class = "row">	
									<div class="input-group">
      									<span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
      									<textarea rows = "8" placeholder="Your Message Here" name="message" class="form-control"> </textarea>
    								</div>
    							</div>
                            </div>  

							<div class="form-group col-md-3">
							
                            	<button type="submit" class="btn btn-success">Submit</button>
                            </div>  
                            
                            <div class="form-group col-md-3 pull-left">
                            	<button type="reset" class="btn btn-warning">Reset</button>
                            </div>             
				 		
				 		</form>
                      </div>
					</div>
					</div>
				 </div>		
	    		</div>
	    		
	    		<div class="col-sm-5">
	    		
	    		<div class = "row" >
	    		
	    			<div class="contact-info">
	    			
	    			<div class = "row">
	    				<div class = "col-sm-2"></div>
	    				
	    				<div class = "col-sm-4"> <h2 class="title text-center">Contact Info</h2> </div>
	    			
	    			</div>	
	    				<address>
	    				
	    					<p>Infinity Bookstore</p>
							<p>Address: Pune Institute Of Computer Technology, Dhankawdi, Pune-411043</p>
							
							<p>Mobile: 8007571732</p>
							<p>Fax: 1-714-252-0026</p>
							<p>Email: infinitybookstore@gmail.com</p>
	    				</address>
	    			</div>
	    		</div>
    			</div>  
    			  			
	    	</div>  

<!--/#contact-page-->
	
 
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
    <script type="text/javascript" src="js/gmaps.js"></script>
	<script src="js/contact.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>


<!-- Footer -->

<div class="content"> </div>
    
    <footer id="myFooter">
    
        <div class="container">
            
            <div class="row">
                
                <div class="col-sm-3">
                    <h2 class="logo"> <img src="images/home/logo.png" style=" height:70px; width:150px;"  align="left"/> </h2>
                </div>
                
                <div class="col-sm-2">
                    
                    <h5>Get started</h5>
                    <ul>
                    
                    	<c:choose>
        
       							<c:when test="${category_string == 'student'}">
	  								<li><a href="index.jsp">Home</a></li>
      							</c:when>

       							<c:when test="${category_string == 'member'}">
	 								<li><a href="index.jsp">Home</a></li>
        						</c:when>

        						<c:when test="${category_string == 'library'}">
	 								<li><a href="library.jsp">Home</a></li>
        						</c:when>
        						
        						<c:when test="${category_string == 'admin'}">
	 								<li><a href="Admin_Control_Panel.jsp">Home</a></li>
        						</c:when>
        						
        						<c:otherwise>
        							<li><a href="index.jsp"> Home</a></li>
        						</c:otherwise>
        						
     						</c:choose>
                    
                       <c:choose>
        
       							<c:when test="${category_string == 'student'}">
	  								<li><a href="Student_logout">Sign up</a></li>
      							</c:when>

       							<c:when test="${category_string == 'member'}">
	 								<li><a href="Member_logout">Sign up</a></li>
        						</c:when>
        						
        						<c:when test="${category_string == 'library'}">
	 								<li><a href="Library_logout">Sign up</a></li>
        						</c:when>
        						
        						<c:when test="${category_string == 'admin'}">
	 								<li><a href="Admin_logout">Sign up</a></li>
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
                    
                    
                    <div class = "text-center text-info"> <h4> FOLLOW US ON  </h4> </div> 
                </div>
            </div>
        </div>
        
        <div class="footer-copyright">
            <p>Developed By Shreya Bhattad, Avni Soni, Narendra Chordiya, Ashutosh Danwe @ MiniProject_PICT </p>
        </div>
        
    </footer>



<script	src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

<script type = "text/javascript" src = "https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.js"></script>
<script type = "text/javascript" src = "https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<script type = "text/javascript" src = "https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/additional-methods.js"></script>
<script type = "text/javascript" src = "https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/additional-methods.min.js"></script>	


<script type = "text/javascript">

jQuery.validator.addMethod("accept", function(value, element, param) {
	
    return value.match(new RegExp("^" + param + "$"));
});


	$(document).ready (function () {
		$("#submit_form").validate ({
			
			rules: {
				
				name: {
					
					required: true,
					minlength: 2,
					maxlength: 50,
					accept: "[a-zA-Z ]+"
				},
				
				email: {
					
					required: true,
					email: true
				},
				
				subject: {
					
					required: true,
					minlength: 10,
					maxlength: 100,
					accept: "[0-9a-zA-Z,. ]+"
				},

				message: {
					
					required: true,
					minlength: 10,
					maxlength: 500,
					accept: "[0-9a-zA-Z,. ]+"
				},
				
			},
			
			messages: {

				name: {
					
					accept: "Letters only please"					
				},
				
				
				subject: {
					
					accept: "Only letters and numbers are allowed"
				},				
				
				message: {
				
					accept: "Only letters and numbers are allowed"
				}
			}
						
		});
	});
	
</script>

</body>
</html>