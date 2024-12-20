<%@page import="java.util.Iterator"%>
<%@page import="com.emp.DTO.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.emp.DAO.EmployeeDAOImp"%>
<%@page import="com.emp.DAO.EmployeeDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* General Reset */
        body, h1, h2, p {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f4f4f9;
            color: #333;
        }

        .header {
            background-color: #34495e;
            color: white;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            margin: 0;
            font-size: 1.8rem;
        }

        .header a button {
            font-size: 1rem;
            padding: 8px 16px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            border: 1px solid #ddd;
        }

        .header a button:hover {
            background-color: #2c3e50;
            color: white;
        }

        .employee-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
            padding: 20px;
        }

        .employee-card {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
            padding: 20px;
            width: 250px;
        }

        .employee-card h2 {
            font-size: 1.5em;
            margin: 10px 0;
            color: #8692FC;
        }

        .employee-card p {
            font-size: 1em;
            color: #555;
        }

        .profile-pic {
            width: 100px;
            height: 100px; 
            margin-bottom: 15px;
            margin-left: auto;
            margin-right: auto;
            background-color: gray; 
            color: white;
            display: flex;
            justify-content: center; 
            align-items: center; 
            font-size: 40px; 
            font-weight: bold; 
            border-radius: 50%; 
            text-transform: uppercase; 
            font-family: Arial, sans-serif; 
        }
    </style>
</head>
<body>
    <header class="header">  
        <h1>Developers Directory</h1>
        <a href="SalesmanDashboard.jsp">
            <button class="btn btn-light text-dark border">Back</button>
        </a>
    </header>
    
    <% 
        EmployeeDAO edao = new EmployeeDAOImp();
        List<Employee> employees = edao.getDispatcher();
        Employee emp = null;
        Iterator<Employee> it = employees.iterator();
    %>
    
    <main class="employee-container">
        <% while (it.hasNext()) {
            emp = it.next();
        %>
        <div class="employee-card">
            <div class="profile-pic"><%= emp.getFname().charAt(0) %></div>
            <h2><%= emp.getFname() %></h2>
            <p><%= emp.getJob() %></p>
            <p>Department: <%= emp.getDno() %></p>
        </div>
        <% } %>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
