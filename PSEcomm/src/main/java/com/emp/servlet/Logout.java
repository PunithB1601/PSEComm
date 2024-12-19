    package com.emp.servlet;
	import java.io.IOException;
	import jakarta.servlet.RequestDispatcher;
	import jakarta.servlet.ServletException;
	import jakarta.servlet.annotation.WebServlet;
	import jakarta.servlet.http.HttpServlet;
	import jakarta.servlet.http.HttpServletRequest;
	import jakarta.servlet.http.HttpServletResponse;
	import jakarta.servlet.http.HttpSession;

	@WebServlet("/logout")
	public class Logout extends HttpServlet{
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//			String logs=req.getParameter("logout");
//			HttpSession session=req.getSession(false);
//			while(logs.equals("logout"))
//			{
//				session.invalidate();
//				req.setAttribute("success", "Logged out successfully");
//				RequestDispatcher rd=req.getRequestDispatcher("employeelogin.jsp");
//				rd.forward(req, resp);
//			}
			
			 HttpSession session = req.getSession(false); 
			// Fetch session if exists if (session != null) 
			 { session.invalidate(); // Invalidate the session } // Clear cache 
			 resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1. 
			 resp.setHeader("Pragma", "no-cache"); // HTTP 1.0. response.setDateHeader("Expires", 0); // 
			 resp.sendRedirect("employeelogin.jsp"); // Redirect to login page or home page
			 }
		}

	}



