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
    
    <!-- jQuery library 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	-->

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


	<title>Library: Insert Book</title>

<!-- 
	
	<style>
	
		#field {

			margin-left:.5em;
			float:left
		}

		#field,label {

			float:left;
			font-family:Arial,Helvetica,sans-serif;
			font-size:small;
		}

		br {

			clear:both;
		}

		input {

			border:1px solid #000;
			margin-bottom:.5em;
		}

		input.error {

			border:1px solid red;
		}

		input.error {

			background:url(images/unchecked.png)no-repeat;
			padding-left:16px;
			margin-left:.3em;
		}

		input.valid {

			background:url(images/checked.png)no-repeat;
			display:block;
			width:16px;
			height:16px;
		}
	
	</style> 

-->


	<style>
	
		.error {
		
			color: red;
			
		}
		
		.valid {
		
			color: green;
		}
		
	</style>



</head>

<body>


${insert_book_message}


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
					
					<div class = "col-sm-5 text-center">
						<h1>
							<div style = "font-size: 50px"> <div class = "btn btn-success btn-lg">  <i class="fa fa-cogs"></i> Library Control Panel </div> </div>
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
                               		 
                               		<li><a href="Library_logout"><i class="fa fa-user"></i> Logout</a></li>
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
		</div>

<!--/header-bottom-->

</div>
</div>

	<section >
	
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

					<!--/category-books-->
				</div>
				</div>
				


				<div class="col-sm-5 text-center">
                                    

						<div class = "row"> <h2>Insert Book</h2> </div>
						
						<div class = "row">
						
						<form validate = "true" action="Insert_book" id="insert_book" method="post" enctype="multipart/form-data">
						
						<div class = "row"> <br> </div>
							
						<div class = "row">
							<div class="input-group">
      							<span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>
      							<input type="text" placeholder="Book Name" id="BookName" name="BookName" class="form-control">
    						</div>
    					</div>
    					
    					<div class = "row"> <br> </div>
    					
    					<div class = "row">	
		  					<div class="input-group">
      							<span class="input-group-addon"><i class="fa fa-copy"></i></span>
      							<input type="number" placeholder="No of copies" id="Copies" name="Copies" class="form-control">
    						</div>
    					</div>
    					
    					<div class = "row"> <br> </div>
    					
    					<div class = "row">

    						<div class = "col-sm-4">
                            
                                <div class="input-group">
      								<span class="input-group-addon"><i class="fa fa-rupee"></i></span>
      								<input type="number" placeholder="Price" id="Price" name="Price" class="form-control">
    							</div>  
                            </div>    						
    						
    						<div class = "col-sm-4">
    						
                                <div class="input-group">
      								<span class="input-group-addon"><i class="fa fa-percent"></i></span>
      								<input type="number" placeholder="Discount" id="discount_price" name="discount_price" class="form-control">
    							</div>  
                            </div>
                                 
                            <div class = "col-sm-4">
                            
                                	<div class="input-group">
      									<span class="input-group-addon"><i class="fa fa-rupee"></i></span>
      									<input type="number" placeholder="Rent-Price" id="rent_price" name="rent_price" class="form-control">
    								</div>
    							</div>
    						
    						</div>
    					
    					<div class = "row"> <br> </div>
    					
    					<div class = "row">	
							<div class="input-group">
      							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      							<input type="text" placeholder="Author Name" id="Author" name="Author" class="form-control">
    						</div>
    					</div>
    					
    					<div class = "row"> <br> </div>
    					
    					<div class = "row">	
							<div class="input-group">
      							<span class="input-group-addon"><i class="fa fa-users"></i></span>
      							<input type="text" placeholder="Publisher" id="Publisher" name="Publisher" class="form-control">
    						</div>
    					</div>
    					
    					<div class = "row"> <br> </div>
    					
    					<div class = "row">	
							<div class="input-group">
      							<span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
      							<textarea id="Description" name="Description" class="form-control" rows="8" placeholder="Enter Book Description" class="form-control"></textarea>
    						</div>
    					</div>     						       						
							
						<div class = "row"> <br> </div>
							                                                      
                            <div class = "row text-center">            
                            	<div class = "col-sm-12">
                                		 <h4><span class="input-group-addon"><i class="fa fa-list-alt"> </i> Select genre</span></h4>  

                                 </div>   
                            </div>
                                   
                            <div class = "row"> <br> </div> 
                            
                            <div class = "row text-left">            
                            	
                            	<div class = "col-sm-4">
                                	<label  class="checkbox-inline"> <input type="checkbox" name="genre" value="Drama">Drama</label>  
                                 </div>
                                 
                                 <div class = "col-sm-4">
                                	<label class="checkbox-inline"> <input type="checkbox" name="genre" value="Thriller">Thriller</label>  
                                 </div>
                                 
                                 <div class = "col-sm-4">
                                	<label class="checkbox-inline"> <input type="checkbox" name="genre" value="Romantic">Romantic </label>  
                                 </div>
                                    
                            </div>
                                   
                            <div class = "row"> <br> </div> 
  
                              <div class = "row text-left">            
                            	
                            	<div class = "col-sm-4">
                                	<label class="checkbox-inline"> <input type="checkbox" name="genre" value="Science Fiction">Science Fiction</label>  
                                 </div>
                                 
                                 <div class = "col-sm-4">
                                	<label class="checkbox-inline"> <input type="checkbox" name="genre" value="Satire">Satire</label>  
                                 </div>
                                 
                                 <div class = "col-sm-4">
                                	<label class="checkbox-inline"> <input type="checkbox" name="genre" value="Mystery">Mystery</label>  
                                 </div>
                                    
                            </div>
                                   
                            <div class = "row"> <br> </div>
                            
                              <div class = "row text-left">            
                            	
                            	<div class = "col-sm-4">
                                	<label class="checkbox-inline"> <input type="checkbox" name="genre" value="Horror">Horror</label>  
                                 </div>
                                 
                                 <div class = "col-sm-4">
                                	<label class="checkbox-inline"> <input type="checkbox" name="genre" value="Health">Health</label>  
                                 </div>
                                 
                                 <div class = "col-sm-4">
                                	<label class="checkbox-inline"> <input type="checkbox" name="genre" value="History">History</label>  
                                 </div>
                                    
                            </div>
                                   
                            <div class = "row"> <br> </div>
                            
                              <div class = "row text-left">            
                            	
                            	<div class = "col-sm-4">
                                	<label class="checkbox-inline"> <input type="checkbox" name="genre" value="Biographies">Biographies</label>  
                                 </div>
                                 
                                 <div class = "col-sm-4">
                                	  
                                 </div>
                                 
                                 <div class = "col-sm-4">
                                	
                                 </div>
                                    
                            </div>
                            
                            <div class = "row"> <br> </div>
							                                                      
                            <div class = "row text-center">            
                            	<div class = "col-sm-12">
                            		<h4> <span class="input-group-addon"><i class="fa fa-language"> </i> Select Language</span></h4>
                                 </div>   
                            </div>                                                      	
                             
                            <div class = "row"> <br> </div>
                            
                              <div class = "row text-left">            
                            	
                            	<div class = "col-sm-4">
                                	<label class="radio-inline"><input type="radio" name="language" value="English">English</label>  
                                 </div>
                                 
                                 <div class = "col-sm-4">
                                	 <label class="radio-inline"><input type="radio" name="language" value="Hindi">Hindi</label> 
                                 </div>
                                 
                                 <div class = "col-sm-4">
                                	 <label class="radio-inline"><input type="radio" name="language" value="Marathi">Marathi</label>
                                 </div>
                                    
                            </div>
                            
                            <div class = "row"> <br> </div>
                            
                              <div class = "row text-left">            
                            	
                            	<div class = "col-sm-4">
                                	<label class="radio-inline"><input type="radio" name="language" value="Tamil">Tamil</label> 
                                 </div>
                                 
                            </div>
                            
                            <div class = "row"> <br> </div>
                            
                            <div class = "row text-left">            
                            	<div class = "col-sm-12">
                            		<h4> <span class="input-group-addon"><i class="fa fa-camera"> </i> Upload Image</span></h4>
                                 </div>   
                            </div>                                                      	
                             
                            <div class = "row"> <br> </div>
                            
                              <div class = "row text-left">            
                            	
                            	<div class = "col-sm-4">
                                	<input type="file" name="Book_image" title="Upload Image, Size less than or equal to 10MB and Greater than 50KB" accept="image/*"/> 
                                 </div>
                            </div>  
                              
                           <div class = "row"> <br> </div>
                           <div class = "row"> <br> </div>
                            
                              <div class = "row">            
                            	
                            	<div class = "col-sm-6 text-right">
                            		 <button type="submit" class="btn  btn-success">Insert</button>
                                 </div>
                                 
                                 <div class = "col-sm-6 text-left">
                                	 <button type="reset" class="btn  btn-warning">Reset</button>
                                 </div>
                                                                 
                             </div>
						</form>
						
					</div>
                </div>	


				<div class="col-sm-1"></div>

			
				
				<!--
				
				<div class="col-sm-3">
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
				</div>	
						
				-->
				
			</div>
		</div>

	</section>
	
	<script src="js/jquery.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>


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
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- footer -->


<script	src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

<script type = "text/javascript" src = "https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.js"></script>
<script type = "text/javascript" src = "https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<script type = "text/javascript" src = "https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/additional-methods.js"></script>
<script type = "text/javascript" src = "https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/additional-methods.min.js"></script>	


<script type = "text/javascript">

jQuery.validator.addMethod("accept1", function(value, element, param) {
	
    return value.match(new RegExp("^" + param + "$"));
});


	$(document).ready (function () {
		$("#insert_book").validate ({
			
			rules: {
				
				BookName: {
					
					required: true,
					accept1: "[a-zA-Z0-9 ]+",
					//lettersonly: true,
					//number: false,
					minlength: 1,
					maxlength: 50					
				},
				
				Copies: {
				
					required: true,
					min: 1,
					max: 1000
							
				},
				
				Price: {
					
					required: true,
					min: 1,
					max: 100000
								
				},
				
				discount_price: {
					
					min: 1,
					max: 100
				},
				
				Author: {
					
					required: true,
					number: false,
					accept1: "[a-zA-Z0-9 ]+",
					minlength: 1,
					maxlength: 100,
					//lettersonly: true

				},
				
				Publisher: {
					
					required: true,
					accept1: "[a-zA-Z0-9 ]+",
					//lettersonly: true,
					//number: false,
					minlength: 1,
					maxlength: 100
					
				},
				
				Description: {
					
					required: true,
					//alphanumeric: true,
					maxlength: 500,
					minlength: 10
				},
				
				genre: {
					
					required: true,
					minlength: 1
				},
				
				language: {
					
					required: true,
					minlength: 1
				}

			},
			
			messages: {
				
				BookName: {
					
					accept1: "Please enter letters and numbers only"
				}

			}
						
		});
	});

</script>
	
</body>

</html>