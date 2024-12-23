package com.customer.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.customer.dao.RequestedLocationDAO;
import com.customer.dao.RequestedLocationDAOImp;
import com.customer.dto.RequestedLocation;


@WebServlet(urlPatterns = "/customer/requestLocation")
public class RequestLocation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public RequestLocation() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String location = request.getParameter("newLocation");
		
		RequestedLocation requestedLocation = new RequestedLocation();
		requestedLocation.setRequested_location(location);
	    RequestedLocationDAO requestedLocationDAO = new RequestedLocationDAOImp();
	    
	    requestedLocation =  requestedLocationDAO.insertRequested_location(requestedLocation);
	    RequestDispatcher requestDispatcher =null;
	    if(requestedLocation !=null)
	    {
	    	requestDispatcher = request.getRequestDispatcher("/Customer/Signup.jsp");
	    }else {
	    	request.setAttribute("failure","Something Went Wrong");
	    	requestDispatcher = request.getRequestDispatcher("/Customer/RequestLocation.jsp");
	    }
	    
	    requestDispatcher.forward(request, response);
	    
	    
	}

}
