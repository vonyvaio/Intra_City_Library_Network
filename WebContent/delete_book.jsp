<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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


	<title>Library: Delete Book</title>

</head>

<body>

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
									 	  <li> <a href="delete.html">Delete</a> </li> 
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
										<a data-toggle="collapse" data-parent="#accordian" href="#sportswear">Drama</a>
									</h4>
								</div>
								<div id="Drama" class="panel-collapse collapse"></div>							
                             </div>   
                                                       
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#mens">Thriller</a>
									</h4>
								</div>
								<div id="thriller" class="panel-collapse collapse"></div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#womens">Romantic</a>
									</h4>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Science fiction</a></h4>
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
									<h4 class="panel-title"><a href="#">Horror</a></h4>
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
						
					<!--/category-books-->

					</div>
				</div>

				

				<div class="col-sm-5 text-center">
					<div class="login-form">
						<h2>Delete</h2>
						
						<form action="#" method="post">
							<input type="text" placeholder="Book Id" name="Book_Id"/><br>
						<button type="submit" class="btn btn-primary">Delete</button>
					
						</form>
					</div>
				</div>	


				<div class="col-sm-1"></div>

				<div class="col-sm-3">
						
						<!--Book-languages-->
						
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
						
					   <!--Book-languages-->
				</div>				
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
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- footer -->


</body>
</html>