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
    <link
        href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap"
        rel="stylesheet">
   
    <style>
        * {
            box-shadow: none !important;
        }

        body {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: "Outfit", sans-serif;
            padding: 40px 0px;
        }

        #forgotPasswordForm {
            width: 400px;
            margin: 0 auto;
            border-radius: 10px;
            border: 1px solid gray;
            padding: 10px;
            box-shadow: 1px 2px 5px graytext !important;
        }

        #signin h4 {
            font-size: 1.6rem;
            color: #7209b7;
        }

        .form-footer {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .form-footer button {
            width: 80%;
            background: #14213d;
            color: white;
        }

        .form-footer p {
            font-size: 0.8rem;
        }

        .error {
            color: red;
            font-size: 0.6rem;
        }

        .is-invalid {
            border-color: red !important;
        }

        .is-valid {
            border-color: green !important;
        }
        .forgot-password{
         font-size: 0.7rem;
        }
        .forgot-password a{
         text-decoration: none;
         color: graytext;
        }
        footer p{
          font-size: 0.7rem;
          text-align: center;
        }
    </style>
</head>

<body>
     
     <form id="forgotPasswordForm" method="post" action="loginUser">

        <h4 class="text-center">Forgot Password</h4>
        
        <div class="form-group">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" name="email" id="email" placeholder="Email" required>
           
        </div>

        <div class="form-group">
            <label for="phone" class="form-label">Phone Number</label>
            <input type="tel" class="form-control" name="phone" id="phone" placeholder="Phone Number" required>
           
        </div>

        <div class="form-group">
        <label for="password" class="form-label">Password</label>
             <input type="password" class="form-control " name="password" id="password" placeholder="Password" required>
                                
        </div>
        
        <div class="form-group">
        <label for="confirm" class="form-label">Confirm Password</label>
             <input type="password" class="form-control " name="confirm" id="confirm" placeholder="Confirm Password" required>
                                
        </div>

        <div class="form-footer">
            <button type="submit" class="btn btn-primary mb-3">Reset Password</button>
            
        </div>
        <footer>
           <p>&copy; 2024 Your Company Name. All Rights Reserved.</p>
        </footer>
    </form>
    
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
         
    <% if (request.getAttribute("failure") != null) { 
        String message = (String) request.getAttribute("failure");
        request.removeAttribute("failure");
    %>
    Swal.fire({
        icon: "error",
        title: "Oops...",
        text: "<%= message %>"
    });
    <% } %>
     
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
                errorPlacement: function (error, element) {
                    error.addClass("error");
                    error.insertAfter(element);
                },
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