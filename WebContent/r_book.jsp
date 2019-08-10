<%-- 
    Document   : rented_books_display
    Created on : Oct 13, 2018, 6:42:30 PM
    Author     : Aprajita
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
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
        <h1>Rented Books:</h1>
        
        
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
									 	<li> <a href="rented_books_display.jsp">Rented Books</a> </li> 
                                                                                <li> <a href="sold_books_display.jsp">Sold Books</a> </li> 
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
		</div>
<!--/header-bottom-->

        </div>
</div>
   
   <div class="container">
       <div class="row">
           <div class="col-md-3">
               
           </div>
           <div class="col-md-6">
               <table class="table table-striped">
                   <thead>
                       <tr>
                           <td>Book </td>
                           <td>Rented By </td>
                           <td> Rented On</td>
                           <td>Return Date</td>
                           <td> No. of Extra Days</td>
                           <td>Due Amount</td>
                       </tr>
                   </thead>
                   <tbody>
                       <tr>
                           <td> </td>
                           <td> </td>
                           <td> </td>
                           <td> </td>
                           <td> </td>
                           <td> </td>
                       </tr>
                       <tr>
                           <td> </td>
                           <td> </td>
                           <td> </td>
                           <td> </td>
                           <td> </td>
                           <td> </td>
                       </tr>
                       <tr>
                           <td> </td>
                           <td> </td>
                           <td> </td>
                           <td> </td>
                           <td> </td>
                           <td> </td>
                       </tr>
                       
                   </tbody>
               </table>
           </div>
           <div class="col-md-3">
               
           </div>
       </div>
   </div>   
   
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
