<%@page import="com.productCategory.DAO.productCategoryDDAOImpl"%>
<%@page import="com.productCategory.DAO.productCategoryDAO"%>
<%@page import="com.productCategory.DTO.ProductCategory"%>
<%@page import="com.customer.dao.CartDAOImpl"%>
<%@page import="com.emp.DAO.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.emp.DAO.ProductDAOImp"%>
<%@page import="com.emp.DTO.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setAttribute("menu", "Shop");
int productId = request.getParameter("productId") != null ? Integer.parseInt(request.getParameter("productId")) : -1;
ProductDAO productDAO = new ProductDAOImp();
Product product = productDAO.getProduct(productId);
productCategoryDAO pcDAO=new productCategoryDDAOImpl();
ProductCategory productCategory=pcDAO.getById(product.getCategory_Id());
%>
<%@include file="/Customer/CustomerSession.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product</title>
<%@include file="/Customer/utils/CommonUtils.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
	integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
.container {
	width: 80%;
	margin: 0 auto;
	overflow-y: hidden;
	font-family: sans-serif;
	background-color: #efefef5b;
	display: flex;
	justify-content: space-between;
	border-radius: 10px;
	padding: 50px;
}

.img {
	width: 100%;
}

img {
	width: 95%;
	height: 80vh;
	background-size: cover;
	border-radius: 15px;
	box-shadow: 2px 2px 10px gray;
}

.product {
	width: 100%;
	display: flex;
	flex-direction: column;
	margin-top: -10px;
	margin-left: 5px;
}

.btns {
	display: flex;
	font-weight: 500;
}

#desc {
	font-size: 0.95rem;
}

.btn1 {
	background-color: rgba(25, 24, 24, 0.921);
	color: rgb(246, 242, 242) !important;
	border: none;
	padding: 5px;
	width: 8rem;
	margin-right: 10px;
	border-radius: 10px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.btn2 ,.saved-btn {
	background-color: white;
	color: black !important;
	border: 1px solid black;
	padding: 10px;
	width: 9rem;
	border-radius: 10px;
	display: flex;
	justify-content: center;
	align-items: center;
	gap:3px;
}

.not-found {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	height: 70vh;
}

.not-found img {
	width: 300px;
	height: 300px;
	box-shadow: none !important;
}

.similar-title {
	font-size: 1.3rem;
	width: 100%;
	max-width: 1800px;
	margin: 0 auto;
}

.similar-products {
	width: 100%;
	max-width: 1800px;
	margin: 0 auto; margin-top : 10px;
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
	gap: 10px;
	padding: 10px;
	margin-top: 10px;
}

.product-card {
	width: 300px;
	background: #efefef;
	padding: 10px;
	border-radius: 10px;
	cursor: pointer;
	color: black !important;
}

.product-card img {
	height: 250px;
	width: 90%;
	margin-left: 5%;
}

@media ( min-width : 480px) and (max-width: 600px) {
	.container {
		display: flex;
		flex-direction: column;
		gap: 20px;
		padding: 5px;
	}
	img {
		height: 50vh;
	}
}

@media ( min-width : 600px) and (max-width: 1024px) {
	.container {
		flex-direction: column;
		gap: 20px;
		padding: 5px;
	}
	.img {
		display: flex;
		justify-content: center;
		align-items: center;
	}
	img {
		height: 50vh;
		width: 80%;
	}
}

@media ( max-width : 480px) {
	.container {
		display: flex;
		flex-direction: column;
		gap: 10px;
		padding: 5px;
	}
	img {
		height: 50vh;
		width: 100%;
	}
	.product {
		margin: 0%;
	}
}
</style>
</head>
<body>
	<%@include file="/Customer/Navbar.jsp"%>

	<%
	if (product == null) {
	%>
	<div class="not-found">
		<img alt=""
			src="https://c8.alamy.com/comp/2XKAM8D/adorable-cartoon-puppy-smiling-and-sitting-happily-cute-fluffy-dog-with-friendly-expression-wagging-tail-and-tongue-out-for-kid-coloring-book-t-2XKAM8D.jpg">
		<p>Product Not Found</p>
	</div>

	<%
	return;
	} else {
	List<Product> similarproduts = productDAO.getSimilarProducts(product);  
	%>

	<div class="container">
		<div class="img">
			<img src="<%=product.getImg()%>" alt="Product imgage">
		</div>
		<div class="product">
			<div class="product-head">
				<h2 id="name"><%=product.getProducr_Name()%></h2>
				<h3 id="price">
					<i class="fa-solid fa-indian-rupee-sign"></i>
					<%=product.getPrice()%></h3>
					<%if(product.getCategory_Id()==productCategory.getCategoryId()){ %>
					<h4><%= productCategory.getName()%></h4>
				<%} %>
				<p id="desc"><%=product.getDescription()%></p>
			</div>
			<div class="btns">
				<a class="btn1" href="<%= request.getContextPath()+"/Customer/BuyProduct.jsp?productId="+product.getProduct_Id()%>">
					<i class="fa-solid fa-bolt"></i> Buy Now
				</a>
				<%
				boolean isSaved = user != null ? new CartDAOImpl().checkCart(user.getCid(), product.getProduct_Id()) : false;
				if (isSaved) {
				%>
				<a class="saved-btn" ><i class="fa-solid fa-cart-shopping"></i>Saved</a>
				<%
				} else {
				%>
				<a class="btn2"
					href="<%=request.getContextPath() + "/user/cart/add?productId=" + product.getProduct_Id()%>"><i
					class="fa-solid fa-cart-shopping"></i> Add to cart</a>
				<%
				}
				%>

			</div>

		</div>
	</div>

	<%
	if (similarproduts.size() > 0) {
	%>
	<h1 class="mt-5 similar-title">Similar Products</h1>
	<article class="similar-products">
		<%
		for (Product simProduct : similarproduts) {
		%>


		<a class="product-card"
			href="<%=request.getContextPath() + "/Customer/ProductItem.jsp?productId=" + simProduct.getProduct_Id()%>">
			<img alt="" src="<%=simProduct.getImg()%>">
			<h5 class="mt-3"><%=simProduct.getProducr_Name()%></h5>
			<h5 class="product-price">
				<i class="fa-solid fa-indian-rupee-sign"></i>
				<%=simProduct.getPrice()%></h5>
		</a>


		<%
		}
		%>
	</article>
	<%
	}
	%>

	<%
	}
	%>



</body>

</html>