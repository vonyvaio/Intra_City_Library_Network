package com.delete;

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
import javax.servlet.http.Part;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Book_delete
 */
@WebServlet("/Book_delete")
public class Book_delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Book_delete() {
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
		
		int book_id = Integer.parseInt((String)request.getParameter("book_id"));
		int library_id = Integer.parseInt((String)session.getAttribute("library_id"));
		
		String Query1 = "select * from book_details where book_id = " + book_id + " and library_id = " + library_id + ";";
		
		st = con.prepareStatement(Query1);
		
		rs = st.executeQuery();
		
		rs.next();
		
		String book_image_url = rs.getString("book_image_url");
		
		String Query2 = "delete from book_details where book_id = " + book_id + " and library_id = " + library_id + ";";
	     
		st = con.prepareStatement(Query2);
		
	    st.executeUpdate();
	    
	    File file = new File(book_image_url);
		 
	     if(file.delete()) {
	    	 
	            System.out.println("File deleted");
	     }	      
	     else {
	    	 
	    	 System.out.println("File doesn't exists");
	     }
	    
	    request.setAttribute("library_message_delete", "<script type = \"text/javascript\">\r\n" + 
					"\r\n" + 
					"	alert (\"Book Deleted Successfully\");\r\n" + 
					"\r\n" + 
					"</script>");
			
		request.getRequestDispatcher("library.jsp").forward(request, response);
		
		
		
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
