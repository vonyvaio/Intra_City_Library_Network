package com.logout;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class Library_logout
 */
@WebServlet("/Library_logout")
public class Library_logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Library_logout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		session.removeAttribute ("username");
		
		session.removeAttribute ("library_id");
		session.removeAttribute ("library_username");
		session.removeAttribute ("library_name");
		
		session.removeAttribute ("library_address");
		session.removeAttribute ("library_pincode");
		session.removeAttribute ("library_contact_no");
		
		session.removeAttribute ("library_email");
		session.removeAttribute ("category_string");
		session.removeAttribute ("category_number"); //remove session parameters
		
		session.invalidate();

		request.setAttribute("library_logout_message", "<script type = \"text/javascript\">\r\n" + 
				"\r\n" + 
				"	alert (\"Logged Out Successfully\");\r\n" + 
				"\r\n" + 
				"</script>");
		
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		
	}

}
