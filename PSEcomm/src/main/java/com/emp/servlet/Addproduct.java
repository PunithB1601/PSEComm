package com.emp.servlet;

import java.io.File;
import java.io.IOException;

import com.emp.DTO.Location;
import com.emp.DTO.Product;
import com.app.utils.CloudinaryUploader;
import com.emp.DAO.*;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet(urlPatterns = "/product/add")
@MultipartConfig


public class Addproduct extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   
		String productName =  (String ) req.getParameter("productName") ;
		double productPrie = req.getParameter("productPrice") !=null ? Double.parseDouble(req.getParameter("productPrice"))  :-1;
	    int categoryId = req.getParameter("productCategory") !=null ? Integer.parseInt(req.getParameter("productCategory"))  :-1;
	    Part imgPart  = req.getPart("productImg");
		
	    String filename = imgPart.getSubmittedFileName();
		String uploadPath = getServletContext().getRealPath("/imgs");

		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			boolean dirsCreated = uploadDir.mkdirs();
			System.out.println("Directory created: " + dirsCreated); // Debugging: Check if directory was created
		}

		String filePath = uploadPath + File.separator + filename;

		imgPart.write(filePath);

		File file = new File(filePath);
		String imgUrl = CloudinaryUploader.upload(filePath);
		Product product = new Product();
		product.setProducr_Name(productName);
		product.setPrice(productPrie);
		product.setCategory_Id(categoryId);
		product.setImg(imgUrl);
		
		ProductDAO productDAO = new ProductDAOImp();
		product = productDAO.addProduct(product);
		RequestDispatcher requestDispatcher= req.getRequestDispatcher("/AddProduct.jsp");
		if(product!=null)
		{
			req.setAttribute("success", "Product Added Successfully");
		}else {
			req.setAttribute("failure", "Failed to add product");
		}
		requestDispatcher.forward(req, resp);
	   
	}



}
