package com.cart;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Add_to_cart
 */
@WebServlet("/Add_to_cart")
public class Add_to_cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_to_cart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection con = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String JDBC_PATH = "jdbc:mysql://localhost/library_management?autoReconnect=true&useSSL=false";
		String DB_USERNAME = "root";
		String DB_PASS = "4159";
		
		String DRIVER = "com.mysql.cj.jdbc.Driver";
		
		session = request.getSession();
		
		String Query = "";
		
		if ((String)session.getAttribute("category_string") == null) {
			
			request.setAttribute("cart_error", "<div class=\"alert alert-danger alert-dismissible fade in\">\r\n" + 
					"    					<a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\r\n" + 
					"    					<strong>Please Create Account First To Start Buying or Renting</strong>\r\n" + 
					" 					</div>");
			
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} 
		
		else {
		    
			try {
				
				//initializing connection
		
			Class.forName(DRIVER);
			con = DriverManager.getConnection(JDBC_PATH, DB_USERNAME, DB_PASS);

				//initializing parameters
			
						
			
			int temp_id;
			
			int book_id = Integer.parseInt(request.getParameter("book_id"));

			String category_string = (String) session.getAttribute("category_string");

			if (  category_string.equals("student")  ) {
				
				temp_id = Integer.parseInt((String) session.getAttribute("student_id"));
				
				Query = "select * from cart_details where book_id = " + book_id + " and customer_id = " + temp_id +" and category_string = 'student'";
				st = con.prepareStatement(Query);
				rs = st.executeQuery();
				
				if (rs.next()) {
					
					request.setAttribute("cart_message", "<div class = \"container\">\r\n" + 
							"  <div class=\"alert alert-success alert-dismissible fade in\">\r\n" + 
							"    <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\r\n" + 
							"    <strong>Book Already Added</strong> \r\n" + 
							"  </div>\r\n" + 
							"</div>");
					
					request.getRequestDispatcher("cart.jsp").forward(request, response);
					
					return;
					
				}
				
				
				String Query1 = "insert into cart_details (customer_id, book_id, category_string) values (?,?,?)";
				st = con.prepareStatement(Query1);
				
				st.setInt(1, temp_id);
				st.setInt(2, book_id);
				st.setString(3, category_string);
				
				st.executeUpdate();
				
				request.setAttribute("cart_message", "<div class = \"container\">\r\n" + 
						"  <div class=\"alert alert-success alert-dismissible fade in\">\r\n" + 
						"    <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\r\n" + 
						"    <strong>Book Added Sucessfully</strong> \r\n" + 
						"  </div>\r\n" + 
						"</div>");
				
				request.getRequestDispatcher("index.jsp").forward(request, response);
				
				
			}
			
			else if (  category_string.equals("member")  ){
				
				temp_id = Integer.parseInt((String) session.getAttribute("member_id"));
				
				Query = "select * from cart_details where book_id = " + book_id + " and customer_id = " + temp_id +" and category_string = 'member'";
				st = con.prepareStatement(Query);
				rs = st.executeQuery();
				
				if (rs.next()) {
					
					request.setAttribute("cart_message", "<div class = \"container\">\r\n" + 
							"  <div class=\"alert alert-success alert-dismissible fade in\">\r\n" + 
							"    <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\r\n" + 
							"    <strong>Book Already Added</strong> \r\n" + 
							"  </div>\r\n" + 
							"</div>");
					
					request.getRequestDispatcher("cart.jsp").forward(request, response);
					
					return;
					
				}
								
				String Query1 = "insert into cart_details (customer_id, book_id, category_string) values (?,?,?)";
				st = con.prepareStatement(Query1);
				
				
				
				st.setInt(1, temp_id);
				st.setInt(2, book_id);
				st.setString(3, category_string);
				
				st.executeUpdate();	
				
				request.setAttribute("cart_message", "<div class = \"container\">\r\n" + 
						"  <div class=\"alert alert-success alert-dismissible fade in\">\r\n" + 
						"    <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\r\n" + 
						"    <strong>Book Added Sucessfully</strong> \r\n" + 
						"  </div>\r\n" + 
						"</div>");
				
				request.getRequestDispatcher("index.jsp").forward(request, response);
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
			
		}
		
	} 

		
}
