<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Page</title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .form-container {
            border: 2px solid #ccc;
            border-radius: 10px;
            padding: 20px;
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
    </style>
</head>

<body>
	<%String success=(String) request.getAttribute("success");
     if(success!=null){%>
     	<h1 class="text-2xl text-center font-bold text-green-600"> <%=success%></h1>
     <%}%>
     
     <%String fail=(String) request.getAttribute("failure");
     if(fail!=null){%>
   		 <h1 class=" text-2xl text-center font-bold text-red-600"> <%=fail%></h1>
     <%}%>
    <!-- Registration Form -->
    <section class="py-3 py-md-5 py-l-8">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="form-container">
                        <h2 class="display-5 fw-bold text-center">Register!</h2>
                        <form id="signup" action="signup" method="post">
                            <div class="form-floating">
                                <input type="text" class="form-control border-0 border-bottom rounded-0" name="firstName" id="firstName" placeholder="First Name" required>
                                <label for="firstName" class="form-label">First Name</label>
                            </div>
                            <div class="form-floating">
                                <input type="text" class="form-control border-0 border-bottom rounded-0" name="lastName" id="lastName" placeholder="Last Name" required>
                                <label for="lastName"  class="form-label">Last Name</label>
                            </div>
                            <div class="form-floating">
                                <input type="phone" class="form-control border-0 border-bottom rounded-0" name="phone" id="phone" placeholder="Phone Number" required>
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
                            <div class="form-check mb-3">
                                <input class="form-check-input" type="checkbox" name="iAgree" id="iAgree" required>
                                <label class="form-check-label text-secondary" for="iAgree">
                                    I agree to the <a href="#!" class="link-primary text-decoration-none">terms and conditions</a>
                                </label>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary w-100">Register</button>
                            </div>
                        </form>
                        <br>
                        <p class="text-center m-0">Already have an account? <a href="Login.jsp" class="link-primary text-decoration-none">Sign in</a></p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        $(document).ready(function() {
            $("#signup").validate({
                rules: {
                    firstName: {
                        required: true,
                        minlength: 2
                    },
                    lastName: {
                        required: true,
                        minlength: 2
                    },
                    phone: {
                        required: true,
                        digits: true,
                        minlength: 10,
                        maxlength: 10
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    password: {
                        required: true,
                        minlength: 6
                    },
                    iAgree: {
                        required: true
                    }
                },
                messages: {
                    firstName: "Please enter a valid first name",
                    lastName: "Please enter a valid last name",
                    phone: "Please enter a valid phone number",
                    email: "Please enter a valid email",
                    password: "Password must be at least 6 characters long",
                    iAgree: "You must agree to the terms and conditions"
                },
                errorElement: "div",
                errorPlacement: function(error, element) {
                    error.addClass("invalid-feedback");
                    if (element.prop("type") === "checkbox") {
                        error.insertAfter(element.next("label"));
                    } else {
                        error.insertAfter(element);
                    }
                },
                highlight: function(element) {
                    $(element).addClass("is-invalid").removeClass("is-valid");
                },
                unhighlight: function(element) {
                    $(element).addClass("is-valid").removeClass("is-invalid");
                }
            });
        });
    </script>
</body>

</html>