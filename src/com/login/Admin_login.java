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
 * Servlet implementation class Admin_login
 */
@WebServlet("/Admin_login")
public class Admin_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_login() {
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
			
			int library_login_username = Integer.parseInt(request.getParameter("username"));
			String library_login_password = request.getParameter("pass");
			
			String Query1 = "select * from admin_login where admin_id = '"+library_login_username+"' and admin_password = '"+library_login_password+"'";
			
			st = con.prepareStatement(Query1);
			
			rs = st.executeQuery();
			
			if (rs.next()) {
				
				int Name = rs.getInt("admin_id");
				String Password = rs.getString("admin_password");
				
				if ((Name == library_login_username) && (Password.equals(library_login_password))) {
					
					
					HttpSession session = request.getSession(); //get session
					
					session.setAttribute ("admin_id", library_login_username);
					session.setAttribute ("category_string", "admin");
					 
						//set session parameters
					
					response.sendRedirect("Admin_Control_Panel.jsp");
				
				}
			}
			
			else {
				
				request.setAttribute("login_error", "<script type = \"text/javascript\">\r\n" + 
						"\r\n" + 
						"	alert (\"Invalid Admin Credentials\");\r\n" + 
						"\r\n" + 
						"</script>");
				
				request.getRequestDispatcher("admin_login.jsp").forward(request, response);
				
				
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
