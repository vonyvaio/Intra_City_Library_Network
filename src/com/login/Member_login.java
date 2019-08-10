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
 * Servlet implementation class Member_login
 */
@WebServlet("/Member_login")
public class Member_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member_login() {
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
			
			String member_login_username = request.getParameter("member_login_username");
			String member_login_password = request.getParameter("member_login_password");
			
			String Query1 = "select * from member_details where member_username = '"+member_login_username+"' and member_password = '"+member_login_password+"'";
			
			st = con.prepareStatement(Query1);
			
			rs = st.executeQuery();
			
			if (rs.next()) {
				
				String Name = rs.getString("member_username");
				String Password = rs.getString("member_password");
				
				if (Name.equals(member_login_username) && (Password.equals(member_login_password))) {
					
					HttpSession session = request.getSession(); //get session
					
					session.setAttribute ("member_id", rs.getString("member_id"));
					session.setAttribute ("member_username", rs.getString("member_username"));
					
					session.setAttribute ("member_first_name", rs.getString("member_first_name"));
					session.setAttribute ("member_last_name", rs.getString("member_last_name"));
					session.setAttribute ("member_email", rs.getString("member_email"));
					
					session.setAttribute ("member_address", rs.getString("member_address"));
					session.setAttribute ("member_pincode", rs.getString("member_pincode"));
					session.setAttribute ("member_contact_no", rs.getString("member_contact_no"));
					
					session.setAttribute ("category_string", rs.getString("category_string"));
					session.setAttribute ("category_number", rs.getString("category_number")); //set session parameters
					
					response.sendRedirect("index.jsp");
					
				}
			}
			
			else {
				
				request.setAttribute("member_error", "<div class=\"alert alert-danger alert-dismissible fade in\">\r\n" + 
						"    					<a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\r\n" + 
						"    					<strong>INVALID LOGIN CREDIENTIALS OR CREATE ACCOUNT</strong>\r\n" + 
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
