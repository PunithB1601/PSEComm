<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        .form-container {
            border: 2px solid #ccc;
            border-radius: 10px;
            padding: 30px;
            background-color: #f9f9f9;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: auto;
        }
        
        .form-floating {
            margin-bottom: 15px;
        }
        
        .form-container h2 {
            margin-bottom: 20px;
        }
        
        .btn {
            background-color: #333;
            color: #fff;
        }
        
        .btn:hover {
            background-color: #555;
        }
        
        footer {
            text-align: center;
        }
   		.error{
  		color: red;
  		text-align: center;
  		}
		.success{
		color: green;
  		text-align: center;
		}
    </style>
</head>

<body>
<%String success=(String) request.getAttribute("success");
     if(success!=null){%>
     	<h2 class="success"> <%=success%></h2>
     <%}%>
<%String fail=(String) request.getAttribute("failure");
     if(fail!=null){%>
   		 <h2 class="error"><%=fail%></h2>
     <%}%>
    <section class="py-3 py-md-5 py-xl-8">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-6">
                    <div class="form-container">
                        <h2 class="display-5 fw-bold text-center">Forgot Password?</h2>
                        <form id="forgotPasswordForm" action="forgotPassword" method="post">
                            <div class="form-floating">
                                <input type="tel" class="form-control border-0 border-bottom rounded-0" name="phone" id="phone" placeholder="Phone Number" required>
                                <label for="phone" class="form-label">Phone Number</label>
                            </div>
                            <div class="form-floating">
                                <input type="email" class="form-control border-0 border-bottom rounded-0" name="email" id="email" placeholder="name@example.com" required>
                                <label for="email" class="form-label">Email</label>
                            </div>
                            <div class="form-floating">
                                <input type="password" class="form-control border-0 border-bottom rounded-0" name="password" id="password" placeholder="Password" required>
                                <label for="password" class="form-label">Password</label>
                            </div>
                            <div class="form-floating">
                                <input type="password" class="form-control border-0 border-bottom rounded-0" name="confirm" id="confirm" placeholder="Confirm Password" required>
                                <label for="confirm" class="form-label">Confirm Password</label>
                            </div>
                            <div class="d-grid">
                                <button class="btn btn-lg btn-dark rounded-0 fs-6" type="submit">Done</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <footer>
        <p>&copy; 2024 Your Company Name. All Rights Reserved.</p>
    </footer>
    <script>
        $(document).ready(function() {
            $("#forgotPasswordForm").validate({
                rules: {
                    phone: {
                        required: true,
                        digits: true,
                        minlength: 10,
                        maxlength: 15
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    password: {
                        required: true,
                        minlength: 6
                    },
                    confirm: {
                        required: true,
                        equalTo: "#password"
                    }
                },
                messages: {
                    phone: {
                        required: "Please enter your phone number.",
                        digits: "Please enter only digits.",
                        minlength: "Phone number must be at least 10 digits.",
                        maxlength: "Phone number cannot exceed 15 digits."
                    },
                    email: {
                        required: "Please enter your email address.",
                        email: "Please enter a valid email address."
                    },
                    password: {
                        required: "Please enter your password.",
                        minlength: "Password must be at least 6 characters."
                    },
                    confirm: {
                        required: "Please confirm your password.",
                        equalTo: "Passwords do not match."
                    }
                },
                errorElement: 'div',
                errorClass: 'text-danger',
                highlight: function(element) {
                    $(element).addClass('is-invalid');
                },
                unhighlight: function(element) {
                    $(element).removeClass('is-invalid');
                }
            });
        });
    </script>
</body>

</html>