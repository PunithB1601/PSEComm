<%@page import="com.emp.DTO.Employee"%>
<%@page import="com.emp.DTO.Location"%>
<%@page import="com.emp.DAO.locationDAOimp"%>
<%@page import="com.emp.DAO.locationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Location</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            font-size: 16px;
            flex-direction: column;
            font-family: Arial, sans-serif;
        }

        .navbar {
            background-color: #f8f9fa;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
            margin-left: 15px;
        }

        .d-flex {
            display: flex;
        }

        .sidebar {
            overflow-y: auto;
            height: 100vh;
            background-color: #3c3d37;
            color: white;
            padding: 15px;
            box-sizing: border-box;
        }

        .sidebar h4 {
            margin-top: 0;
        }

        .sidebar a {
            color: #ffffff;
            padding: 10px 15px;
            display: block;
            text-decoration: none;
            font-weight: bold;
            border-radius: 4px;
            margin-bottom: 10px;
        }

        .sidebar a:hover {
            background-color: #16a085;
        }

        .content {
            flex: 1;
            padding: 20px;
            background-color: #f8f9fa;
        }

        .section {
            margin-bottom: 30px;
        }

        .form-label {
            display: block;
            margin-bottom: 5px;
            font-size: 17px;
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .button {
            background-color: #007bff;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
        }

        .btn-secondary {
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            background-color: #6c757d;
            color: white;
        }

        .form-actions{
            margin-top: 40px;
            display: flex;
            justify-content: space-between;
        }

        .btn{
            display: flex;
            justify-content: end;
        }

        .button:hover, .btn-secondary:hover {
            background-color: #0056b3;
        }

        .form-container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .form-heading {
            background-color: #007bff;
            color: white;
            padding: 12px;
            border-radius: 10px 10px 0 0;
            font-size: 22px;
            font-weight: bold;
        }

        
        .btn-secondary:hover {
            background-color: #5a6268;
        }
    </style>
</head>

<body>
    <div class="navbar">
        <div class="navbar-brand" style="color : blue; font-weight : bold; padding: 10px; font-size : 20px;">Admin Dashboard</div>
        <div>
            <% Employee e = (Employee) session.getAttribute("employee"); %>
            <a style="color: #000000A6; font-weight: 400;">Welcome, <%= e.getFname() %></a>
        </div>
    </div>

    <div class="d-flex">
        <div class="sidebar">
            <a href="viewLocations.jsp">View Locations</a>
            <a href="AddLocation.jsp">Add Location</a>
            <a href="AdminProfile.jsp">Profile</a>
            <a href="employeelogin.jsp">Logout</a>
        </div>

        <div class="content">
            <div class="section">
                <div class="form-container">
                    <div class="form-heading" style="font-size: 18px;">Update Location</div>
                    <% String updateSuccess = (String) request.getAttribute("updateSuccess");
                    if (updateSuccess != null) { %>
                        <h4 style="color : green; text-align: center;"><%= updateSuccess %></h4>
                    <% } %>

                    <% String updateFail = (String) request.getAttribute("updateFail");
                    if (updateFail != null) { %>
                        <h4 style="color : red; text-align: center;"><%= updateFail %></h4>
                    <% } %>

                    <%
                        int lid = Integer.parseInt(request.getParameter("lid"));
                        locationDAO ldao = new locationDAOimp();
                        Location l = ldao.getLocation(lid);
                    %>
                    <form action="updateLocation" method="post">
                        <input type="hidden" name="lid" value="<%= l.getLid() %>">

                        <label for="Location" class="form-label" style = "margin-top : 15px; font-size: 15px;"">Location</label>
                        <input type="text" id="Location" name="location" class="form-control" value="<%= l.getLocation() %>" required>

                        <label for="City" class="form-label">City</label>
                        <input type="text" id="City" name="city" class="form-control" style="font-size: 15px;" value="<%= l.getCity() %>" required>

                        <label for="State" class="form-label">State</label>
                        <input type="text" id="State" name="state" class="form-control" style="font-size: 15px;" value="<%= l.getState() %>" required>

                        <div class="form-actions">
                            <input type="submit" class="button" value="Update Location" style="font-size: 15px;">
                            <a href="EmployeeAdminDashboard.jsp" class="btn-secondary" style="font-size: 15px;" >Back to Dashboard</a>
                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
