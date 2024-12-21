<%@page import="com.productCategory.DAO.productCategoryDDAOImpl"%>
<%@page import="com.productCategory.DAO.productCategoryDAO"%>
<%@page import="com.productCategory.DTO.ProductCategory"%>
<%@page import="com.emp.DTO.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.emp.DAO.ProductDAOImp"%>
<%@page import="com.emp.DAO.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setAttribute("menu", "Shop"); %>
<%
 
int selectedCategory = request.getParameter("category")!=null ? Integer.parseInt(request.getParameter("category"))  : -1;
int currentPage = request.getParameter("page")!=null ? Integer.parseInt(request.getParameter("page"))  : 1;
int limit = request.getParameter("limit")!=null ? Integer.parseInt(request.getParameter("limit"))  : 10;
ProductDAO productDAO = new ProductDAOImp();
productCategoryDAO productCategoryDAO = new productCategoryDDAOImpl();

List<Product> products = productDAO.getAllProducts(selectedCategory, currentPage, limit);
List<ProductCategory> productCategories = productCategoryDAO.getProductCategory();
int totalData = productDAO.getAllProductsCount(selectedCategory);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/Customer/utils/CommonUtils.jsp" %>

<style type="text/css">

 .product-wrapper{
    margin-top: 10px;
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
	gap: 10px;
	padding: 20px 5px;
	max-width: 1800px;
	margin: 0 auto;
 }
 .product-card {
  padding: 15px;
  background: #efefef6e;
  border-radius: 10px;
  cursor: pointer;
 }
 
 .product-card img{
   width: 100%;
   height: 250px;
   border-radius: 10px;
 }
 
 .category-section
 {
  display: flex;
  justify-content: flex-start;
  align-items: center;
  padding: 5px 10px;
  gap:15px;
  width: 100%;
  overflow-x: auto;
  max-width: 1800px;
	margin: 0 auto;
 }
 
 .category-section::placeholder
 {
    width: 2px;
  }
 
 .category-tag{
  padding: 4px 8px;
  border-radius: 30px;
  border:1px solid #efefef !important;
  background: white;
  font-size: 0.8rem;
  cursor: pointer;
  color: black;
  white-space: nowrap;
 }
 
 .category-tag-acive{
  background: black;
  color: white;
 }
 
 .not-found{
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
 }
 
 .product-card .product-title{
  font-size: 1.2rem;
  font-weight: 400;
 }
 
 .product-price{
  display: flex;
  justify-content: flex-start;
  align-items: center;
  gap:2px;
  
 }
 .product-category{
  font-size: 0.9rem;
  font-weight: 400;
 }
 
 .buy-btn , .cart-btn{
  font-size: 0.9rem;
  padding: 3px 8px;
  border-radius: 10px;
  border: none;
 }
  .buy-btn{
   background: black;
   color: white;
  }
  .card-footer{
   width: 100%;
   display: flex;
   justify-content: flex-end;
   gap:5px;
   align-items: center;
  }


</style>

<link rel="stylesheet" href="<%=request.getContextPath() + "/Customer/Pagination.css"%>"></link>

</head>
<body>
<%@include file="/Customer/Navbar.jsp" %>
  
  <article class="category-section">
     
      <a class="category-tag <%=selectedCategory == -1 ? "category-tag-acive" :"" %>" href="<%= request.getContextPath()+"/Customer/Shop.jsp?category=-1&page=1&limit=10"%>">All</a>
      <%
         
         for(ProductCategory pc : productCategories)
         {
        	 %>
        	  <a class="category-tag <%=selectedCategory == pc.getCategoryId() ? "category-tag-acive" :"" %>" href="<%= request.getContextPath()+"/Customer/Shop.jsp?category="+pc.getCategoryId()+"&page=1&limit=10"%>"><%=pc.getName()%></a>
        	 <% 
         }
      
      %>
      
      
  
  
  </article>
  
  
  
  <%
    if(totalData ==0)
    {
     %>
        <div class="not-found">
        
          <p>No product Found</p>
        </div>
     <%    
    }
    else{
    	%>
    	  <section class="product-wrapper">
    	      
    	      <%
    	      for(Product p:products)
    	    	 {
    	    		 
    	    		 ProductCategory pc = productCategoryDAO.getById(p.getCategory_Id());
    	    		 %>
    	      	       
    	      	       <article class="product-card">
    	      	          
    	      	          <img alt="" src="<%= p.getImg()%>">
    	      	          <h3 class="product-title"><%=p.getProducr_Name() %></h3>
    	      	          <h3 class="product-price"> <i class="fa-solid fa-indian-rupee-sign"></i> <%=p.getPrice() %></h3>
    	      	          <h4 class="product-category">Category : <%=pc.getName() %></h4>
    	      	           
    	      	           <div class="mt-1 card-footer">
    	      	            <button class="buy-btn">Buy</button>
    	      	            <button class="cart-btn">Add to cart</button>
    	      	           </div>
    	      	           
    	      	       </article>
    	        	 
    	        	 <% 
    	    	 }
    	      
    	      %>
    	      
    	      </section>
    	
    	<%
    }
   
  
  %>
  
  
  
  
    
  
   
     <%
		int noOfPages = (int) Math.ceil((double) totalData / limit);
		int startPage = Math.max(1, currentPage - 2);
		int endPage = Math.min(noOfPages, currentPage + 2);
	%>
  <div class="pagination center my-4">

			<%
			if (currentPage > 1) {
			%>
			<a class="pagination-btn center" href="<%= request.getContextPath()+"/Customer/Shop.jsp?category="+selectedCategory+"&page="+(currentPage -1)+ "&limit="+limit%>">Prev</a>
			
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
			<a class="pagination-btn center" href="<%= request.getContextPath()+"/Customer/Shop.jsp?category="+selectedCategory+"&page="+(currentPage + 1)+ "&limit="+limit%>">Next</a>
			<%
			}
			%>
		</div>
     

</body>
</html>