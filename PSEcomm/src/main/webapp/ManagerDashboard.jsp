<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.emp.DTO.Department"%>
<%@page import="com.emp.DAO.EmployeeDAOImp"%>
<%@page import="com.emp.DAO.EmployeeDAO"%>
<%@page import="com.emp.DTO.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manager Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .sidebar {
            height: 100vh;
            background-color: #343a40;
            color: white;
            padding: 20px;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
            margin: 10px 0;
            padding: 10px;
            border-radius: 5px;
        }

        .sidebar a:hover {
            background-color: #1abc9c;
        }

        .content {
            padding: 20px;
        }

        .card {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>

<body class="d-flex">
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Manager Dashboard</h2>
        <a href="ViewEmp.jsp">View Employees</a>
        <a href="EmployeeProfile.jsp">My Profile</a>
        <form action="logout" method="post">
            <button class="btn btn-danger w-100 mt-3">Logout</button>
        </form>
    </div>

    <!-- Main Content -->
    <div class="content flex-grow-1">
        <!-- Header -->
        <% Employee manager = (Employee) session.getAttribute("employee"); %>
        <div class="d-flex justify-content-between align-items-center bg-white p-3 mb-4 shadow-sm">
            <h1>Welcome, <%= manager.getFname() %></h1>
        </div>

        <!-- Overview Cards -->
        <div class="row mb-4">
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Total Employees</h5>
                        <p class="card-text fs-4 text-primary">120</p>
                        <a href="ViewEmp.jsp" class="btn btn-secondary">View Employees</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Active Projects</h5>
                        <p class="card-text fs-4 text-primary">8</p>
                        <a href="ViewProjects.jsp" class="btn btn-secondary">View Projects</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Pending Tasks</h5>
                        <p class="card-text fs-4 text-primary">15</p>
                        <a href="ViewTasks.jsp" class="btn btn-secondary">View Tasks</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Department Details -->
        <div class="container">
            <div class="bg-primary text-white p-3 rounded-top">
                <h4>Department Details</h4>
            </div>
            <table class="table table-bordered table-striped">
                <thead class="table-primary">
                    <tr>
                        <th>Department Name</th>
                        <th>Dept No</th>
                        <th>Employee Count</th>
                    </tr>
                </thead>
                <tbody>
                    <% EmployeeDAO edao = new EmployeeDAOImp();
                        List<Department> departments = edao.getDetails();
                        for (Department department : departments) { %>
                    <tr>
                        <td><%= department.getDname() %></td>
                        <td><%= department.getDno() %></td>
                        <td><%= department.getCount() %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
