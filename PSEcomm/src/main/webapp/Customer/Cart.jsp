<%@page import="com.emp.DAO.ProductDAOImp"%>
<%@page import="com.emp.DAO.ProductDAO"%>
<%@page import="com.emp.DTO.Product"%>
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
.cart-section{
  width: 100%;
  max-width: 1800px;
  margin: 0 auto;
  min-height: 80vh;
  display: flex;
  justify-content: flex-start;
  align-items: flex-start;
}

.cart-items{
 width: 70%;
}
.cart-info{
 background: orange;
 width: 30%;
}

.cart-card{
 width: 100%;
 display: flex;
 justify-content: space-between;
 padding: 5px 10px;
 align-items: center;
 background: #efefef54;
 border-radius: 10px;
 margin: 5px 0px;
 box-shadow: 0px 1px 2px #efefef !important;
 border: 1px solid #efefef;
 position: relative;
}

#cart-delete-btn{
 position: absolute;
 top: 5px;
 right: 5px;
 color: black !important;
}

.cart-card .card-info{
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: flex-start;
  gap:2px;
}
.card-info img{
 width: 100px;
 height: 100px;
 border-radius: 10px;
}
.card-info h5, .card-info h6{
 margin-bottom: 0px;
}
.quantity{
 width: 40px;
 text-align: center;
}
.fa-plus, .fa-minus{
cursor: pointer;
}

.cart-info{
 padding: 10px;
 background: #efefef54;
 border-radius: 20px;
 margin-top: 20px;
}

.cart-info h1{
 font-size: 1.5rem;
 text-align: center;
}

.cart-info h5{
 font-size: 0.9rem;
}

.cart-info footer{
 width: 100%;
 display: flex;
 justify-content: center;
 align-items: center; 
}

.checkout-btn{
 width: 80%;
 border-radius: 10px;
 background: black;
 color: white !important;
 border: none;
 padding: 5px 0px;
 text-align: center;
 cursor: pointer;
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

	<form class="cart-section" action="<%=request.getContextPath()+"/Customer/Checkout.jsp" %>" method="get">
	 
	  <article class="cart-items">
	  
	  <h4>Your Cart</h4>
	  
	  <article class="cart-items-wrapper mt-4">
	   
	   <%
	    ProductDAO productDAO = new ProductDAOImp();
	   for(Cart c:cartItems)
	   {
		   Product p = productDAO.getProduct(c.getProductId());
		   %>
		    
		    <div class="cart-card">
		      <a id="cart-delete-btn" href="<%= request.getContextPath()+"/customer/cart/remove?cartId="+c.getCartId()%>"><i class="fa-regular fa-trash-can"></i></a>
		      <div class="card-info">
		         <img alt="" src="<%=p.getImg() %>">
		         <h5><%=p.getProducr_Name() %></h5>
		         <h6><i class="fa-solid fa-indian-rupee-sign"></i> <%=p.getPrice() %></h6>
		      </div>
		      
		      <div class="cart-quantity">
		      <i class="fa-solid fa-plus" onclick="handleQuantityIncrease('<%=p.getProduct_Id()%>')"></i>
		        <input name="<%=p.getProduct_Id()%>" id="<%=p.getProduct_Id()%>" class="quantity" type="number" min=1 data-price="<%=p.getPrice()%>" value=1>
		       <i class="fa-solid fa-minus" onclick="handleQuantityDecrease('<%=p.getProduct_Id()%>')" ></i>
		      
		      </div>
		    
		    </div>
		   
		   <%
	   }
	    
	   %>
	  
	  </article>
	  
	  </article>
	  
	  
	  <article class="cart-info m-2">
	     <h1 class="checkout-title">Checkout Details</h1>
	     
	     <h5> Qunatity : <span id="totalQuantity"></span> </h5>
	      <h5 >Total Amount = <span id="totalAmount"></span> </h5>
	      
	      <footer class="mt-5">
	        
	        <button class="checkout-btn" type="submit">Checkout</button>
	      
	      </footer>
	     
	  </article>
	
	
	</form>
	<%
	}
	%>

  
  <script type="text/javascript" src="<%= request.getContextPath()+"/Customer/js/CartJS.js"%>"></script>


</body>
</html>