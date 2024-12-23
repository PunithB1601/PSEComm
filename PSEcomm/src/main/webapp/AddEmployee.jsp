<%@page import="com.emp.DTO.Employee"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.emp.DTO.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.emp.DAO.EmployeeDAOImp"%>
<%@page import="com.emp.DAO.EmployeeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .sidebar {
            height: 100vh;
            overflow-y: auto;
            background-color: #1abc9c;
        }
        
        .sidebar a {
            color: #ffffff;
            padding: 15px;
            display: block;
            text-decoration: none;
            font-weight: bold;
            margin: 5px 0;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        
        .sidebar a:hover {
            background-color: #16a085;
        }
        
        .content {
            padding: 20px;
            background-color: #f8f9fa;
            min-height: 100vh;
        }
        
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .navbar {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .form-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .btn btn-secondary:hover {
            background: #1abc9c;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold text-primary" href="#">Manage Employee</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link text-danger" href="#logout">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="d-flex">
        <div class="content flex-grow-1">
            <div class="row mb-4">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header bg-primary text-white">Add New Employee</div>
                           <%Employee e=(Employee)session.getAttribute("employee"); %>
                        <div class="card-body">
                          <%String success = (String)request.getAttribute("success");
                  if(success!=null){%>
                  <h4 style="color : green; font-size : 17px; font-weight : bold;"><%=success%></h4>
                  <%} %>
                  
                <%String failure = (String)request.getAttribute("failure");
                  if(failure!=null){%>
                  <h4 style="color : red; font-size : 17px; font-weight : bold;"><%=failure%></h4>
                  <%} %> 
                            <form action="addemp" method="post">
                                <div class="mb-3">
                                    <label for="fname" class="form-label">First Name</label>
                                    <input type="text" class="form-control" name="fname" placeholder="Enter First Name">
                                </div>
                                <div class="mb-3">
                                    <label for="lname" class="form-label">Last Name</label>
                                    <input type="text" class="form-control" name="lname" placeholder="Enter Last Name">
                                </div>
                                <div class="mb-3">
                                    <label for="dob" class="form-label">Date of Birth</label>
                                    <input type="date" class="form-control" name="dob">
                                </div>
                                <div class="mb-3">
                                    <label for="gender" class="form-label">Gender</label>
                                    <select class="form-control" name="gender">
                                        <option value="M">Male</option>
                                        <option value="F">Female</option>
                                     
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="job" class="form-label">Designation</label>
                                    <input type="text" class="form-control" name="job" placeholder="Enter Designation">
                                </div>
                                <div class="mb-3">
                                    <label for="mgr" class="form-label">Manager</label>
                                    <input type="text" class="form-control" name="mgr" placeholder="Enter Manager id">
                                </div>
                                <div class="mb-3">
                                    <label for="doj" class="form-label">Date of Joining</label>
                                    <input type="date" class="form-control" name="doj">
                                </div>
                                <div class="mb-3">
                                    <label for="sal" class="form-label">Salary</label>
                                    <input type="number" class="form-control" name="sal" placeholder="Enter Salary">
                                </div>
                                <div class="mb-3">
                                    <label for="comm" class="form-label">Commission</label>
                                    <input type="number" class="form-control" name="comm" placeholder="Enter Commission">
                                </div>
                                <div class="mb-3">
                                    <label for="dno" class="form-label">Department No</label>
                                    <input type="text" class="form-control" name="dno" placeholder="Enter Department No">
                                </div>
                                <div class="mb-3">
                                    <label for="cid" class="form-label">CID</label>
                                    <input type="text" class="form-control" name="cid" placeholder="Enter CID">
                                </div>
                                 <div class="mb-3">
                                    <label for="mailid" class="form-label">Email ID</label>
                                    <input type="email" class="form-control" name="mailid" placeholder="Enter Email ID">
                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Phone Number</label>
                                    <input type="tel" class="form-control" name="phone" placeholder="Enter Phone Number">
                                </div>
                               <div class="mb-3">
                                    <label for="Password" class="form-label">Password</label>
                                    <input type="Password" class="form-control" name="Password" placeholder="Enter password">
                                </div>
                                <div class="form-actions">
                                    <button type="submit" class="btn btn-success">Submit</button>
                                    <a href="EmployeeAdminDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
