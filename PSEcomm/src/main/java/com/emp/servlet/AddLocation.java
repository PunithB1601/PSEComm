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


@WebServlet("/AddLocation")
public class AddLocation extends HttpServlet{
 @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	 String location = req.getParameter("location");
	 String city = req.getParameter("city");
	 String state  = req.getParameter("state");
	 
	 Location l = new Location();
	 l.setLocation(location);
	 l.setCity(city);
	 l.setState(state);
	 
	 locationDAO ldao = new locationDAOimp();
	 
	 boolean res = ldao.insertlocation(l);
	 
	 if(res) {
		 req.setAttribute("success", "Location Added Successfully!");
		 RequestDispatcher rd = req.getRequestDispatcher("AddLocation.jsp");
		 rd.forward(req, resp);
	 }
	 else {
		 req.setAttribute("failure", "Unable to Add Location! Try Again Later");
		 RequestDispatcher rd = req.getRequestDispatcher("AddLocation.jsp");
		 rd.forward(req, resp);
	 }
	 
	 
 }
}
