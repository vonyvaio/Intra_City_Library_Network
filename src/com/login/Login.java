package com.login;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mysql.cj.xdevapi.Statement;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		
		
		try {
			
			//getting parameters
		String Username = request.getParameter("Username");  
		String Password = request.getParameter("Password"); 
		
		
			//getting parameters
		Class.forName ("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection ("jdbc:mysql://localhost/library", "root", "4159");
		java.sql.Statement st= con.createStatement();
		
		
		ResultSet result;
		
		result = st.executeQuery("select * from login_student where username_student = '"+Username+"' and password_student = '"+Password+"'");
		
		if(result.next()) {
			
			if (result.getString("username_student").equals(Username) && result.getString("password_student").equals(Password)) {
			
				HttpSession session = request.getSession();
				session.setAttribute ("username", Username);
				response.sendRedirect("index.jsp"); 
			}
		}
		
		else {
			
			request.setAttribute("result1", "<div class=\"alert alert-danger alert-dismissible fade in\">\r\n" + 
					"    					<a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\r\n" + 
					"    					<strong>INVALID LOGIN CREDIENTIALS</strong>\r\n" + 
					" 					</div>");
			
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		} catch (Exception e) {
			
			out.println (e);
		}
		
	}

}

