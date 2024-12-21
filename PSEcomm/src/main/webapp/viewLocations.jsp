<%@page import="com.emp.DTO.Employee"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.emp.DTO.Location"%>
<%@page import="java.util.List"%>
<%@page import="com.emp.DAO.locationDAOimp"%>
<%@page import="com.emp.DAO.locationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Locations</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            overflow: hidden; /* Disable body scroll */
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


        .navbar-brand {
            color: blue;
            font-weight: bold;
            font-size: 20px;
        }

        .d-flex {
            display: flex;
            height: 100vh;
            overflow: hidden; /* Prevent scroll on the main container */
        }

        .sidebar {
            overflow-y: auto;
            background-color: #3c3d37;
            color: white;
            padding: 20px;
            display: flex;
            flex-direction: column;
            overflow: auto; /* Allow sidebar content to scroll */
        }

        .sidebar a {
            color: #ffffff;
            padding: 12px 20px;
            display: block;
            text-align : center;
            text-decoration: none;
            font-weight: bold;
            margin-bottom: 15px;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #16a085;
        }

        .content {
            flex: 1;
            padding: 20px;
            background-color: #f8f9fa;
            overflow-y: auto; /* Allow content section to scroll if necessary */
        }

        .table-container {
            margin-top: 20px;
            width: 100%; /* Make sure the table container takes full width */
            overflow: visible; /* Ensure no scroll bar on the table container */
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-bottom: 20px;
            border-radius: 10px;
            overflow: hidden;
        }

        table th, table td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
            transition: background-color 0.2s ease;
        }

        table th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }

        table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table tbody tr:nth-child(odd) {
            background-color: #ffffff;
        }

        table tbody tr:hover {
            background-color: #f1f1f1;
        }

        .button, .btn-danger, .btn-secondary {
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .button {
             background-color: #198754;
            color: white;
        }

        .button:hover {
            background-color: #0056b3;
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
        }

        .btn-danger:hover {
            background-color: #bd2130;
        }

        .btn-secondary {
    background-color: #6c757d;
    color: white;
    padding: 10px 20px; /* Increase padding to make it more prominent */
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    margin-bottom : 20px;
    text-decoration: none; /* Ensures link looks like a button */
    transition: background-color 0.3s ease;
    display: inline-block; /* Ensures the button is not hidden by flexbox or block-level properties */
}

.btn-secondary:hover {
    background-color: #5a6268;
}

.table-container {
    margin-top: 20px;
    width: 100%;
    overflow: visible;
    margin-bottom: 20px; /* Adds space below the table */
}

.table-container div {
    display: block;
    width: 100%;
    text-align: right;
    margin-top: 20px; /* Adds space above the button */
}

        h3 {
            text-align: center;
            margin-top: 30px;
        }

        .action-btns {
            text-align: center;
        }

        .navbar-brand, .content h3 {
            font-size: 24px;
            font-weight: 600;
        }
    </style>
</head>

<body>
    <!-- Navbar -->
    <div class="navbar">
        <div class="navbar-brand">Admin Dashboard</div>
        <div>
            <% Employee e = (Employee) session.getAttribute("employee"); %>
            <a style="color: #000000A6; font-weight: 400;">Welcome, <%= e.getFname() %></a>
        </div>
    </div>

    <!-- Main Content Area -->
    <div class="d-flex">
        <!-- Sidebar -->
        <div class="sidebar">
            <a href="viewLocations.jsp">View Locations</a>
            <a href="AddLocation.jsp">Add Location</a>
            <a href="AdminProfile.jsp">Profile</a>
            <a href="employeelogin.jsp">Logout</a>
        </div>

        <!-- Content -->
        <div class="content">
            <h3 style="font-size : 20px;">Location Details</h3>

            <% String delsuccess = (String) request.getAttribute("Delsuccess");
            if (delsuccess != null) { %>
                <h4 style="color : green; text-align:center;"><%= delsuccess %></h4>
            <% } %>

            <% String delfailure = (String) request.getAttribute("Delfailure");
            if (delfailure != null) { %>
                <h4 style="color : red; text-align:center;"><%= delfailure %></h4>
            <% } %>

            <!-- Table to display locations -->
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>LID</th>
                            <th>Location</th>
                            <th>City</th>
                            <th>State</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            locationDAO ldao = new locationDAOimp();
                            List<Location> locations = ldao.getlocation();
                            Iterator<Location> itr = locations.iterator();
                            while (itr.hasNext()) {
                                Location l = itr.next();
                        %>
                        <tr>
                            <td><%= l.getLid() %></td>
                            <td><%= l.getLocation() %></td>
                            <td><%= l.getCity() %></td>
                            <td><%= l.getState() %></td>

                            <td class="action-btns">
                                <form action="updateLocation.jsp" method="post">
                                    <input type="hidden" name="lid" value="<%= l.getLid() %>">
                                    <button type="submit" class="button">Update</button>
                                </form>
                            </td>
                            <td class="action-btns">
                                <form action="DeleteLocation" method="post">
                                    <input type="hidden" name="lid" value="<%= l.getLid() %>">
                                    <button type="submit" class="button btn-danger">Delete</button>
                                </form>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                <div style="text-align:right; margin-top: 15px;">
                    <a href="EmployeeAdminDashboard.jsp" class="btn-secondary">Back to Dashboard</a>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
