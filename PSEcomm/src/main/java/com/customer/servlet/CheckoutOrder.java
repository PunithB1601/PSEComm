package com.customer.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.List;

import com.customer.dao.CartDAO;
import com.customer.dao.CartDAOImpl;
import com.customer.dao.OrderDao;
import com.customer.dao.OrderDaoImp;
import com.customer.dto.Cart;
import com.customer.dto.Customer;
import com.customer.dto.Order;
import com.emp.DAO.ProductDAO;
import com.emp.DAO.ProductDAOImp;
import com.emp.DTO.Product;
import com.productCategory.DTO.ProductCategory;


@WebServlet(urlPatterns = "/customer/cart/order")
public class CheckoutOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public CheckoutOrder() {
        super();
        
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Customer customer = (Customer ) request.getSession().getAttribute("user");
		if(customer==null)
		{
			request.getRequestDispatcher("/Customer/Login.jsp").forward(request, response);
			return;
		}
		
	
		CartDAO cartDAO = new CartDAOImpl();
		List<Cart> cartsItems = cartDAO.getAllCartItems(customer.getCid());
		
		ProductDAO productDAO = new ProductDAOImp();
		for(Cart c :cartsItems)
		{
			Product p = productDAO.getProduct(c.getProductId());
		   int quantity = request.getParameter(c.getProductId()+"") !=null ? Integer.parseInt(request.getParameter(c.getProductId()+"")):1;
		   double totalPrice = quantity  * p.getPrice();
		   
		   Order order = new Order();
		   order.setCid(customer.getCid());
		   order.setOrderDate(new Timestamp(System.currentTimeMillis()));
		   order.setProductId(p.getProduct_Id());
		   
	       LocalDateTime deliveryDate2 = LocalDateTime.now().plusDays(6);
		   order.setDeliveryDate(Timestamp.valueOf(deliveryDate2));
		   order.setQunatity(quantity);
		   order.setTotalPrice(totalPrice);
		   
		   OrderDao orderDao= new OrderDaoImp();
		   order = orderDao.insertOrder(order);
		   cartDAO.deleteCart(c);
		}
		
		response.sendRedirect(request.getContextPath()+"/Customer/Order.jsp");
			
	}

}
