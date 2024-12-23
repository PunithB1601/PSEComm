<%@page import="com.emp.DTO.Department"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.emp.DAO.EmployeeDAOImp"%>
<%@page import="com.emp.DAO.EmployeeDAO"%>
<%@page import="com.emp.DTO.Employee"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dispatcher Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="d-flex vh-100 bg-light">
    <div class="bg-dark text-white p-3 d-flex flex-column gap-3" style="width: 250px;">
        <h2 class="text-center"> Dashboard</h2>
        <a href="EmployeeProfile.jsp" class="text-white text-decoration-none p-2 rounded bg-secondary">My Profile</a>
        <a href="forgotPassword.jsp" class="text-white text-decoration-none p-2 rounded bg-secondary">ResetPin</a>
    </div>

    <div class="flex-grow-1 d-flex flex-column">
        <div class="d-flex justify-content-between align-items-center p-3 bg-white shadow-sm">
            <h1>Welcome </h1>
            <form action="logout" method="post">
                <input style="color: red" type="submit" name="logout" value="Logout" class="btn btn-outline-light btn-sm ms-3">
            </form>
        </div>

        <div class="container my-4">
            <div class="row g-4">
                <!-- Assigned Orders -->
                <div class="col-md-6">
                    <div class="bg-primary text-white p-3 rounded-top">
                        <h4>Assigned Orders</h4>
                    </div>
                    <table class="table table-bordered table-striped">
                        <thead class="table-primary">
                            <tr>
                                <th>Product ID</th>
                                <th>Product Name</th>
                                <th>Category</th>
                                <th>Order Status</th>
                            </tr>
                        </thead>
                        <tbody>
                          <tr>
                          
                          
                          </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Unassigned Orders -->
                <div class="col-md-6">
                    <div class="bg-primary text-white p-3 rounded-top">
                        <h4>Unassigned Orders</h4>
                    </div>
                    <table class="table table-bordered table-striped">
                        <thead class="table-primary">
                            <tr>
                                <th>Product ID</th>
                                <th>Product Name</th>
                                <th>Category</th>
                                <th>Order Status</th>
                                <th>Assign</th>
                            </tr>
                        </thead>
                        <tbody>
                          
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
