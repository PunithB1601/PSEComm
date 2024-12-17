<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <style>
    body{
    	background-color:silver;
    }
        .forgot{
            position: absolute;
            top: 15%;
            left: 35%;
            background-color: white;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            width: 30%;
            border-radius: 10px;
        }
        .forgot h2{
            text-align: center;
            margin: 10px;
        }
        .forgot div{
            margin: 20px;
        }
        .forgot .btn{
           margin: 20px;
        }
        .success{
        	margin-top:20px;
        	text-align:center;
        }
        .fail{
        	text-align:center;
        	margin-top:20px;
        }
    </style>
</head>
<body>

    <form action="forgotPassword" method="post" class="forgot">
        <h2>Reset Password</h2>
        
        <%String success=(String)request.getAttribute("success"); 
		if(success!=null) {%>
		<h5 class="success"><%=success %></h5>
		<%}%>
	
		<%String fail=(String)request.getAttribute("fail");
		if(fail!=null) {%>
		<h5 class="fail"><%=fail %></h5>
		<%}%>
        <div class="mb-2">
        
          <label for="exampleInputEmail1" class="form-label">Email address</label>
          <input type="email" name="mail" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Your Mail id">
        </div>
        <div class="mb-2">
          <label for="exampleInputPassword1" class="form-label">Enter new Password</label>
          <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Enter New Password">
        </div>
        <div class="mb-2">
            <label for="exampleInputPassword1" class="form-label">Confirm Your Password</label>
            <input type="password" name="confirm" class="form-control" id="exampleInputPassword1" placeholder="Confirm New Password">
          </div>
        <div class="mb-2 form-check">
          <input type="checkbox" class="form-check-input" id="exampleCheck1">
          <label class="form-check-label" for="exampleCheck1">Check me out</label>
        </div>
        
       <center><button type="submit" class="btn btn-primary">Reset Password</button></center>
      </form>
    
</body>
</html>