<%@page import="java.util.Collections"%>
<%@page import="com.emp.DTO.Employee"%>
<%@page import="com.productCategory.DAO.productCategoryDAO"%>
<%@page import="com.productCategory.DAO.productCategoryDDAOImpl"%>
<%@page import="com.productCategory.DTO.ProductCategory"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.emp.DTO.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.emp.DAO.ProductDAOImp"%>
<%@page import="com.emp.DAO.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Products</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>
    *{
        margin: 0;
        padding: 0;
    }
    body{
    	background-color: #f4f6f9;
    }
    .product{
    	background-color: #34495e;
    	color: white;
    	padding: 25px;
    	text-align: center;
    }
    .btnn{
    	position:absolute;
    	right:30px;
    }
    
    .view-product{
        margin:80px;
    }
    
    .product-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 30px;
            padding: 10px;
            cursor:pointer;
        }

        .product-card {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            text-align: center;
            padding: 20px;
            width: 280px;
            height:auto;
            box-shadow: 0 8px 10px 0 rgba(0, 0, 0, 0.2), 0 12px 25px 0 rgba(0, 0, 0, 0.19);
        }
        .product-card:hover{
        	box-shadow: 0 -8px 4px 0 rgba(10, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 10, 0, 0.19);
        }

        .product-card h2 {
            font-size: 1.5em;
            margin: 10px 0;
            color: #8692FC;
        }

        .product-card p {
            font-size: 1em;
            color: #555;
        }
        
    </style>
</head>
<body>
<header class="product">
	<h3>All Product Details</h3>
</header>
	<div class="btnn ms-3 mt-3">
	
            <% Employee hr = (Employee) session.getAttribute("employee"); %>
            <% Employee e = (Employee) session.getAttribute("employee"); %>
             <% Employee sales = (Employee) session.getAttribute("employee"); %>
             <% Employee manager = (Employee) session.getAttribute("employee"); %>
            <% if (e.getJob().equalsIgnoreCase("ceo")) { %>
                <a href="EmployeeAdminDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
            <% } else if (hr.getJob().equalsIgnoreCase("hr")) { %>
                <a href="HrDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
            <% } else if(sales.getJob().equalsIgnoreCase("salesman")) {%>
            <a href="SalesmanDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
            <%}  else if(manager.getJob().equalsIgnoreCase("manager")) {%>
            <a href="ManagerDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
            <%} %>
            
        </div>	

    <div class="view-product">
        
     <% ProductDAO productDAO = new ProductDAOImp();
           List<Product> products = productDAO.getproducts();
           productCategoryDAO pdao= new productCategoryDDAOImpl(); 
           Collections.reverse(products);%>
        
        <div class="product-container">
       <% for (Product p : products) { 
    	   List<ProductCategory> pc = pdao.getProductCategoryById(p.getCategory_Id());%>
    	   <div class="product-card">
                <div class="profile-pic"><image src="<%=p.getImg()%>" width="120px" height="140px" style="border-radius:5px;" ></div>
                <h2><%= p.getProduct_Id() %></h2>
                <p class="card-text"><strong>Product Name:</strong> <%= p.getProducr_Name() %></p>
                <p class="card-text"><strong>Price:</strong> <%= p.getPrice()%></p>
                <p class="card-text"><strong>Product_category:</strong>
                <% if (pc != null && !pc.isEmpty()) {
				for (ProductCategory procat : pc) { %>
				<%= procat.getName() %>
				<% }
					} else { %>
						N/A
					<% } %>
                
                </p>
            </div>
            
    	<%} %>
    	</div>
    
    </div>
</body>
</html>
