<%@page import="com.emp.DTO.Employee"%>
<%@page import="com.emp.DAO.EmployeeDAOImp"%>
<%@page import="com.emp.DAO.EmployeeDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <title>Employee List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #F1F8E8;
        }
        .container {
            margin-top: 50px;
            background-color: white;
        }
        table {
            margin-top: 20px;
        }
        .table-actions {
            display: flex;
            justify-content: space-between;
        }
        tr{
        background-color: white;
        }
        tr:hover {
        
	opacity: 0.7;
	background-color: #D9EAFD;
}
    </style>
</head>
<body>
    <div class="container" style="box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px; padding: 40px; background-color: whiresmoke; border-radius: 15px;">
        <h1 class="text-center">Employee List</h1>
        <% String success = (String) request.getAttribute("success"); %>
            <% if (success != null) { %>
                <p class="text-success text-center mb-3"><%= success %></p>
            <% } %>
            <% String failure = (String) request.getAttribute("failure"); %>
            <% if (failure != null) { %>
                <p class="text-danger text-center mb-3"><%= failure %></p>
            <% } %>
        <table class="table ">
            <thead class="thead-dark">
                <tr>
                    <th>Employee ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Job</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    EmployeeDAO dao = new EmployeeDAOImp();
                    List<Employee> employees = dao.getEmployee();
                    for (Employee emp : employees) {
                %>
                <tr>
                    <td><%= emp.getEid() %></td>
                    <td><%= emp.getFname() %></td>
                    <td><%= emp.getLname() %></td>
                    <td><%= emp.getJob() %></td>
                    <td class="table-actions">
                        <form action="deleteEmployee" method="post">
           					 <input type="hidden" name="eid" value="<%= emp.getEid() %>">
            				 <input type="submit" name="delete" value="Delete" class="btn btn-danger btn-lg">
        				</form>
                        <form action="ModifyEmp.jsp" method="get" style="display:inline;">
                            <input type="hidden" name="eid" value="<%= emp.getEid() %>">
                           <!--  <button type="submit" class="btn btn-primary">View</button> -->
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        
        <%Employee hr=(Employee)session.getAttribute("employee"); %>
     <%Employee e=(Employee)session.getAttribute("employee"); %>

        <div>
          <% if(e.getJob().equalsIgnoreCase("ceo")){ %>
       <a href="EmployeeAdminDashboard.jsp"><button type="button" class="btn btn-primary" style="font-size: 1.2rem; color: black;">Back</button></a>
        <%} else if(hr.getJob().equalsIgnoreCase("hr")){ %>
          <a href="HrDashboard.jsp"><button type="button" class="btn btn-primary" style="font-size: 1.2rem; color: black;">Back</button></a>
           <%} %>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
