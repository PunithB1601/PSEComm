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
            background-color: #1abc9c;
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
        a{
            text-decoration: none;
        }
        a:hover{
            opacity: 0.8;
            
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
                <%Employee e=(Employee)session.getAttribute("employee"); %>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Welcome, <%=e.getFname() %></a>
                    </li>
                   
                </ul>
            </div>
        </div>
    </nav>

    <div class="d-flex">
        <div class="sidebar p-3">
            <a href="#dashboard">Dashboard</a>
            <a href="#users">Manage Users</a>
            <a href="#settings">Settings</a>
            <a href="#reports">Reports</a>
            <a href="#logout">Logout</a>
        </div>

        <div class="content flex-grow-1">
            <div class="row mb-4">
               <a href="AddProduct.jsp" > <div class="col-md-3">
                <div class="card text-center text-bg-primary">
                    <div class="card-body">
                        <h5 class="card-title">Add Product</h5>
                        <p class="card-text fs-4">150</p>
                    </div>
                </div></a>
            </div>
                <div class="col-md-3">
                    <a href="DeleteProduct.jsp">
                        <div class="card text-center text-bg-success">
                            <div class="card-body">
                                <h5 class="card-title">Delete Product</h5>
                                <p class="card-text fs-4">24</p>
                            </div>
                        </div></a>
                </div>
                <div class="col-md-3">
                    <a href="AddEmployee.jsp"><div class="card text-center text-bg-warning">
                        <div class="card-body">
                            <h5 class="card-title">Add Employees</h5>
                            <p class="card-text fs-4">8</p>
                        </div>
                    </div></a>
                </div>
                <div class="col-md-3">
                   <a href="AddLocation.jsp">
                    <div class="card text-center text-bg-danger">
                        <div class="card-body">
                            <h5 class="card-title">Add Locations</h5>
                            <p class="card-text fs-4">2</p>
                        </div>
                    </div>
                   </a>
                </div>
            </div>

            <div class="row">
                <!-- <div class="col-md-6">
                    <div class="card">
                        <div class="card-header bg-primary text-white">Recent Activities</div>
                        <div class="card-body">
                            <ul class="list-group">
                                <li class="list-group-item">User John updated profile</li>
                                <li class="list-group-item">System backup completed</li>
                                <li class="list-group-item">New user registration approved</li>
                            </ul>
                        </div>
                    </div>
                </div> -->
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header bg-primary text-white">Employees</div>
                        <div class="card-body">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Employee Type</th>
                                        <th scope="col">Count</th>
                                        <th scope="col">Details</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Total Employees</td>
                                        <td>150</td>
                                        <td>
                                            <a href="./employees.html"><button class="btn btn-info" type="button" data-bs-toggle="collapse" data-bs-target="#employeeList" aria-expanded="false" aria-controls="employeeList">
                                                View Employees
                                            </button>
                                        </a>
                                            <!-- <div class="collapse" id="employeeList">
                                                <ul class="list-group mt-3">
                                                    <li class="list-group-item">Employee 1</li>
                                                    <li class="list-group-item">Employee 2</li>
                                                    <li class="list-group-item">Employee 3</li>
                                                    
                                                </ul>
                                            </div> -->
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Managers</td>
                                        <td>10</td>
                                        <td>
                                            <a href="./1.html"><button class="btn btn-info" type="button" data-bs-toggle="collapse" data-bs-target="#managerList" aria-expanded="false" aria-controls="managerList">
                                                View Managers
                                            </button>
                                        </a>
                                            <!-- <div class="collapse" id="managerList">
                                                <ul class="list-group mt-3">
                                                    <li class="list-group-item">Manager 1</li>
                                                    <li class="list-group-item">Manager 2</li>
                                                    
                                                </ul>
                                            </div> -->
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Salesmen</td>
                                        <td>50</td>
                                        <td>
                                            <a href="/1.html"><button class="btn btn-info" type="button" data-bs-toggle="collapse" data-bs-target="#salesmanList" aria-expanded="false" aria-controls="salesmanList">
                                                View Salesmen
                                            </button>
                                        </a>
                                            <!-- <div class="collapse" id="salesmanList">
                                                <ul class="list-group mt-3">
                                                    <li class="list-group-item">Salesman 1</li>
                                                    <li class="list-group-item">Salesman 2</li>
                                                    
                                                </ul>
                                            </div> -->
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <!-- <div class="card">
                        <div class="card-header bg-success text-white">System Notifications</div>
                        <div class="card-body">
                            <ul class="list-group">
                                <li class="list-group-item">No critical errors detected</li>
                                <li class="list-group-item">Scheduled maintenance at 12:00 AM</li>
                                <li class="list-group-item">All services running smoothly</li>
                            </ul>
                        </div>
                    </div> -->
                    <div class="card">
                        <div class="card-header bg-success text-white">Product List</div>
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
                                    <tr>
                                        <td>101</td>
                                        <td>Product A</td>
                                        <td>$25</td>
                                        <td>Electronics</td>
                                    </tr>
                                    <tr>
                                        <td>102</td>
                                        <td>Product B</td>
                                        <td>$15</td>
                                        <td>Grocery</td>
                                    </tr>
                                    <tr>
                                        <td>103</td>
                                        <td>Product C</td>
                                        <td>$50</td>
                                        <td>Clothing</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
    