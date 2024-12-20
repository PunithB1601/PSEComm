package com.emp.servlet;

import java.io.IOException;

import com.emp.DAO.locationDAO;
import com.emp.DAO.locationDAOimp;
import com.emp.DTO.Location;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateLocation")
public class UpdateLocation extends HttpServlet {
 @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	 int lid = Integer.parseInt(req.getParameter("lid"));
	    String location = req.getParameter("location");
	    String city = req.getParameter("city");
	    String state = req.getParameter("state");
	    
	    Location loc = new Location();
	    loc.setLid(lid);
	    loc.setLocation(location);
	    loc.setCity(city);
	    loc.setState(state);
	    
	    locationDAO ldao = new locationDAOimp();
	    boolean res = ldao.updatelocation(loc);
	    
	    if(res) {
	    	req.setAttribute("updateSuccess", "Update Successfull!");
	    	RequestDispatcher rd = req.getRequestDispatcher("updateLocation.jsp");
	    	rd.forward(req, resp);
	    }
	    else {
	    	req.setAttribute("updateFail", "Update Failed!");
	    	RequestDispatcher rd = req.getRequestDispatcher("updateLocation.jsp");
	    	rd.forward(req, resp);
	    }
}
}
