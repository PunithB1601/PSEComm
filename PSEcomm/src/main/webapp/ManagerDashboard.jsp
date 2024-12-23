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
        
        .effect:hover{
       background-color: #16a085;
       }
       
       .big{
          transition: transform 0.3s ease-in-out;
       }
       
       .big:hover{
          transform: scale(1.07);
         }
    </style>
</head>

<body class="d-flex" style = "text-align  : center;">
    <!-- Sidebar -->
    <div class="sidebar">
        <h2 style = "font-size : 18px;">Manager Dashboard</h2>
        <a href="ViewEmp.jsp">View Employees</a>
        <a href="ViewProduct.jsp">View Products</a>
        <a href="EmployeeProfile.jsp">My Profile</a>
         <a href="forgotPassword.jsp">ResetPin</a>
        <form action="logout" method="post">
                <input type="submit" name="logout" value="Logout" class="btn btn-sm ms-3 effect" style="color : white; font-size : 18px;" >
            </form>
    </div>

    <!-- Main Content -->
    <div class="content flex-grow-1">
        <!-- Header -->
        <% Employee manager = (Employee) session.getAttribute("employee"); %>
        <div class="d-flex justify-content-between align-items-center bg-white p-3 mb-4 shadow-sm">
            <h1 style="font-size : 22px;">Welcome, <%= manager.getFname() %></h1>
        </div>

        <!-- Overview Cards -->
        <div class="row mb-4">
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Salesman</h5>
                        <a href="ViewSalesmen.jsp" class="btn btn-secondary effect big">View Salesman</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Testers</h5>
                        <a href="ViewTester.jsp" class="btn btn-secondary effect big">View Testers</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Developers</h5>
                        <a href="ViewDevelopers.jsp" class="btn btn-secondary effect big">View Developer</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Department Details -->
        <div class="container" style = "margin-top : 50px;">
            <div class="bg-primary text-white p-3 rounded-top">
                <h4>Department Details</h4>
            </div>
            <table class="table ">
                <thead>
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
