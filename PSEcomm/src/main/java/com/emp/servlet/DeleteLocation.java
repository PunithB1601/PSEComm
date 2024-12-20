package com.emp.servlet;

import java.io.IOException;

import com.emp.DAO.locationDAO;
import com.emp.DAO.locationDAOimp;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteLocation")
public class DeleteLocation extends HttpServlet{
	 @Override
	 protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { 
		 
		 int lid = Integer.parseInt(req.getParameter("lid"));
		 
		 locationDAO ldao = new locationDAOimp();
	     boolean res = ldao.deletelocation(lid);
	     
	     if(res) {
	    	 req.setAttribute("Delsuccess", "Location Deleted Successfully!");
	    	 RequestDispatcher rd = req.getRequestDispatcher("viewLocations.jsp");
	    	 rd.forward(req, resp);
	     }
	     else {
	    	 req.setAttribute("Delfailure", "Failed to Delete the Location!");
	    	 RequestDispatcher rd = req.getRequestDispatcher("viewLocations.jsp");
	    	 rd.forward(req, resp);
	     }
	        

}
}
