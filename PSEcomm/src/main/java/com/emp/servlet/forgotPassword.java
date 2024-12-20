package com.emp.servlet;

import java.io.IOException;

import com.emp.DAO.EmployeeDAO;
import com.emp.DAO.EmployeeDAOImp;
import com.emp.DTO.Employee;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/changePassword")
public class forgotPassword extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		HttpSession session=req.getSession(false);
		String mail=req.getParameter("mail");
		String setpass=req.getParameter("password");
		String conpass=req.getParameter("confirm_password");
		
		
		EmployeeDAO edao=new EmployeeDAOImp();
		
		Employee e=edao.getEmployee(mail);
		
		if(e!=null && mail.equals(e.getMail()) && setpass.equals(conpass))
		{
			e.setPassword(setpass);
			boolean res1=edao.updateemployee(e);
			if(res1)
			{
				req.setAttribute("success", "Pin updated Successful");
				RequestDispatcher rd=req.getRequestDispatcher("forgotPassword.jsp");
				rd.forward(req, resp);
			}
			else
			{
				req.setAttribute("failure", "Pin update Failed");
				RequestDispatcher rd=req.getRequestDispatcher("forgotPassword.jsp");
				rd.forward(req, resp);
			}
		}
		else {
		req.setAttribute("failure", "Invalid Credentials");
		RequestDispatcher rd=req.getRequestDispatcher("forgotPassword.jsp");
		rd.forward(req, resp);
		}
	}
}