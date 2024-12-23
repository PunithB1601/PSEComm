package com.customer.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import com.customer.dao.OrderDao;
import com.customer.dao.OrderDaoImp;
import com.customer.dto.Customer;
import com.customer.dto.Order;
import com.emp.DAO.ProductDAO;
import com.emp.DAO.ProductDAOImp;
import com.emp.DTO.Product;


@WebServlet(urlPatterns = "/customer/product/buy")
public class OrderProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public OrderProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer customer = (Customer ) request.getSession().getAttribute("user");
		if(customer==null)
		{
			request.getRequestDispatcher("/Customer/Login.jsp").forward(request, response);
			return;
		}
		
		
		int productId = request.getParameter("productId")!=null ?  Integer.parseInt(request.getParameter("productId")) : -1;
		int quantity = request.getParameter(productId+"")!=null ? Integer.parseInt(request.getParameter(productId+"")) : 1;
		
		if(productId !=-1 && quantity>=1)
		{
			ProductDAO productDAO = new ProductDAOImp();
			Product product = productDAO.getProduct(productId);
			double totalPrice = quantity * product.getPrice();
			
			System.out.println("Hai");
			Order order = new Order();
			   order.setCid(customer.getCid());
			   order.setOrderDate(new Timestamp(System.currentTimeMillis()));
			   order.setProductId(product.getProduct_Id());
			   
		       LocalDateTime deliveryDate2 = LocalDateTime.now().plusDays(6);
			   order.setDeliveryDate(Timestamp.valueOf(deliveryDate2));
			   order.setQunatity(quantity);
			   order.setTotalPrice(totalPrice);
			   
			   OrderDao orderDao= new OrderDaoImp();
			   order = orderDao.insertOrder(order);
			   response.sendRedirect(request.getContextPath()+"/Customer/Order.jsp");
			
		}
		
	}

}
