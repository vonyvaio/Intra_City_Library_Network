package com.cart;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class Rent_from_cart
 */
@WebServlet("/Rent_from_cart")
public class Rent_from_cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Rent_from_cart() {
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

			//fetching other details from book_details
		String Query = "select * from book_details where book_id = " + book_id + ";";
		st = con.prepareStatement(Query);
		rs = st.executeQuery(Query);
		
		rs.next();
		
		String library_id = rs.getString("library_id");
		String customer_id = (String) session.getAttribute("student_id");
		String category_string = "student";
		
		// create a sql date object so we can use it in our INSERT statement
		
	      Calendar calendar = Calendar.getInstance();
	      java.sql.Date startDate = new java.sql.Date(calendar.getTime().getTime());
		
	      Query = "insert into rent_order_details (book_id, library_id, customer_id, category_string, issue_date, due_date) values (" +Integer.parseInt(book_id)+ "," +Integer.parseInt(library_id)+ "," +Integer.parseInt(customer_id)+", '"+category_string+"', current_date(), DATE_ADD(current_date(), INTERVAL 7 DAY))";  
	      st = con.prepareStatement(Query);
		
	      st.executeUpdate();
	      
	      Query = "delete from cart_details where book_id = "+Integer.parseInt(book_id)+" and customer_id = " +Integer.parseInt(customer_id)+ " and category_string = 'student';";
	      st = con.prepareStatement(Query);
	      st.executeUpdate();
		
	      Query = "update book_details set book_no_of_copies = book_no_of_copies - 1 where book_id = " +book_id+ ";";
	      st = con.prepareStatement(Query);
	      st.executeUpdate();
	      
	      Query = "update book_details set rent_hit = rent_hit + 1 where book_id = " +book_id+ ";";
		  st = con.prepareStatement(Query);
		  st.executeUpdate();
		    
		  Query = "update book_details set total_hit = total_hit + 1 where book_id = " +book_id+ ";";
		  st = con.prepareStatement(Query);
		  st.executeUpdate();
	      
	      request.setAttribute("cart_message", "<script type = \"text/javascript\">\r\n" + 
				"\r\n" + 
				"	alert (\"Book Rented Successfully Successfully\");\r\n" + 
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
