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
@WebServlet("/DeleteEmployeeServlet")
public class deleteEmp extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		HttpSession session=req.getSession(false);
	    String eid = req.getParameter("eid");
	    String delete =req.getParameter("delete");
	    
	    if (eid == null || eid.isEmpty()) 
	    {
	        req.setAttribute("failed", "EID number is missing.");
	        RequestDispatcher rd = req.getRequestDispatcher("EmpList.jsp");
	        rd.forward(req, resp);
	        return;
	    }

	    if (eid != null && "Delete".equals(delete)) 
	    {
	        int empid = Integer.parseInt(eid);
	        EmployeeDAO edao = new EmployeeDAOImp();

	        Employee currentUser = (Employee) session.getAttribute("Employee");
	        Employee targetEmployee = edao.getEmployee(empid);

	        if (targetEmployee != null) 
	        {
	            if (currentUser.getEid() == targetEmployee.getEid()) 
	            {
	                req.setAttribute("failure", "Cannot delete your own account.");
	            } 
	            else if ("CEO".equalsIgnoreCase(targetEmployee.getJob())) 
	            {
	                req.setAttribute("failure", "Cannot delete an employee with the role of CEO.");
	            } 
	            else 
	            {
	                boolean res = edao.deleteemployee(targetEmployee);
	                if (res)
	                {
	                    req.setAttribute("success", "Employee is Deleted Successfully");
	                    RequestDispatcher rd = req.getRequestDispatcher("EmpList.jsp");
	                    rd.forward(req, resp);
	                    return;
	                } 
	                else 
	                {
	                    req.setAttribute("failure", "Failed to delete employee. Please try again.");
	                }
	            }
	        } 
	        else 
	        {
	            req.setAttribute("failure", "Employee not found.");
	        }
	        
	        RequestDispatcher rd = req.getRequestDispatcher("EmpList.jsp");
	        rd.forward(req, resp);
	    }
	}
}
