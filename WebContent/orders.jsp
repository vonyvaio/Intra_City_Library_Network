<%-- 
    Document   : orders
    Created on : 9 Oct, 2018, 12:36:15 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <meta charset="ISO-8859-1">
	<meta charset="utf-8">
   
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
        
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
	
	<link href="css/searchbar.css" rel="stylesheet">
	<link href="css/Footer-with-button-logo.css" rel="stylesheet">

        
        <title>My Orders</title>
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
										
										<li> <div class="searchbar"> <input class = "c" placeholder='Search...' class='js-search' type="text"> <i class="i1 fa fa-search"></i> </div> </li>							
									</ul>
								</div>
							</div>
						
					</div>
	 
	  			</div>
	  		</div>
	  		
  		</div>
  		
	<!-- Division Header -->

	 <script src="js/jquery.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>

</div>

<!-- Middle-->
    <div class="container">
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
                        <a href="user_details.jsp" class="list-group-item list-group-item-action active">My Account</a>
                        <a href="user_details.jsp" class="list-group-item list-group-item-action">My Profile</a>
                        <a href="orders.jsp" class="list-group-item list-group-item-action">My Orders</a>
                        <a href="cart.jsp" class="list-group-item list-group-item-action">My Cart</a>
                        <a href="index.jsp" class="list-group-item list-group-item-action">Logout</a>

                    </div> 
		</div>
            
                <div class="col-md-1">
                    
                </div>
                <div class="col-md-6">
                    <h3>My Orders:</h3>
                    <table class="table table-striped">
                       <thead> 
                        <tr>
                            <th>
                               Book 
                            </th>
                            <th>
                                Book Name
                            </th>
                            <th>
                                Author
                            </th>
                            <th>
                                Price
                            </th>
                            <th>
                                Quantity
                            </th>
                        </tr>
                       </thead>
                       <tbody>
                           <tr>
                               <td>
                                   
                               </td>
                               <td>
                                   
                               </td>
                               <td>
                                   
                               </td>
                               <td>
                                   
                               </td>
                               <td>
                                   
                               </td>
                               <td>
                                   
                               </td>
                           </tr>
                           
                            <tr>
                               <td>
                                   
                               </td>
                               <td>
                                   
                               </td>
                               <td>
                                   
                               </td>
                               <td>
                                   
                               </td>
                               <td>
                                   
                               </td>
                           </tr>
                           
                            <tr>
                               <td>
                                   
                               </td>
                               <td>
                                   
                               </td>
                               <td>
                                   
                               </td>
                               <td>
                                   
                               </td>
                               <td>
                                   
                               </td>
                               
                           </tr>
                       </tbody>
                    </table>
                </div>
                <div class="col-md-2">

                </div>
        </div>
    </div>
<!-- Middle-->

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
                        <li><a href="login.jsp">Sign up</a></li>
                        
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

        
    </body>
    
    
</html>
