<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix = "fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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

<html lang="en" >

<head>
  
 	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<meta name="description" content="">
  	<meta name="author" content="">
  	
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	
  	<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
  	
  	<link href="css/Footer-with-button-logo.css" rel="stylesheet">
  	
  	<link href="css/bootstrap.min.css" rel="stylesheet">
  	<link href="css/font-awesome.min.css" rel="stylesheet">
  	<link href="css/responsive.css" rel="stylesheet">
  	<link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
  	
 
	<title>My Cart</title>

  	<link rel="stylesheet" href="css/cart.css">

  	

  
</head>

<body>



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
						</ul>
					</div>
					</div>
					
				</div>
 
	  			</div>
	  			</div>
	  		
  				</div>
  		
  				</div>


	<div class = "container">

    <div class="basket">
     

      <div class="basket-labels">
        <ul>
          <li class="item item-heading">Item</li>
          <li class="price">Price</li>
          <li class="quantity">Quantity</li>
          <li class="subtotal">Subtotal</li>
        </ul>
      </div>


		<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"  
     						url="jdbc:mysql://localhost/library_management?autoReconnect=true&useSSL=false"  
     						user="root"  password="4159"/>
     						
     			<c:choose>
        
       				<c:when test="${category_string == 'student'}">
       				
	  					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details natural join cart_details where cart_details.customer_id = <%= session.getAttribute("student_id") %> and cart_details.category_string like 'student' and cart_details.book_id = book_details.book_id;  
						</sql:query>
      				</c:when>

       							
       				<c:when test="${category_string == 'member'}">
	 					<sql:query dataSource="${db}" var="rs">  
							SELECT * from book_details natural join cart_details where cart_details.customer_id = <%= session.getAttribute("member_id") %> and cart_details.category_string like 'student' and cart_details.book_id = book_details.book_id;  
						</sql:query>
        			</c:when>
        			
 					<c:otherwise>
	  					<sql:query dataSource="${db}" var="rs">  
							SELECT * from cart_details, book_details;  
						</sql:query>
        			</c:otherwise>

     			</c:choose>
     			
     			
     			
     			<c:forEach var="book" items="${rs.rows}">  
					
					<c:url value="/Book_display.jsp" var="display_url">

						<c:param name="book_id" value="${book.book_id}"/>
					</c:url>
					
					<c:url value="/Add_to_cart" var="cart_url">
						
						<c:param name="book_id" value="${book.book_id}" />
					</c:url>

					<div class="basket-product">
        				
        			<div class="item">
          				
          				<div class="product-image">
            				<img src=${book.book_image_url} alt="Placholder Image 2" class="product-frame">
          				</div>
          				
          				<div class="product-details">
            			
            			<h1> <strong><span class="item-quantity">1</span> x ${book.book_name} </strong> </h1>
            			
            			<p><strong>Book ID: ${book.book_id}</strong></p>
            			<p>Copies Available: ${book_no_of_copies}</p>
          			
          				</div>
        			</div>
        
        			<div class="price">${book.book_price}</div>
        			
        			<div class="quantity">
          				<input type="number" value="1" min="1" class="quantity-field">
        			</div>
        	
        			<div class="subtotal">${book.book_price}</div>
        			
        			<div class="remove">
        			
          				<button>Remove</button>
        			</div>
      			
      			</div>

				</c:forEach>


      
    <!-- <div class="basket-product">
        <div class="item">
          <div class="product-image">
            <img src="http://placehold.it/120x166" alt="Placholder Image 2" class="product-frame">
          </div>
          <div class="product-details">
            <h1><strong><span class="item-quantity">4</span> x Eliza J</strong> Lace Sleeve Cuff Dress</h1>
            <p><strong>Navy, Size 18</strong></p>
            <p>Product Code - 232321939</p>
          </div>
        </div>
        <div class="price">26.00</div>
        <div class="quantity">
          <input type="number" value="4" min="1" class="quantity-field">
        </div>
        <div class="subtotal">104.00</div>
        <div class="remove">
          <button>Remove</button>
        </div>
      </div>


      <div class="basket-product">
        <div class="item">
          <div class="product-image">
            <img src="http://placehold.it/120x166" alt="Placholder Image 2" class="product-frame">
          </div>
          <div class="product-details">
            <h1><strong><span class="item-quantity">4</span> x Eliza J</strong> Lace Sleeve Cuff Dress</h1>
            <p><strong>Navy, Size 18</strong></p>
            <p>Product Code - 232321939</p>
          </div>
        </div>
        <div class="price">26.00</div>
        <div class="quantity">
          <input type="number" value="4" min="1" class="quantity-field">
        </div>
        <div class="subtotal">104.00</div>
        <div class="remove">
          <button>Remove</button>
        </div>
      </div>


      <div class="basket-product">
        <div class="item">
          <div class="product-image">
            <img src="http://placehold.it/120x166" alt="Placholder Image 2" class="product-frame">
          </div>
          <div class="product-details">
            <h1><strong><span class="item-quantity">1</span> x Whistles</strong> Amella Lace Midi Dress</h1>
            <p><strong>Navy, Size 10</strong></p>
            <p>Product Code - 232321939</p>
          </div>
        </div>
        <div class="price">26.00</div>
        <div class="quantity">
          <input type="number" value="1" min="1" class="quantity-field">
        </div>
        <div class="subtotal">26.00</div>
        <div class="remove">
          <button>Remove</button>
        </div>
      </div> -->


    </div>




    <div class="aside">
    
      <div class="summary">
      
        <div class="summary-total-items"><span class="total-items"></span> Items in your Bag</div>
        	<div class="summary-subtotal">
          		<div class="subtotal-title">Subtotal</div>
          			<div class="subtotal-value final-value" id="basket-subtotal">130.00</div>
          				<div class="summary-promo hide">
            				<div class="promo-title">Promotion</div>
            			<div class="promo-value final-value" id="basket-promo"></div>
          			</div>
        		</div>
        
        
        <div class="summary-delivery">
        	<select name="delivery-collection" class="summary-delivery-selection">
             	<option value="0" selected="selected">Rent or Delivery</option>
             	<option value="collection">Rent</option>
             	<option value="first-class">Delivery</option>
             	<option value="second-class">Prime Delivery</option>
             	<option value="signed-for">Pick from nearest library</option>
          	</select>
        </div>
        
        <div class="summary-total">
        	
        	<div class="total-title">Total</div>
          	<div class="total-value final-value" id="basket-total">130.00</div>
        </div>
        
        <div class="summary-checkout">
         	
         	<button class="checkout-cta">Go to Secure Checkout</button>
        </div>
      </div>
    </div>

  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>

  <script  src="js/cart.js"></script>
  
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

</body>

</html>
