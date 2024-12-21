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
    	margin:20px;
    	margin-bottom:30px;
    	position:absolute;
    	right:10px;
    }
    .view-product{
        margin: 100px;
        margin-top:80px;
    }
    .view-product h3{
        margin-bottom: 30px;
    }
    
    .table th{
        font-weight:bold;
        color:white;
    }
    .table td{
        background-color: snow;
    }
    
    </style>
</head>
<body>
<header class="product">
	<h3>All Product Details</h3>
</header>
<a href="HrDashboard.jsp"><button type="submit" class="btnn btn btn-secondary">Back to Dashboard</button></a>
    <div class="view-product">
        
    <table class="table table-bordered border-info shadow p-3 mb-5 bg-body-tertiary rounded rounded">
        <thead >
            <tr>
                <th class="bg-primary">#<%int count=1; %></th>
                <th class="bg-primary">Product ID</th>
                <th class="bg-primary">Product Name</th>
                <th class="bg-primary">Price</th>
                <th class="bg-primary">Category</th>
            </tr>
        </thead>
        <% ProductDAO productDAO = new ProductDAOImp();
           List<Product> products = productDAO.getproducts();
           productCategoryDAO pdao= new productCategoryDDAOImpl(); %>
        <tbody>
        
       <% for (Product p : products) { 
    	   List<ProductCategory> pc = pdao.getProductCategoryById(p.getCategory_Id());%>
			<tr>
			<td><%=count++ %></td>
			<td><%= p.getProduct_Id() %></td>
			<td><%= p.getProducr_Name() %></td>
			<td><%= p.getPrice() %></td>
			<td>
			<% if (pc != null && !pc.isEmpty()) {
				for (ProductCategory procat : pc) { %>
				<%= procat.getName() %>
				<% }
					} else { %>
						N/A
					<% } %>
			</td>
			</tr>
			<%} %>
        </tbody>
      </table>
    </div>
</body>
</html>
