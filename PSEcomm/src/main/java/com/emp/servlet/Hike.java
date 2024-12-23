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

@WebServlet("/Hike")
public class Hike extends HttpServlet{

@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	 int eid = Integer.parseInt(req.getParameter("eid"));
	double salary=Double.parseDouble(req.getParameter("sal"));
	double com=Double.parseDouble(req.getParameter("com"));
	
	Employee e=new Employee();
	 e.setEid(eid);
	 e.setSalary(salary);
	 e.setCommition(com);
	 
    

     EmployeeDAO edao = new EmployeeDAOImp();
     boolean res = edao.HikeUser(e);

     
     if (res) {
         req.setAttribute("UpdateMessage", "updated successfully!");
     } else {
         req.setAttribute("FailedMessage", "Failed to update. Please try again.");
     }

     
     RequestDispatcher rd = req.getRequestDispatcher("ModifyEmp.jsp");
     rd.forward(req, resp);
}
}
