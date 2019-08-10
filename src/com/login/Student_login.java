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
 * Servlet implementation class Student_login
 */
@WebServlet("/Student_login")
public class Student_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Student_login() {
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
		// TODO Auto-generated method stub


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
			
			String student_login_username = request.getParameter("student_login_username");
			String student_login_password = request.getParameter("student_login_password");
			
			String Query1 = "select * from student_details where student_username = '"+student_login_username+"' and student_password = '"+student_login_password+"'";
			
			st = con.prepareStatement(Query1);
			
			rs = st.executeQuery();
			
			if (rs.next()) {
				
				String Name = rs.getString("student_username");
				String Password = rs.getString("student_password");
				
				if (Name.equals(student_login_username) && (Password.equals(student_login_password))) {
					
					
					HttpSession session = request.getSession(); //get session
					
					session.setAttribute ("student_id", rs.getString("student_id"));
					session.setAttribute ("student_username", rs.getString("student_username"));
					
					session.setAttribute ("student_first_name", rs.getString("student_first_name"));
					session.setAttribute ("student_last_name", rs.getString("student_last_name"));
					session.setAttribute ("student_email", rs.getString("student_email"));
					
					session.setAttribute ("student_address", rs.getString("student_address"));
					session.setAttribute ("student_pincode", rs.getString("student_pincode"));
					session.setAttribute ("student_contact_no", rs.getString("student_contact_no"));
					session.setAttribute ("student_college_name", rs.getString("student_college_name"));
					
					session.setAttribute ("category_string", rs.getString("category_string"));
					session.setAttribute ("category_number", rs.getString("category_number")); //set session parameters
					
					response.sendRedirect("index.jsp");
					
				}
			}
			
			else {
				
				request.setAttribute("student_error", "<div class=\"alert alert-danger alert-dismissible fade in\">\r\n" + 
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
