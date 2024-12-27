<%@page import="com.emp.DAO.ProductDAOImp"%>
<%@page import="com.emp.DAO.ProductDAO"%>
<%@page import="com.emp.DTO.Product"%>
<%@page import="com.customer.dto.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.customer.dao.OrderDaoImp"%>
<%@page import="com.customer.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setAttribute("menu", "Orders");
%>
<%@include file="/Customer/CustomerSession.jsp"%>
<%
if (customer == null) {
	request.setAttribute("failure", "Please Login");
	RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Customer/Login.jsp");
	requestDispatcher.forward(request, response);
	return;
}

OrderDao orderDao = new OrderDaoImp();

int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
int limit = request.getParameter("limit") != null ? Integer.parseInt(request.getParameter("limit")) : 5;

List<Order> orders = orderDao.getAllOrders(currentPage, limit, customer.getCid());
int totalData = orderDao.getAllOrdersCount(customer.getCid());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Orders</title>
<%@include file="/Customer/utils/CommonUtils.jsp"%>

<style type="text/css">
body {
	width: 100%;
	max-width: 1800px;
	margin: 0 auto;
}

.empty-order {
	width: 100%;
	height: 80vh;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.empty-order img {
	width: 400px;
	height: 400px;
}

.empty-order  p {
	font-size: 0.9rem;
}

.orders-wrapper{
 padding: 20px;
}

.order-items-wrapper{
 padding: 10px 50px;
}

.order-card{
 padding: 10px;
 display: flex;
 justify-content: space-between;
 border-radius: 10px;
 align-items: center;
 margin: 10px 0px;
 background: #efefef54;
 border: 1px solid #ededed !important;
}

.order-item-img img{
 width: 100px;
 height: 100px;
 border-radius: 10px;
}
.order-details h2{
  font-size: 1.5rem;
}

.order-details h6{
 font-size: 0.8rem;
}

@media ( max-width :500px) {
	.empty-order img {
		width: 280px;
		height: 300px;
	}
}
</style>
<link rel="stylesheet" href="<%=request.getContextPath() + "/Customer/Pagination.css"%>"></link>
</head>
<body>
	<%@include file="/Customer/Navbar.jsp"%>

	<%
	if (orders.size() <= 0) {
	%>

	<section class="empty-order">

		<img alt="empty"
			src="https://img.freepik.com/premium-vector/vector-animal-illustration-pet-dog-cute-cartoon-set-isolated-icon-design-puppy-happy-ca_1013341-12161.jpg">
		<p>
			No Products Found . <a
				href="<%=request.getContextPath() + "/Customer/Shop.jsp"%>">Shop
				Now</a>
		</p>
	</section>


	<%
	} else {
	%>
	 
	 <section class="orders-wrapper">
	 
	 <h3>Your Orders <span><%=totalData %></span> </h3>
	 
	 
	 <article class="order-items-wrapper">
	 
       
       <%
       ProductDAO productDAO = new ProductDAOImp();
       
       for(Order o :orders)
       {
    	   Product product = productDAO.getProduct(o.getProductId());
    	 %>
    	   
    	   <div class="order-card">
    	      
    	      <div class="order-details">
    	       
    	        <h2> <%=product.getProducr_Name() %></h2>
    	        <h6> <span>Order Id :</span> <%=o.getOrderId() %> </h6>
    	        <h6> <span>Quantity :</span> <%=o.getQunatity() %> </h6>
    	        <h6> <span>Total Amount :</span> <i class="fa-solid fa-indian-rupee-sign"></i> <%=o.getTotalPrice() %></h6>
    	        <h6> <span>Ordered On :</span> <%=o.getOrderDate().toLocaleString() %></h6>
    	        <h6> <span>Delivered By :</span> <%=o.getDeliveryDate().toLocaleString() %></h6>
    	        <h6> <span>Order Stauts :</span> <%=o.getStauts() %></h6>
    	      
    	      </div>
    	       
    	       <div class="order-item-img">
    	         <img alt="" src="<%= product.getImg()%>">
    	        
    	       </div>
    	      
    	   
    	   </div>
    	   
    	 <%
       }
       
       
       %>
       	 
	 
	 
	 </article>
	
	 <%
		int noOfPages = (int) Math.ceil((double) totalData / limit);
		int startPage = Math.max(1, currentPage - 2);
		int endPage = Math.min(noOfPages, currentPage + 2);
	%>
	 <div class="pagination center my-4">

			<%
			if (currentPage > 1) {
			%>
			<a class="pagination-btn center" href="<%= request.getContextPath()+"/Customer/Order.jsp?page="+(currentPage -1)+ "&limit="+limit%>">Prev</a>
			
			<%
			}
			%>
			<%
			for (int i = startPage; i < endPage; i++) {
			%>
			<a class="pagination-btn center <%=currentPage == i ? " active " : ""%>" ><%=i%></a>
			<%
			}
			%>
			<%
			if (currentPage < noOfPages) {
			%>
			<a class="pagination-btn center" href="<%= request.getContextPath()+"/Customer/Order.jsp?page="+(currentPage + 1)+ "&limit="+limit%>">Next</a>
			<%
			}
			%>
		</div>
	 
	 
	 
	 </section>
	
	
	<%
	}
	%>
<section>
	    <%@include file="/Customer/Footer.jsp"%>
	 </section>
</body>
</html>