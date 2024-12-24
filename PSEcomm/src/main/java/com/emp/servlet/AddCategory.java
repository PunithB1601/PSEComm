package com.emp.servlet;

import java.awt.Point;
import java.io.File;
import java.io.IOException;

import com.emp.DTO.Location;
import com.emp.DTO.Product;
import com.productCategory.DAO.productCategoryDAO;
import com.productCategory.DAO.productCategoryDDAOImpl;
import com.productCategory.DTO.ProductCategory;
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

@WebServlet(urlPatterns = "/category/add")
@MultipartConfig


public class AddCategory extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   
		String productName =  (String ) req.getParameter("categoryName") ;
	    Part imgPart  = req.getPart("productImg");
	    
		
	    String filename = imgPart.getSubmittedFileName();
		String uploadPath = getServletContext().getRealPath("/imgs");

		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			boolean dirsCreated = uploadDir.mkdirs();

		}

		String filePath = uploadPath + File.separator + filename;

		imgPart.write(filePath);

		File file = new File(filePath);
		String imgUrl = CloudinaryUploader.upload(filePath);
		Product product = new Product();
		product.setProducr_Name(productName);
		product.setImg(imgUrl);
		ProductCategory pc=new ProductCategory();
		pc.setName(productName);
		pc.setImg(imgUrl);
		productCategoryDAO pdao=new productCategoryDDAOImpl();
		pc=pdao.AddCategory(pc);
		RequestDispatcher requestDispatcher= req.getRequestDispatcher("AddCategory.jsp");
		if(pc!=null)
		{
			req.setAttribute("success", "Product Added Successfully");
		}
		else {
			req.setAttribute("failure", "Failed to add product");
		}
		requestDispatcher.forward(req, resp);
	   
	}



}