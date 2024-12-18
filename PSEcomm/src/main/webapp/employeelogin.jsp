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
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header text-center">
                        <h3>Login</h3>
                    </div>
                    <div class="card-body">
                        <form action="employeeLogin" method="post" onsubmit="return validateForm()">
                            <div class="form-group">
                                <label for="username">Username:</label>
                                <input type="text" id="username" name="empId" class="form-control" required>
                                <div class="invalid-feedback">Username is required.</div>
                            </div>
                            <div class="form-group">
                                <label for="password">Password:</label>
                                <input type="password" id="password" name="empPassword" class="form-control" required>
                                <div class="invalid-feedback">Password is required and must be at least 6 characters long.</div>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Login</button>
                        </form>
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
    