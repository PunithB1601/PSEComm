<%@ page import="com.emp.DTO.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Profile</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            margin-top: 50px;
        }
        .form-actions {
            display: flex;
            justify-content: space-between;
        }
        .invalid-feedback {
            display: none;
            color: red;
        }
        .is-invalid + .invalid-feedback {
            display: block;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header text-center">
                        <h3>Update Profile</h3>
                    </div>
                    <% Employee e = (Employee) session.getAttribute("employee"); %>
                    <div class="card-body">
                     
                    
                        <form action="UpdateProfileServlet" method="post" onsubmit="return validatePassword()">
                            <div class="form-group">
                                <label for="eid">Employee ID:</label>
                                <input type="text" id="eid" name="eid" class="form-control" readonly value="<%= e.getEid() %>">
                            </div>
                            <div class="form-group">
                                <label for="fname">First Name:</label>
                                <input type="text" id="fname" name="fname" class="form-control" required value="<%= e.getFname() %>">
                            </div>
                            <div class="form-group">
                                <label for="lname">Last Name:</label>
                                <input type="text" id="lname" name="lname" class="form-control" required value="<%= e.getLname() %>">
                            </div>
                            <div class="form-group">
                                <label for="dob">Date of Birth:</label>
                                <input type="date" id="dob" name="dob" class="form-control" required value="<%= e.getDOB() %>">
                            </div>
                            <div class="form-group">
                                <label for="gender">Gender:</label>
                                <select id="gender" name="gender" class="form-control" required>
                                    <option value="m" <%= e.getGender().equalsIgnoreCase("m") ? "selected" : "" %>>Male</option>
                                    <option value="f" <%= e.getGender().equalsIgnoreCase("f") ? "selected" : "" %>>Female</option>
                                    <option value="o" <%= e.getGender().equalsIgnoreCase("o") ? "selected" : "" %>>Other</option>
                                </select>
                            </div>
    <div class="form-group">
        <label for="mailid">Email:</label>
        <input type="email" id="mailid" name="mailid" class="form-control" required value="<%= e.getMail() %>">
    </div>
    <div class="form-group">
        <label for="phone">Phone:</label>
        <input type="tel" id="phone" name="phone" class="form-control" required value="<%= e.getPhone() %>">
    </div>
    <div class="form-actions">
        <button type="submit" class="btn btn-success">Update Profile</button>
        <a href="SalesmanDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
    </div>

                            
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
