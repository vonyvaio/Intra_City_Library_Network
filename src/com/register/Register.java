package com.register;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		
		PrintWriter out = response.getWriter ();
		Connection con = null;
		Statement st = null;
		
		try {
			
			int Username = Integer.parseInt(request.getParameter("Username"));
			
			String Firstname = request.getParameter("First_Name");
			String Lastname = request.getParameter("Last_Name");
			
			String Emailaddress = request.getParameter("Email_Address");
			
			String Mobilenumber = request.getParameter("Mobile_Number");
			
			String address1 = request.getParameter("Address_Line_1");
			String address2 = request.getParameter("Address_Line_2");
			int Zipcode = Integer.parseInt(request.getParameter("Zipcode"));
			
			String password = request.getParameter("Password");
			String type = request.getParameter("type");
			
			Class.forName ("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection ("jdbc:mysql://localhost/library", "root", "4159");
			st = con.createStatement();
		
			int i = st.executeUpdate("insert into register (first_name,last_name,email_address,mobile_no,address_line1,address_line2,zipcode,register_password,type,username) values('"+Firstname+"','"+Lastname+"','"+Emailaddress+"','"+Mobilenumber+"','"+address1+"','"+address2+"','"+Zipcode+"','"+password+"','"+type+"','"+Username+"')"); 
			
			if(type.equals("student")) {
			
				st.executeUpdate("insert into login_student(username_student,password_student) values ('"+Username+"','"+password+"')"); 
			}
			else {
			
				st.executeUpdate("insert into login_library(username_library,password_library) values ('"+Username+"','"+password+"')"); 
			}

		
			if( i > 0 ) {
			
				if(type.equals("student")){
				
					response.sendRedirect("index.jsp");  
				}
			
				else {
				
					response.sendRedirect("welcome_library.html");
				}
			}

			else {
	      
				out.println("wrong Password");
			}
		
		}
		
		catch (Exception e) {
			
			out.println (e);
			
		}
		
		finally  {
			
			try {
				if (con != null) {
				
					con.close ();
				}
				
				if (st != null) {
					
					st.close ();
				}
			
			} catch (Exception e) {
				
				out.println(e);
			}
		}
		
		
	}

}
