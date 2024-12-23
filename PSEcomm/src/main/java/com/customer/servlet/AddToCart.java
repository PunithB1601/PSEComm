package com.customer.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.customer.dao.CartDAO;
import com.customer.dao.CartDAOImpl;
import com.customer.dto.Cart;
import com.customer.dto.Customer;


@WebServlet(urlPatterns = "/user/cart/add")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AddToCart() {
        super();
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Customer user = (Customer)request.getSession().getAttribute("user");
		if(user ==null)
		{
			response.sendRedirect(request.getContextPath()+"/Customer/Login.jsp");
			return;
		}
		int productId = request.getParameter("productId")!=null ? Integer.parseInt(request.getParameter("productId")): -1;
		if(productId !=-1)
		{ 
			Cart newCart = new Cart();
			newCart.setCid(user.getCid());
			newCart.setProductId(productId);
			CartDAO cartDAO =  new CartDAOImpl();
			newCart = cartDAO.insertCart(newCart);
			if(newCart !=null)
			{
				response.sendRedirect(request.getContextPath()+"/Customer/Cart.jsp");
			}else {
				response.sendRedirect(request.getContextPath()+"/Customer/ProductItem.jsp?productId="+productId);
			}
			
		}
	}

}
