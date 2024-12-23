<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #F2F9FF;
             font-family: "Times New Roman", Times, serif;
        }
       
        h3{
        font-family: fantasy;
        }
        label {
	font-size:1.2rem;
	font-weight: bold;
	margin-bottom: 15px;
	
}
input {

	
}
.input-style{
border: none;
border-bottom: 1px solid black;
width: 100%;
}
div input:focus {
	outline: none;
	
}
.input-style:active {
	background-color: white;
}
	

    </style>
</head>
<body>
    <div class="container"  style="width: 65%;">
        <div class="row justify-content-center"  >
            <div class="col-md-6">
                <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border-radius:20px; padding: 10px;margin: 80px 0;">
                    <div class="card-header text-center" style="background-color: white; border: none;" >
                        <h2>Login</h2>
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
                        <form action="employeeLogin" method="post" >
                            <div class="form-group">

                               

                                <label for="username">Employee id :</label>
                               <div> <input type="tel" id="username" name="empId" class="input-style" placeholder="Employee id"  required>
                               </div>
                                <div class="invalid-feedback">Username is required.</div>
                            </div>
                            <div class="form-group">
                                <label for="password">Password :</label>
                      <div>          <input type="password" id="password" name="empPassword" class="input-style" placeholder="Password" required="required"></div>
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
    