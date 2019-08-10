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
 * Servlet implementation class Remove_from_cart
 */
@WebServlet("/Remove_from_cart")
public class Remove_from_cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Remove_from_cart() {
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
		
		String Query, customer_id, category_string, book_id;
		
		Query = "";
			
		try {
			
				//initializing connection
			
			Class.forName(DRIVER);
			con = DriverManager.getConnection(JDBC_PATH, DB_USERNAME, DB_PASS);
			
				//initializing parameters
			
			book_id = request.getParameter("book_id");
			category_string = (String) session.getAttribute("category_string");
			
			if ( ( (String) session.getAttribute("category_string") ).equals("student") ) {
				
				customer_id = (String) session.getAttribute("student_id");
			
				Query = "delete from cart_details where customer_id = " + Integer.parseInt(customer_id) + " and book_id = " + Integer.parseInt(book_id) + " and category_string = 'student';";
			}
			
			if ( ( (String) session.getAttribute("category_string") ).equals("member") ) {
				
				customer_id = (String) session.getAttribute("member_id");
				
				Query = "delete from cart_details where customer_id = " + Integer.parseInt(customer_id) + " and book_id = " + Integer.parseInt(book_id) + " and category_string = 'member';";

			}
			
			st = con.prepareStatement(Query);
			
			st.executeUpdate();
			
			request.setAttribute("cart_message", "<script type = \"text/javascript\">\r\n" + 
					"\r\n" + 
					"	alert (\"Book Removed Successfully\");\r\n" + 
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
