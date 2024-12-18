<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <div class="container"  style="width: 60%">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;">
                    <div class="card-header text-center" >
                        <h3>Login</h3>
                        <%String success=(String)request.getAttribute("success");
                        if(success!= null){
                        %>
                        <p style="color: green; font-size: 0.8rem;"><%=success %></p>
                        <%} %>
                        <%String failure=(String)request.getAttribute("failure");
                        if(failure!= null){
                        %>
                        <p style="color: red; font-size: 0.8rem;"><%=failure %></p>
                        <%} %>
                    </div>
                    <div class="card-body">
                        <form action="employeeLogin" method="post" onsubmit="return validateForm()">
                            <div class="form-group">
                                <label for="username">Employee id :</label>
                                <input type="number" id="username" name="empId" class="form-control" placeholder="Employee id" required>
                                <div class="invalid-feedback">Username is required.</div>
                            </div>
                            <div class="form-group">
                                <label for="password">Password :</label>
                                <input type="password" id="password" name="empPassword" class="form-control" placeholder="Password" required="required">
                                <div class="invalid-feedback">Password is required and must be at least 6 characters long.</div>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Login</button>
                        </form>
                        <div style="display: flex; align-items: center; justify-content: space-around;margin-top: 10px"><a href="forgotPassword.jsp" >Forget password</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function validateForm() {
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            var valid = true;

            if (username == "") {
                document.getElementById("username").classList.add("is-invalid");
                valid = false;
            } else {
                document.getElementById("username").classList.remove("is-invalid");
            }

            if (password == "" || password.length < 6) {
                document.getElementById("password").classList.add("is-invalid");
                valid = false;
            } else {
                document.getElementById("password").classList.remove("is-invalid");
            }

            return valid;
        }
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
    