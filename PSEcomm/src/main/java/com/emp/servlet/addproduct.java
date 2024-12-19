package com.emp.servlet;

import java.io.IOException;

import com.emp.DTO.Location;
import com.emp.DAO.*;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/addproduct")
public class addproduct extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    // Debugging - Check parameter retrieval
	    System.out.println("Location: " + req.getParameter("Location"));
	    System.out.println("City: " + req.getParameter("City"));
	    System.out.println("State: " + req.getParameter("State"));
	    
	    Location l = new Location();
	   locationDAO ldao=new  locationDAOimp();
	    
	    // Retrieve parameters
	    String Location = req.getParameter("Location");
	    String City = req.getParameter("City");
	    String State = req.getParameter("State");

	    if (Location == null || City == null || State == null) {
	        System.out.println("Parameters not received properly!");
	    }
	    
	    // Set values into the Location object
	    l.setLocation(Location);
	    l.setCity(City);
	    l.setState(State);

	    // Insert location data
	    boolean result = ldao.insertlocation(l);
	    if (result) {
	        req.setAttribute("success", "Update Successful");
	    } else {
	        req.setAttribute("failure", "Update Failed");
	    }
	    // Forward to the JSP page
	    RequestDispatcher rd = req.getRequestDispatcher("location.jsp");
	    rd.forward(req, resp);
	}



}
