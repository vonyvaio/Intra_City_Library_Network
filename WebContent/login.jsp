<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>

<html>

<head>

	<meta charset="ISO-8859-1">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title>Login</title>
    
  
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
	
	<link href="css/Footer-with-button-logo.css" rel="stylesheet">


<title>Login</title>


	<style>
	
		.error {
		
			color: red;
			background:url(images/unchecked.gif)no-repeat;
			padding-left:16px;
			margin-left:.3em;
		}
		
		.valid {
		
			color: green;
			background:url(images/checked.gif)no-repeat;
			padding-left:16px;
			margin-left:.3em;
		}
	
	</style>

</head>

<body>

	${library_logout_message}
	${member_logout_message}
	${student_logout_message}
	${account_error_message}
	${cart_error}
	
	${login_message}
	
	<br> <br>

	<!-- Divison Header -->
	
		<div class="container">
		
			<div class="row">
			
			<div class = "col-sm-1"> </div>
			
			<div class="col-sm-4">
			</div>
			
				 <div class="col-sm-2">
		 		
		 			<div class="">
						<a href="index.jsp"> <img src="images/home/logo.png" style=" height:70px; width:150px;"  align="left"/> </a>
					</div>
				 </div>
				 
				 <div class="col-sm-5">
			</div>
				  
			</div>
	  		
  		</div>
  		
  	<!-- Divison Header -->
	
	<br>
	
	<!--form-->
		
	<section id="1">
	
		<div class="container">
		
			<!--login form-->
			
				<div class="col-sm-4">
								
					<div class = "row">
					
						<div class = "row">
							<div class = "col-sm-2"></div>	
								<div class = "col-sm-8">
									<div class = "row">
									<div class = "text-center">	<h3>Login to your account</h3> </div>
									</div>
								</div>
							<div class = "col-sm-2"></div>	
						</div>
						
					<div class = "row"> <br> <br> </div>	
					
					<div class = "row">
							<div class = "col-sm-2"></div>
							<div class = "col-sm-8">
						<div class = "text-center">	<img src="images/login/login-user-icon.png" style="width:200px;height:200px;"> </div>
							</div>
							<div class = "col-sm-2"></div>
					</div>
					
					<div class = "row"> <br> <br> </div>	
						
					<div class = "row">
					
					<ul class="nav nav-tabs">
   						
   						<li class="active"><a data-toggle="tab" href="#student_login">Student</a></li>
						<li><a data-toggle="tab" href="#member_login">Member</a></li>
    					<li><a data-toggle="tab" href="#library_login">Library</a></li>
  					</ul>
  					
  					<div class = "row"> <br> </div>
  					
					${student_error}
					${member_error}
					${library_error}
					
  					<div class="tab-content">
  					
  						<div id="student_login" class="tab-pane fade in active">
      						
      						<form action="Student_login" method="post">
      						
      							<div class = "row">	
									<div class="input-group">
      									<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      									<input type="text" placeholder="Student Username" name="student_login_username" class="form-control" required>
    								</div>
    							</div>
    							
    							<div class = "row"> <br> </div>
    							
    							<div class = "row">	
									<div class="input-group">
      									<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
      									<input type="password" placeholder="Student Password" name="student_login_password" class="form-control" required>
    								</div>
    							</div>
    							
    							<div class = "row"> <br> </div>
    							
    							
    							    							
    							<div class = "row">
    								<button type="submit" class="btn btn-success">Login</button>
    							</div>
    							
    						</form>
    						
    					</div>
    
    					<div id="member_login" class="tab-pane fade">
      						
							<form action="Member_login" method="post">
      						
      							<div class = "row">	
									<div class="input-group">
      									<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      									<input type="text" placeholder="Member Username" name="member_login_username" class="form-control" required>
    								</div>
    							</div>
    							
    							<div class = "row"> <br> </div>
    							
    							<div class = "row">	
									<div class="input-group">
      									<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
      									<input type="password" placeholder="Member Password" name="member_login_password" class="form-control" required>
    								</div>
    							</div>
    						
    							<div class = "row"> <br> </div>
    							
    							
    							    							
    							<div class = "row">
    								<button type="submit" class="btn btn-success">Login</button>
    							</div>
    							
    						</form>

    					</div>
    					
    					<div id="library_login" class="tab-pane fade">
      						
      						<form action="Library_login" method="post">
      						
      							<div class = "row">	
									<div class="input-group">
      									<span class="input-group-addon"><i class="glyphicon glyphicon-cog"></i></span>
      									<input type="text" placeholder="Library Username" name="library_login_username" class="form-control" required>
    								</div>
    							</div>
    							
    							<div class = "row"> <br> </div>
    							
    							<div class = "row">	
									<div class="input-group">
      									<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
      									<input type="password" placeholder="Library Password" name="library_login_password" class="form-control" required>
    								</div>
    							</div>
    							
    							<div class = "row"> <br> </div>
    							
    							
    							    							
    							<div class = "row">
    								<button type="submit" class="btn btn-success">Login</button>
    							</div>
    							
    						</form>
      						
    					</div>
    					
				
 					</div>
					
					</div>	
					
					</div>
					</div>
		
				<!--/login form-->
				
			
				<!-- OR -->
				
				<div class="col-sm-3">
					
					<div class = "row">	
				
					<div class = "col-sm-5"></div>
					
					<div class="col-sm-2">
					
					<div class = "row"></div>
												
					<div>
					<h2 class="or1">OR</h2>
					</div>
					
					
					<div class = "row"></div>
					</div>
					
					<div class = "col-sm-5"></div>
					
					</div>
					
				</div>
				
				<!-- OR -->
				
				
				<!--sign up form-->
								
				<div class="col-sm-4">
				
				<!-- Nav pills -->
  					<ul class="nav nav-pills" role="tablist">
  
   						 <li class="nav-item active">
      						<a class="nav-link active" data-toggle="pill" href="#student">Student</a>
   						 </li>
    
   						 <li class="nav-item">
      						<a class="nav-link" data-toggle="pill" href="#member">Member</a>
    					 </li>
    
   						 <li class="nav-item">
      						<a class="nav-link" data-toggle="pill" href="#library">Library</a>
    					 </li>
    
 					</ul>

 				 <!-- Tab panes -->
  
  			
  				<div class="tab-content">
   					 
   					 <div id="student" class="tab-pane active"><br>
   					 
   					 	 <!-- Student Form -->
      					
      					<div class="signup-form">
					
						<h2> <kbd>New Student Signup!</kbd> </h2> 
						
						<form action = "Register_form_student" id = "Register_form_student" method = "post">
						
						<div class = ""> <input type="text" placeholder="Type Your Username" name="student_user_name"/> </div>
                            
                  		<div class = ""> <input type="text" placeholder="Student First Name" name="student_first_name"/> </div>
												
						<div class = ""> <input type="text" placeholder="Student Last Name" name="student_last_name"/> </div>
						
						<div class = ""> <input type="email" placeholder="Student Email Address" name="student_email"/> </div>
						
						<div class = ""> <input type="text" placeholder="Student Mobile Number" name="student_mobile_number"/> </div>
						
						<div class = ""> <input type="text" placeholder="Student College Name" name="student_college"/> </div>
						
						<div class = ""> <input type="text" placeholder="Student Address Line" name="student_address"/> </div>
						
						<div class = ""> <input type="number" placeholder="Student Pincode" name="student_pincode"/> </div>
						
						<div class = ""> <input type="password" placeholder="Password" id = "student_password" name="student_password"/> </div>
						
						<div class = ""> <input type="password" placeholder="Confirm Password" name="student_cpassword"/> </div>
													
						<br><br>
							
						<div class = "row" >	
						
						<div class = "col-sm-4">
						<button type="submit" class="btn btn-success">Signup</button> 
						</div>
						
						<div class = "col-sm-3 pull-left">
						<button type = "reset" class="btn btn-warning">Reset</button>
						</div>
						
						</div>
						
						</form>
						
						</div>
    				 </div>
    				 
   					 <!-- Student Form -->
   					 
   					 
   					 <div id="member" class="tab-pane fade"><br>
      					 
      					 <!-- Member Form -->
      					
      					<div class="signup-form">
					
						<h2> <kbd>New Member Signup!</kbd> </h2> 
						
						<form action = "Register_form_member" id = "Register_form_member" method = "post">
                        
                        <div class = ""> <input type="text" placeholder="Type User Name" name="member_user_name"/> </div>
                            
                        <div class = ""> <input type="text" placeholder="First Name" name="member_first_name"/> </div>
												
						<div class = ""> <input type="text" placeholder="Last Name" name="member_last_name"/> </div>
						
						<div class = ""> <input type="email" placeholder="Email Address" name="member_email"/> </div>
						
						<div class = ""> <input type="text" placeholder="Mobile Number" name="member_mobile_number"/> </div>
						
						<div class = ""> <input type="text" placeholder="Address Line" name="member_address"/> </div>
						
						<div class = ""> <input type="number" placeholder="Pincode" name="member_pincode"/> </div>
						
						<div class = ""> <input type="password" placeholder="Password" id = "member_password" name="member_password"/> </div>
						
						<div class = ""> <input type="password" placeholder="Confirm Password" name="member_cpassword"/> </div>
 							
				 		<br><br>
							
						<div class = "row" >	
						
						<div class = "col-sm-4">
						<button type="submit" class="btn btn-success">Signup</button> 
						</div>
						
						<div class = "col-sm-3 pull-left">
						<button type = "reset" class="btn btn-warning">Reset</button>
						</div>
						
						</div>
						
						</form>
						
						</div>
    				 </div>
    				 
   					 <!-- Member Form -->
   					 
   					 
   					 <div id="library" class="tab-pane fade"><br>
    				 
      					 <!-- Library Form -->
      					
      					<div class="signup-form">
					
						<h2> <kbd>Library Signup!</kbd> </h2> 
						
						<form action = "Register_form_library" id = "Register_form_library" method = "post">
                        
                        <div class = ""> <input type="text" placeholder="Enter User Name For Library" name="library_user_name"/> </div>
                            
                        <div class = ""> <input type="text" placeholder="Library Name" name="library_name"/> </div>
												
						<div class = ""> <input type="email" placeholder="Library Email Address" name="library_email"/> </div>
						
						<div class = ""> <input type="text" placeholder="Library Contact Number" name="library_mobile_number"/> </div>
						
						<div class = ""> <input type="text" placeholder="Library Address" name="library_address"/> </div>
						
						<div class = ""> <input type="number" placeholder="Library Pincode" name="library_pincode"/> </div>
						
						<div class = ""> <input type="password" placeholder="Password" id = "library_password" name="library_password"/> </div>
						
						<div class = ""> <input type="password" placeholder="Confirm Password" name="library_cpassword"/> </div>
 							
				 		<br><br>
							
						<div class = "row" >	
						
						<div class = "col-sm-4">
						<button type="submit" class="btn btn-success">Signup</button> 
						</div>
						
						<div class = "col-sm-3 pull-left">
						<button type = "reset" class="btn btn-warning">Reset</button>
						</div>
						
						</div>
						
						</form>
						
						</div>
    				 </div>
   					 
    				 </div>
    
    				 
    				 
   					 <!-- Library Form -->
    				 </div>
     			</div>	 
				
			<!--/sign up form-->	
		
	</section>
	
<!--/form-->

<br>

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

<!--     
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

 -->
<!-- footer -->
	

	
<script	src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script type = "text/javascript" src = "https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.js"></script>

<script type = "text/javascript">

	//Student Form Validation

	$(document).ready (function () {
		$("#Register_form_student").validate ({
			
			rules: {
				
				student_user_name: {
					
					required: true,
					accept: "[a-zA-Z]+",
					minlength: 4,
					maxlength: 20
				},
				
				student_first_name: {
				
					required: true,
					accept: "[a-zA-Z]+",
					minlength: 1,
					maxlength: 20
				},
				
				student_last_name: {
					
					required: true,
					accept: "[a-zA-Z]+",
					minlength: 1,
					maxlength: 20
				},
				
				student_email: {
					
					required: true,
					email: true
				},
				
				student_mobile_number: {
					
					required: true,
					minlength: 10,
					maxlength: 10
				},
				
				student_college: {
					
					required: true,
					accept: "[a-zA-Z]+",
					minlength: 1,
					maxlength: 20
				},
				
				student_address: {
					
					required: true,
					accept: "[0-9a-zA-Z]+",
					minlength: 1,
					maxlength: 100
				},
				
			
				student_pincode: {
					
					required: true,
					minlength: 6,
					maxlength: 6
				},
				
				student_password: {
					
					required: true,
					minlength: 5,
					maxlength: 20
									
				},
				
				student_cpassword: {
					
					required: true,
					equalTo: "#student_password",
				
				}
				
			},
			
			messages: {
				
			}
						
		});
	});
	
	
	//Member Form Validation
	
	$(document).ready (function () {
		$("#Register_form_member").validate ({
			
			rules: {
				
				member_user_name: {
					
					required: true,
					accept: "[a-zA-Z]+",
					minlength: 4,
					maxlength: 10
					
				},
				
				member_first_name: {
				
					required: true,
					accept: "[a-zA-Z]+",
					minlength: 1,
					maxlength: 20
				},
				
				member_last_name: {
					
					required: true,
					accept: "[a-zA-Z]+",
					minlength: 1,
					maxlength: 20
				},
				
				member_email: {
					
					required: true,
					email: true
				},
				
				member_mobile_number: {
					
					required: true,
					minlength: 10,
					maxlength: 10
				},
				
				member_address: {
					
					required: true,
					accept: "[0-9a-zA-Z]+",
					minlength: 1,
					maxlength: 100
				},
				
			
				member_pincode: {
					
					required: true,
					minlength: 6,
					maxlength: 6
				},
				
				member_password: {
					
					required: true,
					minlength: 5,
					maxlength: 20
									
				},
				
				member_cpassword: {
					
					required: true,
					equalTo: "#member_password",
					
				}
				
			},
			
			messages: {
				
			}
						
		});
	});
	
	
	
	//Library Form Validation
	
		$(document).ready (function () {
			$("#Register_form_library").validate ({
			
				rules: {
				
				library_user_name: {
				
					required: true,
					accept: "[a-zA-Z]+",
					minlength: 1,
					maxlength: 20
				},
				
				library_name: {
					
					required: true,
					accept: "[a-zA-Z]+",
					minlength: 1,
					maxlength: 20
				},
				
				library_email: {
					
					required: true,
					email: true
				},
				
				library_mobile_number: {
					
					required: true,
					minlength: 10,
					maxlength: 10
				},
				
				library_address: {
					
					required: true,
					accept: "[0-9a-zA-Z]+",
					minlength: 1,
					maxlength: 100
				},
				
			
				library_pincode: {
					
					required: true,
					minlength: 6,
					maxlength: 6
				},
				
				library_password: {
					
					required: true,
					minlength: 5,
					maxlength: 20
									
				},
				
				library_cpassword: {
					
					required: true,
					equalTo: "#library_password",
			
				}
				
			},
			
			messages: {
				
			}
						
		});
	});
	
</script>
</body>

</html>