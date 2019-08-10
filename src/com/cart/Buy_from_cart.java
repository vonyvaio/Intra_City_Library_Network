package com.cart;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class Buy_from_cart
 */
@WebServlet("/Buy_from_cart")
public class Buy_from_cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Buy_from_cart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		Connection con = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String JDBC_PATH = "jdbc:mysql://localhost/library_management?autoReconnect=true&useSSL=false";
		String DB_USERNAME = "root";
		String DB_PASS = "4159";
		
		String DRIVER = "com.mysql.cj.jdbc.Driver";
		
		try {
			
			//initializing connection
		
		Class.forName(DRIVER);
		con = DriverManager.getConnection(JDBC_PATH, DB_USERNAME, DB_PASS);
		
			//initializing parameters
		
		String book_id = request.getParameter("book_id");
		String book_quantity = request.getParameter("q_validate");
		String category_string = (String) session.getAttribute("category_string");
		
		String Query = "select * from book_details where book_id = " +book_id+ ";";
		st = con.prepareStatement(Query);
		
		rs = st.executeQuery();
		
		rs.next();
		
		String library_id = rs.getString("library_id");
		
		if (  category_string.equals("student")  ) {
			
			int customer_id = Integer.parseInt((String) session.getAttribute("student_id"));
			
			Query = "insert into buy_order_details (book_id, library_id, customer_id, category_string, book_quantity, buy_date) values (" + Integer.parseInt(book_id)+ "," + Integer.parseInt(library_id) + "," + customer_id +",'"+ category_string + "'," + Integer.parseInt(book_quantity) + ", current_date());";
			st = con.prepareStatement(Query);
			st.executeUpdate();
			
			Query = "update book_details set book_no_of_copies = book_no_of_copies - " + Integer.parseInt(book_quantity) + " where book_id = " +book_id+ ";";
		    st = con.prepareStatement(Query);
		    st.executeUpdate();
		    
		    Query = "update book_details set buy_hit = buy_hit + 1 where book_id = " +book_id+ ";";
		    st = con.prepareStatement(Query);
		    st.executeUpdate();
		    
		    Query = "update book_details set total_hit = total_hit + 1 where book_id = " +book_id+ ";";
		    st = con.prepareStatement(Query);
		    st.executeUpdate();
		    
		    Query = "delete from cart_details where book_id = "+Integer.parseInt(book_id)+" and customer_id = " +customer_id+ " and category_string = 'student';";
		    st = con.prepareStatement(Query);
		    st.executeUpdate();
		}
		
		else if (  category_string.equals("member")  ) {
			
			int customer_id = Integer.parseInt((String) session.getAttribute("member_id"));
			
			Query = "insert into buy_order_details (book_id, library_id, customer_id, category_string, book_quantity, buy_date) values (" + Integer.parseInt(book_id)+ "," + Integer.parseInt(library_id) + "," + customer_id +",'"+ category_string + "'," + Integer.parseInt(book_quantity) + ", current_date());";
			st = con.prepareStatement(Query);
			st.executeUpdate();
			
			Query = "update book_details set book_no_of_copies = book_no_of_copies - " +book_quantity+ " where book_id = " +book_id+ ";";
		    st = con.prepareStatement(Query);
		    st.executeUpdate();
		    
		    Query = "update book_details set buy_hit = buy_hit + 1 where book_id = " +book_id+ ";";
		    st = con.prepareStatement(Query);
		    st.executeUpdate();
		    
		    Query = "update book_details set total_hit = total_hit + 1 where book_id = " +book_id+ ";";
		    st = con.prepareStatement(Query);
		    st.executeUpdate();
		    
		    Query = "delete from cart_details where book_id = "+Integer.parseInt(book_id)+" and customer_id = " +customer_id+ " and category_string = 'member';";
		    st = con.prepareStatement(Query);
		    st.executeUpdate();
		}
		
					
		request.setAttribute("cart_message", "<script type = \"text/javascript\">\r\n" + 
				"\r\n" + 
				"	alert (\"Book Buyed Successfully\");\r\n" + 
				"\r\n" + 
				"</script>");
		
		request.getRequestDispatcher("cart.jsp").forward(request, response);
	
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
