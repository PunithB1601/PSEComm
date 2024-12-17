package com.customer.servlet;

import java.io.IOException;

import com.customer.dao.CustomerDAO;
import com.customer.dao.CustomerDAOImpl;
import com.customer.dto.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/login")
public class Login extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		String mail=req.getParameter("email");
		String password=req.getParameter("password");
		
		Customer c=new Customer();
		CustomerDAO cdao=new CustomerDAOImpl();
		Customer email=cdao.getCustomer(mail);
		if(mail.equals(email.getEmail()))
		{
			if(password.equals(c.getPassword()))
			{
				session.setAttribute("customer", c);
				RequestDispatcher rd=req.getRequestDispatcher("Login.jsp"); // dashboard
				rd.forward(req, resp);
			}else {
				req.setAttribute("failure", "Invalid Password");
				RequestDispatcher rd=req.getRequestDispatcher("Login.jsp"); //login
				rd.forward(req, resp);
			}
			
		}else {
			req.setAttribute("failure", "Email not exists");
			RequestDispatcher rd=req.getRequestDispatcher("Login.jsp"); //login
			rd.forward(req, resp);
		}
		
	}

}
