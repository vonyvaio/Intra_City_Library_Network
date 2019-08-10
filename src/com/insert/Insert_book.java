package com.insert;

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
 * Servlet implementation class Insert_book
 */
@WebServlet("/Insert_book")

@MultipartConfig (fileSizeThreshold = 1024 * 1024 * 20,
				  maxFileSize = 1024 * 1024 * 20,
				  maxRequestSize = 1024 * 1024 * 50)

public class Insert_book extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Insert_book() {
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
			
			String book_name = request.getParameter("BookName");
			String book_author = request.getParameter("Author");
			String book_publisher = request.getParameter("Publisher");
			
			String book_price = request.getParameter("Price");
			String book_no_of_copies = request.getParameter("Copies");
			
			String book_description = request.getParameter("Description");
			String book_language = request.getParameter("language");
			
			String rent_price = request.getParameter("rent_price");
			String discount_price = request.getParameter("discount_price");
			
			System.out.println (discount_price);
			
			if (discount_price.isEmpty()) {
				
				discount_price = "0";
			}
			
			System.out.println (discount_price);
			
			String genre [] = request.getParameterValues("genre");
			String book_genre = "";
			
			for ( String temp : genre ) {
				
				if (temp != null) book_genre = temp  + ", " + book_genre ;
			}
			
				//Getting Image
			
			Part part = request.getPart("Book_image"); //Getting book stream
			String fileName = extractFileName (part);
		
			int index = fileName.lastIndexOf("\\"); 
			fileName = fileName.substring(index + 1); //Extracting file name
			
			String savePath = "C:\\Users\\Dell\\eclipse-workspace\\MIni_Project\\WebContent\\images\\library" + File.separator + session.getAttribute("library_id") + File.separator +fileName;
			String savePath1 = "\"images\\library" + File.separator + session.getAttribute("library_id") + File.separator +fileName + "\"";
			File fileSaveDir = new File (savePath);
			part.write(savePath + File.separator);
			
			String Query1 = "insert into book_details (book_name, book_author, book_publisher, book_price, rent_price, discount_price, book_no_of_copies, book_description, book_language, book_genre, book_image_url, library_id) values (?,?,?,?,?,?,?,?,?,?,?,?)";
			st = con.prepareStatement(Query1);

			st.setString(1, book_name);
			st.setString(2, book_author);
			st.setString(3, book_publisher);
			st.setString(4, book_price);
			st.setString(5, rent_price);
			st.setString(6, discount_price);
			
			st.setString(7, book_no_of_copies);
			
			st.setString(8, book_description);
			st.setString(9, book_language);
			st.setString(10, book_genre);
			st.setString(11, savePath1);
			
			String temp = (String) session.getAttribute("library_id");
			int library_id = Integer.parseInt(temp);
			st.setInt(12, library_id);
			
			st.executeUpdate();
			
			request.setAttribute("insert_book_message", "<script type = \"text/javascript\">\r\n" + 
					"\r\n" + 
					"	alert (\"Book Inserted Successfully\");\r\n" + 
					"\r\n" + 
					"</script>");
			
			request.getRequestDispatcher("insert_book.jsp").forward(request, response);
			
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

	private String extractFileName (Part part) {
		// TODO Auto-generated method stub
		
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		
		for (String s : items) {
			
			if  (s.trim().startsWith("filename"))
				return s.substring(s.indexOf ("=") + 2,  s.length() - 1);
			
		}
		
		return "";
	}

}
