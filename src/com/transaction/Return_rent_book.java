package com.transaction;

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
 * Servlet implementation class Return_rent_book
 */
@WebServlet("/Return_rent_book")
public class Return_rent_book extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Return_rent_book() {
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
		
			
		try {
			
				//initializing connection
			Class.forName(DRIVER);
			con = DriverManager.getConnection(JDBC_PATH, DB_USERNAME, DB_PASS);
			
				//initializing parameters
		
			
			String Query;
			int book_id = Integer.parseInt((String) request.getParameter("book_id"));
			int rent_order_id = Integer.parseInt((String) request.getParameter("rent_id"));
						
			Query = "update book_details set book_no_of_copies = book_no_of_copies + 1 where book_id = " + book_id;
			st = con.prepareStatement(Query);
			st.executeUpdate();
			
			Query = "update rent_order_details set status = 'RETURNED' where rent_order_id = " + rent_order_id;
			st = con.prepareStatement(Query);
			st.executeUpdate();

			request.setAttribute("account_message", "<script type = \"text/javascript\">\r\n" + 
					"\r\n" + 
					"	alert (\"Book Returned Successfully\");\r\n" + 
					"\r\n" + 
					"</script>");
			
			request.getRequestDispatcher("account.jsp").forward(request, response);
			
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
