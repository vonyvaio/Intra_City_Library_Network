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
 * Servlet implementation class Register_form_student
 */
@WebServlet("/Register_form_student")
public class Register_form_student extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register_form_student() {
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
			
			
			String student_username = request.getParameter("student_user_name");
			String student_first_name = request.getParameter("student_first_name");
			String student_last_name = request.getParameter("student_last_name");
			String student_email = request.getParameter("student_email");
			String student_contact_no = request.getParameter("student_mobile_number");
			String student_college_name = request.getParameter("student_college");
			
			String student_address = request.getParameter("student_address");
			String student_pincode = request.getParameter("student_pincode");
			String student_password = request.getParameter("student_password");
			
			
			String Query1 = "insert into student_details (student_username, student_first_name, student_last_name, student_email, student_password, student_address, student_pincode, student_contact_no, student_college_name) values (?,?,?,?,?,?,?,?,?)";
						
			st = con.prepareStatement(Query1);
			
			st.setString(1, student_username);
			st.setString(2, student_first_name);
			st.setString(3, student_last_name);
			st.setString(4, student_email);
			st.setString(5, student_password);
			st.setString(6, student_address);
			st.setString(7, student_pincode);
			st.setString(8, student_contact_no);
			st.setString(9, student_college_name);
			
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
