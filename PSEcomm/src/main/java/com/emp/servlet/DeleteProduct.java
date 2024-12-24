package com.emp.servlet;

import java.io.IOException;

import com.emp.DAO.EmployeeDAO;
import com.emp.DAO.EmployeeDAOImp;
import com.emp.DAO.ProductDAO;
import com.emp.DAO.ProductDAOImp;
import com.emp.DTO.Employee;
import com.emp.DTO.Product;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteProduct")
public class DeleteProduct extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		String prodid=req.getParameter("pid");
		
		if (session == null || session.getAttribute("employee") == null) {
            req.setAttribute("failure", "Unauthorized access. Please log in.");
            RequestDispatcher rd=req.getRequestDispatcher("ViewProduct.jsp");
            rd.forward(req, resp);
            return;
        }
		
		if (prodid == null || prodid.isEmpty()) {
            req.setAttribute("failure", "Product ID number is missing.");
            RequestDispatcher rd=req.getRequestDispatcher("ViewProduct.jsp");
            rd.forward(req, resp);
            return;
        }
		
		try {
			Product p=(Product)session.getAttribute("product");
			ProductDAO pdao=new ProductDAOImp();
			int pid=Integer.parseInt(prodid);
			
			Product pr=pdao.getProduct(pid);
			if(pr==null)
			{
				req.setAttribute("failure", "Product not found.");
                RequestDispatcher rd=req.getRequestDispatcher("ViewProduct.jsp");
                rd.forward(req, resp);
                return;
			}
			if(pr.getProduct_Id()==pid)
			{
				boolean delete=pdao.deleteProduct(pr);
				if(delete) {
					req.setAttribute("success", "Product Deleted Successfully...");
					RequestDispatcher rd=req.getRequestDispatcher("ViewProduct.jsp");
	                rd.forward(req, resp);
				}
				else {
					req.setAttribute("failure", "Failed to  Delete the product ...");
					RequestDispatcher rd=req.getRequestDispatcher("ViewProduct.jsp");
	                rd.forward(req, resp);
				}
			}
		}
		catch(NumberFormatException e) {
			req.setAttribute("failure", "Invalid Product ID format.");
		}
	}
}

