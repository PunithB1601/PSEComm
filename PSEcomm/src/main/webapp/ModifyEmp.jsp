<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="com.emp.DTO.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.emp.DAO.EmployeeDAOImp"%>
<%@page import="com.emp.DAO.EmployeeDAO"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>manageEmp</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h1 class="h5 text-dark">Edit Employee Salary and Commission</h1>
                <a href="javascript:history.back()" class="btn btn-secondary btn-sm">Back</a>
            </div>
              
  
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead class="table-success">
                        <tr>
                            <th scope="col">Employee ID</th>
                            <th scope="col">Employee Name</th>
                            <th scope="col">Salary </th>
                            <th scope="col">Commission </th>
                            <th scope="col">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                      <%EmployeeDAO edao=new EmployeeDAOImp();
                       List<Employee> employees =edao.getEmployee();
                       Employee emp=null;
                       Iterator<Employee> it= employees.iterator(); %> 
                    <%  while(it.hasNext()){
    	emp=it.next();  %>
                        <tr>
                            <td><%=emp.getEid() %></td>
                            <td><%=emp.getFname() +" "+emp.getLname() %></td>
                            <td><input style="border: none;" type="tel" class="form-control" value=<%=emp.getSalary() %>></td>
                            <td><input style="border: none;" type="tel" class="form-control" value=<%=emp.getCommition() %>></td>
                            <td><button class="btn btn-success btn-sm">Save</button></td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
