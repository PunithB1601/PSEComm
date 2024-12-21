<%@page import="com.emp.DTO.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .sidebar {
            height: 100vh;
            overflow-y: auto;
            background-color: #3c3d37;
        }
        .sidebar a {
            color: #ffffff;
            padding: 15px;
            display: block;
            text-decoration: none;
            font-weight: bold;
            margin: 5px 0;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .sidebar a:hover {
            background-color: #16a085;
        }
        .content {
            padding: 20px;
            background-color: #f8f9fa;
            min-height: 100vh;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .navbar {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .form-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold text-primary" href="#">Admin Dashboard</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <%Employee e=(Employee)session.getAttribute("employee"); %>
                        <a class="nav-link" href="#">Welcome, <%=e.getFname() %></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="d-flex">
        <div class="sidebar p-3" style="background-color:#3C3D37;">
            <a href="#dashboard">Dashboard</a>
            <a href="EmpList.jsp">Manage Users</a>
			<a href="ViewProduct.jsp">View Products</a>
            <a href="AdminProfile.jsp">Profile</a>
            <a href="forgotPassword.jsp">ResetPin</a>
         	<form action="logout" method="post">
                <input type="submit" name="logout" value="Logout" class="btn btn-outline-light btn-sm ms-3">
            </form> 
        </div>

        <div class="content flex-grow-1">
            <div class="row mb-4">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header bg-danger text-white">Delete Product</div>
                        <div class="card-body">
                            <form onsubmit="return validateForm(event)">
                                <div class="mb-3">
                                    <label for="deleteProductID" class="form-label">Product ID</label>
                                    <input type="text" class="form-control" id="deleteProductID" placeholder="Enter Product ID to Delete">
                                </div>
                                <div class="form-actions">
                                    <a href="delete.html" ><button type="submit" class="btn btn-danger">Delete Product</button></a>
                                    <a href="EmployeeAdminDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function validateForm(event) {
            const productId = document.getElementById('deleteProductID').value.trim();
            if (!productId) {
                alert('Please provide a Product ID to delete.');
                return false; // Prevent form submission
            }
            // Proceed with deletion logic if needed
            alert('Product ID provided. Deleting the product...');
            return true; // Allow form submission
        }
    </script>
</body>
</html>
    