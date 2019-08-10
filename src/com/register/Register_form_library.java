package com.register;

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

/**
 * Servlet implementation class Register_form_library
 */
@WebServlet("/Register_form_library")
public class Register_form_library extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register_form_library() {
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
			
			String library_username = request.getParameter("library_user_name");
			String library_name = request.getParameter("library_name");

			String library_email = request.getParameter("library_email");
			String library_contact_no = request.getParameter("library_mobile_number");
			
			String library_address = request.getParameter("library_address");
			String library_pincode = request.getParameter("library_pincode");
			String library_password = request.getParameter("library_password");
			
			String Query1 = "insert into library_details (library_username, library_name, library_email, library_password, library_address, library_pincode, library_contact_no) values (?,?,?,?,?,?,?)";
			st = con.prepareStatement(Query1);
			
			st.setString(1, library_username);
			st.setString(2, library_name);
			st.setString(3, library_email);
			st.setString(4, library_password);
			st.setString(5, library_address);
			st.setString(6, library_pincode);
			st.setString(7, library_contact_no);

			st.executeUpdate();
			
			st = null;
			String Query2 = "select library_id from library_details where library_username = '"+ library_username +"'";
			st = con.prepareStatement(Query2);

			rs = st.executeQuery();
			
			if (rs.next()) {
				
				final String FOLDER ="C:\\Users\\Dell\\eclipse-workspace\\MIni_Project\\WebContent\\images\\library" + File.separator + rs.getInt("library_id");
				File newFolder = new File(FOLDER);
				newFolder.mkdirs();
			}

			String library_login_username = library_username;
			String library_login_password = library_password;
			
			Query1 = "select * from library_details where library_username = '"+library_login_username+"' and library_password = '"+library_login_password+"'";
			
			
			st = con.prepareStatement(Query1);
	
			rs = st.executeQuery();
			
			rs.next();
			
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
