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
            display: flex;
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

        .navbar-brand {
            color: blue;
            font-weight: bold;
            font-size: 20px;
        }

        .d-flex {
            display: flex;
            align-items: stretch;
            height: 100%;
        }

        .sidebar {
            width: 250px;
            background-color: #1abc9c;
            color: white;
            padding: 15px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
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

        .table-container {
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table th, table td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ccc;
        }

        table th {
            background-color: #007bff;
            color: white;
        }

        .button {
            background-color: #007bff;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
        }

        .button:hover {
            background-color: #0056b3;
        }

        .btn-danger {
            background-color: #dc3545;
        }

        .btn-danger:hover {
            background-color: #bd2130;
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

        .btn-secondary:hover {
            background-color: #5a6268;
        }
    </style>
</head>

<body>
    <!-- Navbar -->
    <div class="navbar">
        <div class="navbar-brand" style="color : blue; font-weight : bold; padding : 8px;">Admin Dashboard</div>
        <div>
            <% Employee e = (Employee) session.getAttribute("employee"); %>
            <a style="color : #000000A6">Welcome, <%= e.getFname() %></a>
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
            <h3 style="text-align : center;">Location Details</h3>

            <% String delsuccess = (String) request.getAttribute("Delsuccess");
            if (delsuccess != null) { %>
                <h4 style="color : green;"><%= delsuccess %></h4>
            <% } %>

            <% String delfailure = (String) request.getAttribute("Delfailure");
            if (delfailure != null) { %>
                <h4 style="color : red;"><%= delfailure %></h4>
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
                        <tr>
                            <% locationDAO ldao = new locationDAOimp();
                            List<Location> locations = ldao.getlocation();
                            Iterator<Location> itr = locations.iterator();
                            while (itr.hasNext()) {
                                Location l = itr.next();
                            %>
                            <td><%= l.getLid() %></td>
                            <td><%= l.getLocation() %></td>
                            <td><%= l.getCity() %></td>
                            <td><%= l.getState() %></td>

                            <td style="text-align: center;">
                                <form action="updateLocation.jsp" method="post">
                                    <input type="hidden" name="lid" value="<%= l.getLid() %>">
                                    <button type="submit" class="button">Update</button>
                                </form>
                            </td>
                            <td style="text-align: center;">
                                <form action="DeleteLocation" method="post">
                                    <input type="hidden" name="lid" value="<%= l.getLid() %>">
                                    <button type="submit" class="button btn-danger">Delete</button>
                                </form>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>

</html>
