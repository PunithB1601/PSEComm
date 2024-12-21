<%@page import="com.emp.DTO.Employee"%>
<%@page import="com.emp.DAO.EmployeeDAOImp"%>
<%@page import="com.emp.DAO.EmployeeDAO"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <title>Employee List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
    *{
    
    margin: 0px;
    padding: 0px;
    }
        body {
            background-color: #f8f9fa;
        }
        
        
        .card {
            margin-bottom: 20px;
        }
        .card-columns {
            column-count: 3;
        }
        .search-bar {
            display: flex;
            justify-content: flex-end;
        }
        .search-bar input {
            margin-right: 10px;
        }
        .table-actions {
            display: flex;
            gap: 10px;
        }
        .nav{
        padding: 15px 0px;
       
        }
    </style>
</head>
<body>
  <div class="search-bar nav " style="display: flex; flex-direction:column; justify-content: space-between; flex-direction: row;  background-color: white;" >
         <div class="form-actions " style="margin-left:15px "  >
                                   
                                    <a href="EmployeeAdminDashboard.jsp" class="btn btn-secondary" >Back to Dashboard</a>
                                </div>
            <form method="get" action="empList1.jsp" class="form-inline">
                <input type="text"  style="background-color: whitesmoke;" name="search" class="form-control mr-sm-2" placeholder="Search" value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
                <button type="submit" class="btn btn-primary">Search</button>
            </form>
        </div>
    <div class="container">
        
      
        <h1 class="text-center " style="margin-bottom: 20px ">Employee List</h1>
          <% String success = (String) request.getAttribute("success"); %>
            <% if (success != null) { %>
                <p class="text-success text-center mb-3"><%= success %></p>
            <% } %>
            <% String failure = (String) request.getAttribute("failure"); %>
            <% if (failure != null) { %>
                <p class="text-danger text-center mb-3"><%= failure %></p>
            <% } %>
        <div class="card-columns">
            <%
                String searchQuery = request.getParameter("search") != null ? request.getParameter("search") : "";
                EmployeeDAO dao = new EmployeeDAOImp();
                List<Employee> employees = dao.getEmployee1(searchQuery);
                
                for (Employee employee : employees) {
            %>
            <div class="card" style="border-radius: 10px;">
                <div class="card-body">
                    <h5 class="card-title">Employee ID: <%= employee.getEid() %></h5>
                    <p class="card-text"><strong>First Name:</strong> <%= employee.getFname() %></p>
                    <p class="card-text"><strong>Last Name:</strong> <%= employee.getLname() %></p>
                    <p class="card-text"><strong>Job:</strong> <%= employee.getJob() %></p>
                    
                    <p class="card-text"><strong>Phone:</strong> <%= employee.getPhone() %></p>
                    <div class="table-actions">
                        <form action="deleteEmployee" method="post" style="display:inline;">
                            <input type="hidden" name="eid" value="<%= employee.getEid() %>">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </div>
                </div>
                
            </div>
            <%
                }
            %>
             
        </div>
        
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>