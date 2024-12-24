<%@page import="com.emp.DAO.ProductDAOImp"%>
<%@page import="com.emp.DAO.ProductDAO"%>
<%@page import="com.emp.DTO.Product"%>
<%@page import="com.customer.dao.OrderDaoImp"%>
<%@page import="com.customer.dao.OrderDao"%>
<%@page import="com.customer.dto.Order"%>
<%@page import="com.emp.DTO.Department"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.emp.DAO.EmployeeDAOImp"%>
<%@page import="com.emp.DAO.EmployeeDAO"%>
<%@page import="com.emp.DTO.Employee"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
    Employee e = (Employee) session.getAttribute("employee");
    Product p = new Product();
    ProductDAO pdao = new ProductDAOImp();
    List<Product> products = pdao.getProductAndCategorys();
    Order o = new Order();
    OrderDao odao = new OrderDaoImp();
    List<Order> orders = odao.getAllUnAssignedOrders();
    List<Order> orders1 = odao.getDispatcherOrders(e.getEid());
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dispatcher Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Make the sidebar fixed */
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 250px;
            background-color: #343a40;
            color: white;
            padding: 20px;
            overflow-y: auto;
        }

        /* Push the content to the right to accommodate the fixed sidebar */
        .main-content {
            margin-left: 250px;
        }
    </style>
</head>

<body class="bg-light">
    <!-- Sidebar -->
    <div class="sidebar">
        <h2 class="text-center">Dashboard</h2>
        <a href="EmployeeProfile.jsp" class="text-white text-decoration-none p-2 d-block rounded bg-secondary mb-2">My Profile</a>
        <a href="forgotPassword.jsp" class="text-white text-decoration-none p-2 d-block rounded bg-secondary mb-2">Reset Pin</a>
        <form action="logout" method="post" class="mt-4">
            <input style="color: red" type="submit" name="logout" value="Logout" class="btn btn-outline-light btn-block">
        </form>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="d-flex justify-content-between align-items-center p-3 bg-white shadow-sm">
            <h1>Welcome <%= e.getFname() %></h1>
            <%String success=(String)request.getAttribute("success");
                        if(success!= null){
                        %>
                        <p style="color: green; font-size: 0.9rem;"><%=success %></p>
                        <%} %>
                        <%String failure=(String)request.getAttribute("failure");
                        if(failure!= null){
                        %>
                        <p style="color: red; font-size: 0.8rem;"><%=failure %></p>
                        <%} %>
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
                                <th>Order ID</th>
                                <th>Product Id</th>
                                <th>Order Date</th>
                                <th>Delivered Date</th>
                                <th>Status/Update</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Order AO : orders1) { %>
                                <tr>
                                    <td><%= AO.getOrderId() %></td>
                                    <td><%= AO.getProductId() %></td>
                                    <td><%= AO.getOrderDate() %></td>
                                    <td><%= AO.getDeliveryDate() %></td>
                                    <td>
                                        <form action="updateorders" method="post">
                                            <input type="hidden" name="orderId" value="<%= AO.getOrderId() %>">
                                            <select name="orderStatus" class="form-select form-select-sm">
                                                <option value="Dispatched">Dispatched</option>
                                                <option value="Delivered">Delivered</option>
                                            </select>
                                            <button type="submit" name="action" value="Update" class="btn btn-primary btn-sm mt-2">Update</button>
                                        </form>
                                    </td>
                                </tr>
                            <% } %>
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
                                <th>Order ID</th>
                                <th>Product Id</th>
                                <th>Order Date</th>
                                <th>Delivered Date</th>
                                <th>Status/Assign</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Order AO : orders) { %>
                                <tr>
                                    <td><%= AO.getOrderId() %></td>
                                    <td><%= AO.getProductId() %></td>
                                    <td><%= AO.getOrderDate() %></td>
                                    <td><%= AO.getDeliveryDate() %></td>
                                    <td>
                                        <form action="updateorders" method="post">
                                            <input type="hidden" name="orderId" value="<%= AO.getOrderId() %>">
                                            <input type="hidden" name="employeeId" value="<%= e.getEid() %>">
                                            <select name="orderStatus" class="form-select form-select-sm">
                                            	<option value="Pending">Pending</option>
                                                <option value="Dispatched">Dispatched</option>
                                                <option value="Delivered">Delivered</option>
                                            </select>
                                            <button type="submit" name="action" value="Assign" class="btn btn-primary btn-sm">Assign</button>
                                        </form>
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
