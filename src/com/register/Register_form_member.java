package com.register;

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

/**
 * Servlet implementation class Register_form_member
 */
@WebServlet("/Register_form_member")
public class Register_form_member extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register_form_member() {
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
			
			
			String member_username = request.getParameter("member_user_name");
			String member_first_name = request.getParameter("member_first_name");
			String member_last_name = request.getParameter("member_last_name");
			String member_email = request.getParameter("member_email");
			String member_contact_no = request.getParameter("member_mobile_number");
			
			String member_address = request.getParameter("member_address");
			String member_pincode = request.getParameter("member_pincode");
			String member_password = request.getParameter("member_password");
			
			String Query1 = "insert into member_details (member_username, member_first_name, member_last_name, member_email, member_password, member_address, member_pincode, member_contact_no) values (?,?,?,?,?,?,?,?)";
			
			st = con.prepareStatement(Query1);
			
			st.setString(1, member_username);
			st.setString(2, member_first_name);
			st.setString(3, member_last_name);
			st.setString(4, member_email);
			st.setString(5, member_password);
			st.setString(6, member_address);
			st.setString(7, member_pincode);
			st.setString(8, member_contact_no);

			st.executeUpdate();
			
			request.setAttribute("login_message", "<script type = \"text/javascript\">\r\n" + 
					"\r\n" + 
					"	alert (\"Registered Successfully\");\r\n" + 
					"\r\n" + 
					"</script>");
			
			request.getRequestDispatcher("login.jsp").forward(request, response);
			
						
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
