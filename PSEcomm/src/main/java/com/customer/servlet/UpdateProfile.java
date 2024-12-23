package com.customer.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.customer.dao.CustomerDAO;
import com.customer.dao.CustomerDAOImpl;
import com.customer.dto.Customer;


@WebServlet("/Customer/UpdateProfile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		String fname=req.getParameter("firstName");
		String lname=req.getParameter("lastName");
		String phoneno=req.getParameter("phone");
		long phone=Long.parseLong(phoneno);
		String location=req.getParameter("location");
		
		int loc=Integer.parseInt(location);
		
		CustomerDAO cdao=new CustomerDAOImpl();
		Customer c=(Customer)session.getAttribute("user");
		if(c!=null)
		{

			c.setFirstName(fname);
			c.setLastName(lname);
			c.setPhone(phone);
			c.setLid(loc);
		  c=cdao.updateCustomer(c);
		  if(c!=null)
		  {
			  req.setAttribute("success", "Profile updated successfully");
			  req.getSession().setAttribute("user", cdao.getCustomer(c.getCid()));
			  RequestDispatcher rd=req.getRequestDispatcher("/Customer/Profile.jsp");
			  rd.forward(req, resp);
		  }else {
			  req.setAttribute("failure", "Profile failed to updated");
			  RequestDispatcher rd=req.getRequestDispatcher("UpdateProfile.jsp");
			  rd.forward(req, resp);
		  }
		}
		
	}

}
