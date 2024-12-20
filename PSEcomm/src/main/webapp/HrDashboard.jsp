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
    <title>HR Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="d-flex vh-100 bg-light">
    <div class="bg-dark text-white p-3 d-flex flex-column gap-3" style="width: 250px;">
        <h2 class="text-center">HR Dashboard</h2>
        <a href="ViewEmp.jsp" class="text-white text-decoration-none p-2 rounded bg-secondary">Employee Records</a>
        <a href="AddEmployee.jsp" class="text-white text-decoration-none p-2 rounded bg-secondary">Add Employee</a>
        <a href="#" class="text-white text-decoration-none p-2 rounded bg-secondary">Remove Employee</a>
        <a href="#" class="text-white text-decoration-none p-2 rounded bg-secondary">My Profile</a>
    </div>

    <% Employee hr = (Employee) session.getAttribute("employee"); %>
    <div class="flex-grow-1 d-flex flex-column">
        <div class="d-flex justify-content-between align-items-center p-3 bg-white shadow-sm">
            <h1>Welcome <%= hr.getFname() %></h1>
            <form action="logout" method="post">
                <button class="btn btn-primary" type="submit" value="logout" name="logout">Logout</button>
            </form>
        </div>

        <div class="d-flex flex-wrap justify-content-center gap-3 p-4">
            <div class="card text-center" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Total Employees</h5>
                    <p class="card-text fs-4 text-primary">120</p>
                    <form action="ViewEmp.jsp" method="post">
                        <button class="btn btn-secondary" type="submit">View Employees</button>
                    </form>
                </div>
            </div>
            <div class="card text-center" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Active Products</h5>
                    <p class="card-text fs-4 text-primary">5</p>
                    <a href="ViewProduct.jsp"><button class="btn btn-secondary">View Products</button></a>
                </div>
            </div>
            <div class="card text-center" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Add Employee</h5>
                    <p class="card-text fs-4 text-primary">15</p>
                    <form action="AddEmployee.jsp" method="post">
                        <button class="btn btn-secondary" type="submit">Add Employee</button>
                    </form>
                </div>
            </div>
            <div class="card text-center" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Remove Employee</h5>
                    <p class="card-text fs-4 text-primary">15</p>
                    <button class="btn btn-secondary">Remove Employee</button>
                </div>
            </div>
        </div>

        <div class="container my-4">
            <div class="bg-primary text-white p-3 rounded-top">
                <h4>Details</h4>
            </div>
            <table class="table table-bordered table-striped">
                <thead class="table-primary">
                    <tr>
                        <th>Department Name</th>
                        <th>Dept No</th>
                        <th>Count</th>
                    </tr>
                </thead>
                <tbody>
                    <% EmployeeDAO edao = new EmployeeDAOImp();
                        List<Department> dept = edao.getDetails();
                        Department department = null;
                        Iterator<Department> it = dept.iterator();
                        while (it.hasNext()) {
                            department = it.next();
                    %>
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
