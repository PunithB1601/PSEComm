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

@WebServlet("/signup/Customer")

public class Register extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fname=req.getParameter("firstName");
		String lname=req.getParameter("lastName");
		String phoneno=req.getParameter("phone");
		long phone=Long.parseLong(phoneno);
		String mail=req.getParameter("email");
		String pass=req.getParameter("password");
		String location = req.getParameter("location");
		int lid = Integer.parseInt(location);
		
		//Customer c=new Customer();
		CustomerDAO cdao=new CustomerDAOImpl();
		Customer c=cdao.getCustomer(mail);
		
		if(c !=null)
		{
			c.setFirstName(fname);
			c.setLastName(lname);
			c.setPhone(phone);
			c.setEmail(mail);
			c.setPassword(pass);
			c.setLid(lid);
			Customer res=cdao.addCustomer(c);
			if(res!=null)
			{
				req.setAttribute("success", "Signup Successfully");
				RequestDispatcher rd=req.getRequestDispatcher("/Customer/Signup.jsp");
				rd.forward(req, resp);
				
			}else {
				req.setAttribute("failure", "Signup failed due to credential not valid");
				RequestDispatcher rd=req.getRequestDispatcher("/Customer/Signup.jsp");
				rd.forward(req, resp);
			}
		}else {
			req.setAttribute("failure", "Mail id Already exist");
			RequestDispatcher rd=req.getRequestDispatcher("/Customer/Signup.jsp");
			rd.forward(req, resp);
			
		}
		
	}

}
