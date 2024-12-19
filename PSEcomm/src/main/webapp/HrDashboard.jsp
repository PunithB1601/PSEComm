
<%@page import="com.emp.DTO.Department"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.emp.DAO.EmployeeDAOImp"%>
<%@page import="com.emp.DAO.EmployeeDAO"%>
<%@page import="com.emp.DTO.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HR Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            display: flex;
            height: 100vh;
            background-color: #f4f6f9;
        }

        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: white;
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background 0.3s;
        }

        .sidebar a:hover {
            background-color: #34495e;
        }

        .main {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .topbar {
            background-color: #ffffff;
            padding: 15px 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .topbar h1 {
            font-size: 20px;
        }

        .dashboard {
            padding: 20px;
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .card {
            background: white;
            width: 300px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .card h3 {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 24px;
            font-weight: bold;
            color: #3498db;
        }
        .btn{
            padding: 10px 20px; 
            border: none;
             border-radius: 5px; 
             background-color: #3498db;
              color: white;  
              cursor: pointer;

        }
        .btn1{
            padding: 5px 10px;
            border: soild black 2px;
             border-radius: 5px;
            background-color: aliceblue;
            cursor: pointer;
            color:black;
        }
        
        
        
.table-container {
  width: 80%;
  margin: 50px auto;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  background-color: #fff;
  overflow: hidden;
}

/* Header */
.table-header {
  background-color: #007bff;
  color: white;
  padding: 15px;
  font-size: 20px;
  font-weight: bold;
  text-align: left;
}

/* Table */
table {
  width: 100%;
  border-collapse: collapse;
}

th, td {
  text-align: left;
  padding: 15px;
}

th {
  background-color: #f9f9f9;
  font-weight: bold;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

tr:hover {
  background-color: #e6f7ff;
}

/* Buttons */
.details-button {
  display: inline-block;
  background-color: #00c6ff;
  color: #fff;
  text-decoration: none;
  padding: 8px 12px;
  border-radius: 5px;
  text-align: center;
  font-size: 14px;
  font-weight: bold;
}

.details-button:hover {
  background-color: #00a0cc;
  transition: 0.3s;
}
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>HR Dashboard</h2>
        <a href="ViewEmp.jsp">Employee Records</a>
        <a href="AddEmployee.jsp">Add employee</a>
        <a href="#">Remove employee</a>
        <a href="#">My Profile</a>
    </div>
    
  <%Employee hr=(Employee)session.getAttribute("Hr"); %>
    <div class="main">
        <div class="topbar">
            <h1>Welcome <%=hr.getFname() %></h1>
          <form action="logout" method="post"> <button class="btn" type="submit" value="logout" name="logout" >Logout</button></form> 
        </div>
        <div class="dashboard">
             <div class="card">
                <h3>Total Employees</h3>
                <p>120</p>
                <form action="ViewEmp.jsp" method="post"><button class="btn1" type="submit">view employees</button></form>
            </div>  
             <div class="card">
                <h3>Active Products</h3>
                <p>5</p>
                <button class="btn1">view Products</button>
            </div>
            <div class="card">
                <h3>Add Employee</h3>
                <p>15</p>
              <form action="AddEmployee.jsp" method="post"> <button class="btn1" type="submit">Add Employee</button></form> 
            </div>
            <div class="card">
                <h3>Remove Employee</h3>
                <p>15</p>
                <button class="btn1">Remove Employee</button>
            </div>
            
            <div>
  
            
            </div>
            
            
            
        </div>
        
         <div class="table-container">
    <div class="table-header">
      Details 
    </div>
    <table>
      <thead>
        <tr>
          <th>Department Name</th>
          <th>Dept No</th>
          <th>Count</th>
        </tr>
      </thead>
      <tbody>
          <%EmployeeDAO edao=new EmployeeDAOImp();
    List<Department> dept = edao.getDetails();
    Department department=null;
    Iterator<Department> it= dept.iterator();  %>
    <% while(it.hasNext()){
    	department=it.next();
    %>
        <tr>
          <td><%=department.getDname() %></td>
          <td><%=department.getDno() %></td>
          <td><%=department.getCount() %></td>
          
        </tr>
        <%} %>
        
      </tbody>
    </table>
  </div>
    </div>

</body>
</html>
