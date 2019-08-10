package com.logout;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Student_logout
 */
@WebServlet("/Student_logout")
public class Student_logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Student_logout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();		
		
		session.removeAttribute ("student_id");
		
		session.removeAttribute ("student_username");
		session.removeAttribute ("student_first_name");
		session.removeAttribute ("student_last_name");
		
		session.removeAttribute ("student_email");
		session.removeAttribute ("student_address");
		session.removeAttribute ("student_pincode");
		
		session.removeAttribute ("student_contact_no");
		session.removeAttribute ("student_college_name");
		
		session.removeAttribute ("category_string");
		session.removeAttribute ("category_number"); //remove session parameters
		
		session.invalidate();

		request.setAttribute("student_logout_message", "<script type = \"text/javascript\">\r\n" + 
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
