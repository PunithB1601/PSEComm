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

@WebServlet("/employeeLogin")
public class Login extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		HttpSession session=req.getSession();
		String id=req.getParameter("empId");
		String password=req.getParameter("empPassword");
		
		int eid=Integer.parseInt(id);
		Employee e=new Employee();
		EmployeeDAO edao=new EmployeeDAOImp();
		e=edao.getEmployee(eid,password);
		if(e!=null)
		{
			session.setAttribute("employee", e);
			RequestDispatcher rd=req.getRequestDispatcher("EmployeeAdminDashboard.jsp");
			rd.forward(req, resp);
		}
		else
		{
			req.setAttribute("failure", "failed to login, try Again!");
			RequestDispatcher rd=req.getRequestDispatcher("employeelogin.jsp");
			rd.forward(req, resp);
		}
	}
}