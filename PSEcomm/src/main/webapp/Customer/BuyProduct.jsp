<%@page import="com.productCategory.DTO.ProductCategory"%>
<%@page import="com.emp.DTO.Product"%>
<%@page import="com.productCategory.DAO.productCategoryDDAOImpl"%>
<%@page import="com.productCategory.DAO.productCategoryDAO"%>
<%@page import="com.emp.DAO.ProductDAOImp"%>
<%@page import="com.emp.DAO.ProductDAO"%>
<%@page import="com.customer.dao.CartDAOImpl"%>
<%@page import="com.customer.dto.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setAttribute("menu", "");
%>

<%@include file="/Customer/CustomerSession.jsp"%>
<%
if (customer == null) {
	response.sendRedirect(request.getContextPath() + "/Customer/Login.jsp");
	return;
}
int productId = request.getParameter("productId")!=null ? Integer.parseInt(request.getParameter("productId")) :-1; 
ProductDAO productDAO = new ProductDAOImp();
Product product = productDAO.getProduct(productId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/Customer/utils/CommonUtils.jsp"%>

<style type="text/css">

body{
 font-family: "outfit",sans-serif;
}

.checkout-section{
 max-width: 1700px;
 margin: 0 auto;
 min-height: 80vh;
 display: flex;
 justify-content: center;
 align-items: center;
}

.order_items{
width: 500px;
padding: 15px;
box-shadow: 1px 2px 4px gray !important;
border-radius: 10px;

}

.order_items h1{
 font-size: 1.2rem;
}

.order-card{
 display: flex;
 justify-content: space-between;
 align-items: center;
 padding: 5px;
 border-radius: 15px;
 border-bottom:1px solid #ededed; 
 margin: 5px 0px;
}

.order-img{
 width: 50px;
 height: 50px;
 border-radius: 10px;
}

.order-details h3{
 display: flex;
 justify-content: flex-start;
 align-items: center;
 font-size: 0.9rem;
}

.item-wrapper{
 display: flex;
 flex-direction: column;
 justify-content: center;
 align-items: center;
}

.result-footer{
 display: flex;
 flex-direction: column;
 justify-content: flex-end;
 align-items: flex-end;
 
}
.result-footer h6{
font-size: 0.8rem;
}
.btn-wrapper{
width: 100%;
display: flex;
justify-content: center;
align-items: center;
margin-top: 5px;
}

#pay-btn{
 width: 80%;
 margin: 0px auto !important;
 border-radius: 10px;
 border: none;
 padding: 3px 0px;
 background: black;
 color: white;
}

.quantity{
 width: 40px;
 text-align: center;
}
.fa-plus, .fa-minus{
cursor: pointer;
}

.fa-indian-rupee-sign{
 font-size: 0.8rem;
}

@media ( max-width :500px) {
  .order_items{
   width: 280px;
  }
}
</style>


</head>
<body>
<%@include file="/Customer/Navbar.jsp"%>


<section class="checkout-section">
 
  <div class="order_items">
    <h1>Order Items</h1>
     <form action="<%=request.getContextPath()+"/customer/product/buy" %>" method="post">
         <input type="hidden" name="address" value="<%= request.getParameter("address")%>">
         
         <div class="order-card">
	       <input type="hidden" name="productId" value="<%=productId%>">
	   
	       <div class="item-wrapper">
	          <img alt="<%=product.getProducr_Name()%>" src="<%= product.getImg()%>" class="order-img">
	          <h6 class="order-title"><%=product.getProducr_Name() %></h6>
	          <h6><i class="fa-solid fa-indian-rupee-sign"></i> <%=product.getPrice() %></h6>
	       </div>
	       <div class="order-details">
	        
	       <i class="fa-solid fa-plus" onclick="handleQuantityIncrease('<%=product.getProduct_Id()%>')"></i>
		        <input name="<%=product.getProduct_Id()%>" id="<%=product.getProduct_Id()%>" class="quantity" type="number" min=1 data-price="<%=product.getPrice()%>" value=1>
		   <i class="fa-solid fa-minus" onclick="handleQuantityDecrease('<%=product.getProduct_Id()%>')" ></i>
	         
	       
	       </div>
	    </div>
        
         
         <div class="btn-wrapper">
             <button id="pay-btn" type="submit">Pay <span id="totalAmount"></span> </button>
         </div>
     
     </form>       
  
  </div>


</section>
<section>
	    <%@include file="/Customer/Footer.jsp"%>
</section>

<script type="text/javascript" src="<%= request.getContextPath()+"/Customer/js/BuyProductJs.js"%>"></script>

</body>
</html>