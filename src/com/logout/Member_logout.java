package com.logout;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Member_logout
 */
@WebServlet("/Member_logout")
public class Member_logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member_logout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();		
		
		session.removeAttribute ("member_id");
		
		session.removeAttribute ("member_username");
		session.removeAttribute ("member_first_name");
		session.removeAttribute ("member_last_name");
		
		session.removeAttribute ("member_email");
		session.removeAttribute ("member_address");
		session.removeAttribute ("member_pincode");
		
		session.removeAttribute ("member_contact_no");
		
		session.removeAttribute ("category_string");
		session.removeAttribute ("category_number"); //remove session parameters
		
		session.invalidate();

		request.setAttribute("member_logout_message", "<script type = \"text/javascript\">\r\n" + 
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
