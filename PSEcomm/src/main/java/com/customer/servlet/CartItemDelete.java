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


@WebServlet(urlPatterns = "/customer/cart/remove")
public class CartItemDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CartItemDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cartId = request.getParameter("cartId")!=null ? Integer.parseInt(request.getParameter("cartId"))   :-1;
		if(cartId!=-1)
		{
			CartDAO cartDAO = new CartDAOImpl();
			Cart cart = new Cart();
			cart.setCartId(cartId);
			if(cartDAO.deleteCart(cart))
			{
				response.sendRedirect(request.getContextPath()+"/Customer/Cart.jsp");
			}
			
			
		}
	}


}
