<%@page import="com.emp.DTO.Employee"%>
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
        .btn-group {
            display: flex;
            justify-content: space-between;
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
                    <%Employee e=(Employee)session.getAttribute("employee"); %>
                    <div class="card-body">
                        <form action="UpdateProfileServlet" method="post" onsubmit="return validatePassword()">
                            <div class="form-group">
                                <label for="eid">Employee ID:</label>
                                <input type="text" id="eid" name="eid" class="form-control" readonly value="<%= e.getCid()%>">
                            </div>
                            <div class="form-group">
                                <label for="fname">First Name:</label>
                                <input type="text" id="fname" name="fname" class="form-control" required value="<%= e.getFname()%>">
                            </div>
                            <div class="form-group">
                                <label for="lname">Last Name:</label>
                                <input type="text" id="lname" name="lname" class="form-control" required value="<%= e.getLname()%>">
                            </div>
                            <div class="form-group">
                                <label for="dob">Date of Birth:</label>
                                <input type="date" id="dob" name="dob" class="form-control" required value="<%= e.getDOB()%>">
                            </div>
                            <div class="form-group">
                                <label for="gender">Gender:</label>
                                <input type="text" id="gender" name="gender" class="form-control" required value="<%= e.getGender()%>">
                            </div>
                            <div class="form-group">
                                <label for="job">Job:</label>
                                <input type="text" id="job" name="job" class="form-control" required value="<%= e.getJob()%>">
                            </div>
                            <div class="form-group">
                                <label for="salary">Salary:</label>
                                <input type="number" id="salary" name="salary" class="form-control" required value="<%= e.getSalary()%>">
                            </div>
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" id="email" name="email" class="form-control" required value="<%= e.getMail()%>">
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone Number:</label>
                                <input type="tel" id="phone" name="phone" class="form-control" required value="<%= e.getPhone()%>">
                            </div>
                            <div class="form-group">
                                <label for="password">Password:</label>
                                <input type="password" id="password" name="password" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="confirmPassword">Confirm Password:</label>
                                <input type="password" id="confirmPassword" name="confirmPassword" class="form-control">
                                <div class="invalid-feedback">Passwords do not match.</div>
                            </div>
                            <div class="form-actions">
                                    <button type="submit" class="btn btn-success">Add Product</button>
                                    <a href="EmployeeAdminDashboard.jsp" class="btn btn-secondary" style="margin-left: 210px">Back to Dashboard</a>
                                </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function validatePassword() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            if (password !== confirmPassword) {
                document.getElementById("confirmPassword").classList.add("is-invalid");
                return false;
            } else {
                document.getElementById("confirmPassword").classList.remove("is-invalid");
                return true;
            }
        }
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
