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
    	background-color:#f4f6f9;
    }
    .container{
    	margin:80px;
    	border-radius: 20px;
    }
        .forgot{
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.3), 0 6px 20px 0 rgba(0, 0, 0, 0.19);   
        }
        .forgot div{
            margin: 20px;
        }
        .forgot .btn{
           margin: 20px;
        }
        .back
        {
        	text-decoration:none;
        	color:white;
        	
        }
        .success{
        	margin-top:20px;
        	text-align:center;
        	color:green;
        }
        .fail{
        	text-align:center;
        	margin-top:20px;
        	color:red;
        }
    </style>
</head>
<body>

<div class="container">
     <div class="row justify-content-center">
     <div class="col-md-5">
	 <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;">
	 <div class="card-header text-center" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;">
	 <h2 class="mb-3 mt-3">Reset Password</h2>
	 <%String success=(String)request.getAttribute("success"); 
		if(success!=null) {%>
		<h4 class="success"><%=success %></h4>
		<%}%>
	
		<%String failure=(String)request.getAttribute("failure");
		if(failure!=null) {%>
<<<<<<< HEAD
		<h4 class="fail"><%=failure %></h4>
=======
		<h5 class="fail"><%=failure %></h5>
>>>>>>> branch 'Emp1' of https://github.com/PunithB1601/PSEComm.git
		<%}%>
		</div>
		
    <form action="changePassword" method="post" class="forgot">
        
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
            <input type="password" name="confirm_password" class="form-control" id="exampleInputPassword1" placeholder="Confirm New Password">
          </div>
        <div class="mb-2 form-check">
          <input type="checkbox" class="form-check-input" id="exampleCheck1">
          <label class="form-check-label" for="exampleCheck1">Check me out</label>
        </div>
        
       <center><button type="submit" class="btn btn-primary">Reset Password</button>
       <a href="employeelogin.jsp" class="back btn btn-primary">Back</a></center>
      </form>
    </div>
    </div>
    </div>
    </div>
    
</body>
</html>