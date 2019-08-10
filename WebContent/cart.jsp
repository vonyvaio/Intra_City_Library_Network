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
	
	if ((String)session.getAttribute("category_string") == null) {
		
		request.setAttribute("cart_error", "<div class=\"alert alert-danger alert-dismissible fade in\">\r\n" + 
				"    					<a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\r\n" + 
				"    					<strong>Please Create Account First To Start Buying or Renting</strong>\r\n" + 
				" 					</div>");
		
		request.getRequestDispatcher("login.jsp").forward(request, response);
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
	<link href="css/horizontal_rule.css" rel="stylesheet">


<title>Infinity Book Store: Your Cart</title>

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

${cart_message}

<!-- Divison Header -->

<div class="header-middle">
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
							
							<li><a href="account.jsp"><i class="fa fa-user"></i> Account</a></li>
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
		
							<li> <div class="searchbar"> <input class = "c" placeholder='Search...' class='js-search' type="text"> <i class="i1 fa fa-search"></i> </div> </li>							
						</ul>
					</div>
					</div>
					
				</div>
 
	  			</div>
	  			</div>
	  		
  		</div>
  	</div>	
  	
  		
<!-- Division Header -->


<%!

	Connection con = null;

	PreparedStatement st = null;
	
	ResultSet rs = null;
	ResultSet rs1 = null;

	PrintWriter out;
	HttpSession session;

	String JDBC_PATH = "jdbc:mysql://localhost/library_management?autoReconnect=true&useSSL=false";
	String DB_USERNAME = "root";
	String DB_PASS = "4159";

	String DRIVER = "com.mysql.cj.jdbc.Driver";

%>


<div class = "container">

<div class = "row bg-info text-center">
	
	
		<div class = "col-sm-2">
		
			Preview
		</div>
		
		<div class = "col-sm-3">
			
			Item Description
		</div>
		
		<div class = "col-sm-2">
		
			Quantity
		</div>
		
		<div class = "col-sm-2">
		
			Subtotal (&#8377;)
		</div>
		
		<div class = "col-sm-3">
		
			Actions
		</div>
	
	
</div>


<%

	session = request.getSession();
	
	String document_name, form_name;
	
	String Buy_name, Rent_name, Remove_name;
	
	String Query = "";

	try {
	
			//initializing connection

		Class.forName(DRIVER);
		con = DriverManager.getConnection(JDBC_PATH, DB_USERNAME, DB_PASS);

		if ( ( (String) session.getAttribute("category_string") ).isEmpty() ) {
%>			
			<div class = "container"> 
			
				<div class = "row text-center text-info">
				
					<h1> Nothing to Display </h1>
				</div>			
			</div> 
<%			
		}
		
		else {
			
		if ( ( (String) session.getAttribute("category_string") ).equals("student") ) {
			
			Query = "SELECT * from book_details natural join cart_details where cart_details.customer_id = " + Integer.parseInt((String)session.getAttribute("student_id")) + " and cart_details.category_string like 'student' and cart_details.book_id = book_details.book_id;";
		}
		
		if ( ( (String) session.getAttribute("category_string") ).equals("member") ) {
			
			Query = "SELECT * from book_details natural join cart_details where cart_details.customer_id = " + Integer.parseInt((String)session.getAttribute("member_id")) + " and cart_details.category_string like 'member' and cart_details.book_id = book_details.book_id;";

		}
		
		
		st = con.prepareStatement(Query);
		
		rs = st.executeQuery ();
		
		while (rs.next()) {
		
			form_name = "\"cart_" + rs.getString("book_id") + "\"";
			document_name =  "\"#" + "cart_" + rs.getString("book_id") + "\"";
			
			int lib_id = rs.getInt("library_id");
			
			String Query2 = "select library_name from library_details where library_id = "  + lib_id + ";";
			st = con.prepareStatement(Query2);
			rs1 = st.executeQuery();
			rs1.next();
%>

	<div class = "row"> <br> </div>
	<div class = "row"> <br> </div>


	<form id=<%=form_name%> method = "post">
	
	<div class = "row text-center">
	
		<div class = "col-sm-2">
		
			<img src = <%= rs.getString("Book_image_url") %> style="height:240px">
		</div>
		
		<div class = "col-sm-3">
			
			<div class = "row text-success"> <h4> Copies Available: <%= rs.getString("book_no_of_copies") %> </h4> </div>
			
			<div class = "row"> <br> </div>
			
			<div class = "row"> Book Name: <%= rs.getString("book_name") %> </div>
			
			<div class = "row"> <br> </div>
			
			<div class = "row"> Book ID: <%= rs.getString("book_id") %> </div>
			
			<div class = "row"> <br> </div>
			
			<div class = "row"> Library Name: <%= rs1.getString ("library_name") %> </div>
			
			<div class = "row"> <br> </div>
			
			<div class = "row"> Library ID: <%= rs.getString ("library_id") %> </div>
			
			
		</div>
		
		<div class="col-sm-2 text-center">
			
			<div class = "row">
				
				<div class="col-xs-1 text-right">
					
					&#8377;   
				</div>
				
				<div class="col-xs-2 text-left">
				
					<div class="price"><%= rs.getString("book_price") %></div>
				</div>
				
				<div class="col-xs-1 text-left">
					 X
				</div>
				
				<div class="form-group row">
						
					<div class = "col-xs-6 text-left">
								
						<div class="quantity">
						 
							<input id="q_validate" name="q_validate" type = "number" value = "1" style="width:50px"> 
						</div>
					</div>
				</div>
				
				<div class = "row"> <br> </div>
				
				<div class = "row text-center text-info">
				
					<div class = "col-sm-12">
					
						<b>
						
							OR RENT '1' BOOK @ &#8377; <%= rs.getString("rent_price") %>
						</b>
					</div> 
				</div>
				
			</div> 
		
		</div>
		
		<div class = "col-sm-2">
		
			<div class = "subtotal">
				
				<%=rs.getString("book_price")%>
				<!--<input type="number" id="q_price" name="q_price" value=<%=rs.getString("book_price")%> disabled>-->
			</div>
		</div>
		
		<div class = "col-sm-3">
		
			<input type = "hidden"  id="book_id" name="book_id" value = <%= rs.getString("book_id") %>>
			
			<div class = "row">	<button type="submit" class="btn btn-success" formaction="Buy_from_cart"><i class="glyphicon glyphicon-bitcoin"></i> Buy</button> </div>
			
<% 			

	if ( ( (String) session.getAttribute("category_string") ).equals("student") ) {

%>		
		
		<div class = "row"> <br> </div>
		
		<div class = "row">	<button type="submit" class="btn btn-success" formaction="Rent_from_cart"><i class="glyphicon glyphicon-tag"></i> Rent</button> </div>
<%		
	}
			
%>
			
			<div class = "row"> <br> </div>
			
			<div class = "row">	<button type="submit" class="btn btn-danger" formaction="Remove_from_cart"><i class="glyphicon glyphicon-trash"></i> Remove</button> </div>
		</div>
	</div>
	
	</form>
	
	<script type = "text/javascript">

	$(document).ready (function () {
		$(<%=document_name%>).validate ({
			
			rules: {
				
				q_validate: {
					
					required: true,
					min: 1,
					max: <%= Integer.parseInt(rs.getString ("book_no_of_copies")) %>,
				}
				
			},
			
			messages: {

			}
						
		});
	});

</script>

	<hr class = "hr-primary">

<%	
		}
		
		}

	} catch (Exception e) {

		out.println (e);

	}

	finally {

		try {
	
			if (con != null) {
		
				con.close ();
			}
	
			if (st != null) {
		
				st.close ();
			}
	
			if (rs != null) {
		
				rs.close ();
			}
	
		} catch (Exception e) {
	
				out.println(e);
			}
	}

%>

	<div class = "row"> <br> </div>
	<div class = "row"> <br> </div>

	<div class = "row">

		<div class = "col-sm-2 text-center">
	
			<b>Total</b>
		</div>
	
		<div class = "col-sm-3 text-center">
	
			<b>--</b>
		</div>
	
		<div class = "col-sm-2 text-center">
	
			<b> <span class="total_quantity"></span> </b>
		</div>
	
		<div class = "col-sm-2 text-center">
	
			<b> <span class="total_amount"></span>  </b>
		</div>
	
		<div class = "col-sm-3 text-center">
			
			<b>--</b>
		</div>

	</div>

</div>


<script	src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

<script type = "text/javascript" src = "https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.js"></script>
<script type = "text/javascript" src = "https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<script type = "text/javascript" src = "https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/additional-methods.js"></script>
<script type = "text/javascript" src = "https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/additional-methods.min.js"></script>


<script>

	var fadeTime = 300;

	$(document).ready(function() {

	  updateSumItems();
	  recalculateCart();
	});
	

	$('.quantity input').change(function() {

		 updateQuantity(this);
	});
	
	
	function recalculateCart(onlyTotal) {
		
		var subtotal = 0;

			/* Sum up row totals */
		var productRows = $('.quantity input').parent().parent().parent().parent().parent();
			
		productRows.siblings().find('.subtotal').each ( function () {
		  		
 			subtotal += parseFloat( $(this).text() );
			  	
 		});	
		
		console.log (subtotal);
		
	  	productRows.parent().parent().siblings().find('.total_amount').fadeOut (fadeTime, function () {
			
			$(this).text(subtotal);
			$(this).fadeIn(fadeTime);
		});
		
	}
	

		/* Update quantity */
		
	function updateQuantity(quantityInput) {
  
  			/* Calculate line price */
  	
  		var productRow = $(quantityInput).parent().parent().parent().parent().parent();
  			
  		var price = parseFloat(productRow.find('.price').text());
  		
  		var quantity = $(quantityInput).val();
  		
  		var linePrice = price * quantity;
  		
  		
  			/* Update line price display and recalc cart totals */
  		
  		productRow.parent().parent().find('.subtotal').each(function() {

    		$(this).fadeOut(fadeTime, function() {
      		
    			$(this).text(linePrice.toFixed(2));
      			recalculateCart();
      			$(this).fadeIn(fadeTime);
    	});
  	});

		updateSumItems();
	}

	function updateSumItems() {

  		var sumItems = 0;

  		$('.quantity input').each(function() {
	  
    		sumItems += parseInt($(this).val());
  		});
  
  		$('.total_quantity').parent().parent().parent().parent().parent().parent().find('.total_quantity').fadeOut (fadeTime, function () {
  			
  			$(this).text(sumItems);
  			$(this).fadeIn(fadeTime);
  		
  		});
	}



</script>


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


<!-- footer -->




</body>
</html>