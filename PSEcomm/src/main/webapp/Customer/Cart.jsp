<%@page import="com.customer.dto.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.customer.dao.CartDAOImpl"%>
<%@page import="com.customer.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setAttribute("menu", "Cart");
%>
<%@include file="/Customer/CustomerSession.jsp"%>
<%
if (customer == null) {
	request.setAttribute("failure", "Please Login");
	RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Customer/Login.jsp");
	requestDispatcher.forward(request, response);
	return;
}

CartDAO cartDAO = new CartDAOImpl();

List<Cart> cartItems = cartDAO.getAllCartItems(customer.getCid());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Your Cart</title>
<%@include file="/Customer/utils/CommonUtils.jsp"%>


<style type="text/css">
body {
	margin: 0 auto;
	width: 100%;
	max-width: 1800px;
}

.cart-section {
	padding: 20px;
}

.empty-cart {
	width: 100%;
	height: 80vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

@media ( max-width :500px) {
	.cart-section {
		padding: 5px;
	}
}
</style>

</head>
<body>
	<%@include file="/Customer/Navbar.jsp"%>

	<%
	if (cartItems.size() <= 0) {
	%>

	<div class="empty-cart">

		<p>Your cart is Empty</p>

	</div>


	<%
	} else {
	%>

	<section class="cart-section">
	
	 
	
	
	
	
	</section>
	<%
	}
	%>



</body>
</html>