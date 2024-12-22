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

.img-wrapper {
	width: 400px;
	height: 600px;
	position: relative;
}

.img-wrapper img {
	width: 100%;
	height: 100%;
}

.img-wrapper p {
	position: absolute;
	bottom: 35%;
	left: 50%;
	transform: translateX(-50%);
}

@media ( max-width :500px) {
	.cart-section {
		padding: 5px;
	}
	.img-wrapper {
		width: 280px;
		height: 600px;
		position: relative;
	}
	.img-wrapper p {
		position: absolute;
		bottom: 30%;
		left: 50%;
		transform: translateX(-50%);
		white-space: nowrap;
		font-size: 0.9rem;
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

		<div class="img-wrapper">
			<img alt=""
				src="https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDI0LTAyL3Jhd3BpeGVsX29mZmljZV8yM19jaHViYnlfY3V0ZV8zZF9taW5pbWFsX3JlbmRlcl9jaGFyYWN0ZXJfb2Zfc19lNGFhZGY1NS0yYTRmLTQ3YWUtODRiNi0yN2YzN2ZkMjdhNTlfMS5qcGc.jpg">
			<p>Your cart is Empty</p>
		</div>

	</div>


	<%
	} else {
	%>

	<section class="cart-section"></section>
	<%
	}
	%>



</body>
</html>