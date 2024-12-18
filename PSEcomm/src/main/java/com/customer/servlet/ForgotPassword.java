package com.customer.servlet;

import java.io.IOException;

import com.customer.dao.CustomerDAO;
import com.customer.dao.CustomerDAOImpl;
import com.customer.dto.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Customer/forgotPassword")
public class ForgotPassword extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		long phone=Long.parseLong(req.getParameter("phone"));
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		String confirm=req.getParameter("confirm");
		
		Customer c=new Customer();
		CustomerDAO cdao=new CustomerDAOImpl();
		Customer c1=cdao.getCustomer(email);
		
		if(c1!=null )
		{
			if(phone==c1.getPhone())
			{
			
				if(password.equals(confirm)) {
					c1.setPassword(confirm);
					Customer c2=cdao.updateCustomer(c1);
					if(c2!=null) {
						req.setAttribute("success", "Password changed successfully");
						RequestDispatcher rd=req.getRequestDispatcher("Forgot.jsp"); 
						rd.forward(req, resp);
					}
					else {
						req.setAttribute("failure", "Failed to change password");
						RequestDispatcher rd=req.getRequestDispatcher("Forgot.jsp"); 
						rd.forward(req, resp);
					}
				}
				else {
					req.setAttribute("failure", "Password mismatch");
					RequestDispatcher rd=req.getRequestDispatcher("Forgot.jsp");
					rd.forward(req, resp);	
				}
			}else {
				req.setAttribute("failure", "Phone Number does not exists");
				RequestDispatcher rd=req.getRequestDispatcher("Forgot.jsp");
				rd.forward(req, resp);		
			}		
		}else {
			req.setAttribute("failure", "Email does not exists");
			RequestDispatcher rd=req.getRequestDispatcher("Forgot.jsp");
			rd.forward(req, resp);
		}
	}
	
	
}
