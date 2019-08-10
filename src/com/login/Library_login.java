package com.login;

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

/**
 * Servlet implementation class Library_login
 */
@WebServlet("/Library_login")
public class Library_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Library_login() {
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
		
		String JDBC_PATH = "jdbc:mysql://localhost/library_management?autoReconnect=true&useSSL=false";
		String DB_USERNAME = "root";
		String DB_PASS = "4159";
		
		String DRIVER = "com.mysql.cj.jdbc.Driver";
		
		try {
			
			Class.forName(DRIVER);
			con = DriverManager.getConnection(JDBC_PATH, DB_USERNAME, DB_PASS);
			
			String library_login_username = request.getParameter("library_login_username");
			String library_login_password = request.getParameter("library_login_password");
			
			String Query1 = "select * from library_details where library_username = '"+library_login_username+"' and library_password = '"+library_login_password+"'";
			
			st = con.prepareStatement(Query1);
			
			rs = st.executeQuery();
			
			if (rs.next()) {
				
				String Name = rs.getString("library_username");
				String Password = rs.getString("library_password");
				
				if (Name.equals(library_login_username) && (Password.equals(library_login_password))) {
					
					
					HttpSession session = request.getSession(); //get session
					
					session.setAttribute ("library_id", rs.getString("library_id"));
					session.setAttribute ("library_username", rs.getString("library_username"));
					session.setAttribute ("library_name", rs.getString("library_name"));
					
					session.setAttribute ("library_address", rs.getString("library_address"));
					session.setAttribute ("library_pincode", rs.getString("library_pincode"));
					session.setAttribute ("library_contact_no", rs.getString("library_contact_no"));
					
					session.setAttribute ("library_email", rs.getString("library_email"));
					session.setAttribute ("category_string", rs.getString("category_string"));
					session.setAttribute ("category_number", rs.getString("category_number")); //set session parameters
					
					response.sendRedirect("library.jsp");
				
				}
			}
			
			else {
				
				request.setAttribute("library_error", "<div class=\"alert alert-danger alert-dismissible fade in\">\r\n" + 
						"    					<a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\r\n" + 
						"    					<strong>INVALID LIBRARY CREDENTIALS</strong>\r\n" + 
						" 					</div>");
				
				request.getRequestDispatcher("login.jsp").forward(request, response);
				
				
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
