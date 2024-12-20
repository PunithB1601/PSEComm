<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.emp.DTO.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.emp.DAO.EmployeeDAOImp"%>
<%@page import="com.emp.DAO.EmployeeDAO"%>
<%@page import="com.emp.DAO.ProductDAOImp"%>
<%@page import="com.emp.DTO.Product"%>
<%@page import="com.emp.DAO.ProductDAO"%>
<%@page import="com.emp.DTO.Location"%>
<%@page import="com.emp.DAO.locationDAOimp"%>
<%@page import="com.emp.DAO.locationDAO"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Salesman Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
	background-color: #F1F0E8;
}

.sidebar {
	height: 100vh;
	background-color: #3C3D37;
	padding: 15px;
	color: white;
}

.sidebar a {
	color: white;
	text-decoration: none;
	display: block;
	padding: 10px;
	border-radius: 5px;
}

.sidebar a:hover {
	background-color: #1abc9c;
}

.content {
	padding: 20px;
	background-color: #f8f9fa;
}

.card {
	border: none;
	border-radius: 10px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.navbar {
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

a {
	text-decoration: none;
}

a:hover {
	opacity: 0.8;
}
</style>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand fw-bold text-primary" href="#">Salesman
				Dashboard</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<% Employee e = (Employee) session.getAttribute("employee"); %>
					<li class="nav-item"><a class="nav-link">Welcome, <%= e.getFname() %></a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="d-flex">
		<!-- Sidebar -->
		<div class="sidebar">
			<a href="#dashboard">Dashboard</a> <a href="ViewProducts.jsp">View Products</a>
			 <a href="AddOrder.jsp">Add Orders</a> 
			 <a href="EmployeeProfile.jsp">Profile</a>
			 <a href="forgotPassword.jsp">ResetPin</a>
			<form action="logout" method="post">
				<a href="employeelogin.jsp">Logout</a>
			</form>

		</div>

		<!-- Main Content -->
		<div class="content flex-grow-1">
			<!-- Overview Cards -->
			<div class="row mb-4">
				<% ProductDAO productDAO = new ProductDAOImp();
                   List<Product> products = productDAO.getproducts();
                %>
				<div class="col-md-4">
					<div class="card text-center">
						<div class="card-body">
							<h5 class="card-title">Total Products</h5>
							<p class="card-text fs-4"><%= products.size() %></p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card text-center">
						<div class="card-body">
							<h5 class="card-title">Total Orders</h5>
							<p class="card-text fs-4">200</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card text-center">
						<div class="card-body">
							<h5 class="card-title">Total Customers</h5>
							<p class="card-text fs-4">150</p>
						</div>
					</div>
				</div>
			</div>

			<!-- Product Table -->
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div
							class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
							<span>Products</span> <a href="ViewProducts.jsp"
								class="text-white">View All Products</a>
						</div>
						<div class="card-body">
							<table class="table table-striped">
								<thead class="table-dark">
									<tr>
										<th scope="col">PID</th>
										<th scope="col">Product Name</th>
										<th scope="col">Price</th>
										<th scope="col">Category</th>
									</tr>
								</thead>
								<tbody>
									<% 
                            int count = 0; 
                            for (Product product : products) { 
                                if (count == 5) break; 
                        %>
									<tr>
										<td><%= product.getProduct_Id() %></td>
										<td><%= product.getProducr_Name() %></td>
										<td><%= product.getPrice() %></td>
										<td><%= product.getCategory_Id() %></td>
									</tr>
									<% count++; } %>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>



			<!-- Orders and Performance -->
			<div class="row mt-4">
				<div class="col-md-6">
					<div class="card">
						<div class="card-header bg-success text-white">Recent Orders</div>
						<div class="card-body">
							<ul class="list-group">
								<li class="list-group-item">Order #12345 - Completed</li>
								<li class="list-group-item">Order #12346 - Pending</li>
								<li class="list-group-item">Order #12347 - Shipped</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>
