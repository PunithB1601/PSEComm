<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Page</title>
    <script type="text/javascript"
        src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
    <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link
        href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap"
        rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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

        #signup {
            width: 400px;
            margin: 0 auto;
            border-radius: 10px;
            border: 1px solid gray;
            padding: 10px;
            box-shadow: 1px 2px 5px graytext !important;
        }

        #signup h4 {
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
    </style>
</head>

<body>

    <form id="signup" method="post" action="registerUser">

        <h4 class="text-center">Sign Up</h4>

        <div class="form-group">
            <label for="fname">First Name</label>
            <input type="text" class="form-control" name="firstName" id="fname">
        </div>

        <div class="form-group">
            <label for="lname">Last Name</label>
            <input type="text" class="form-control" name="lastName" id="lname">
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" name="email" id="email">
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" name="password" id="password">
        </div>

        <div class="form-group">
            <label for="confirmPassword">Confirm Password</label>
            <input type="password" class="form-control" name="confirmPassword" id="confirmPassword">
        </div>

        <div class="form-group">
            <label for="mobile">Mobile</label>
            <input type="text" class="form-control" name="phone" id="mobile">
        </div>

        <div class="form-group">
            <label for="inputState">Location</label>
            <select name="location" id="inputState" class="form-control">
                <option value="">Choose</option>
                <option value="New York">New York</option>
                <option value="London">London</option>
                <option value="Paris">Paris</option>
                <option value="Tokyo">Tokyo</option>
            </select>
        </div>

        <div class="form-footer">
            <button type="submit" class="btn btn-primary mb-3">Sign Up</button>
            <p>
                Already have an account? <a href="<%=request.getContextPath()+"/Customer/Login.jsp"%>">Sign In</a>
            </p>
        </div>
    </form>

    <script>
        // Backend Error Display
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

        // Frontend Validation
        $(document).ready(function () {
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
                    email: {
                        required: true,
                        email: true
                    },
                    password: {
                        required: true,
                        minlength: 6
                    },
                    confirmPassword: {
                        required: true,
                        minlength: 6,
                        equalTo: "#password"
                    },
                    phone: {
                        required: true,
                        digits: true,
                        minlength: 10,
                        maxlength: 10
                    },
                    location: {
                        required: true
                    }
                },
                messages: {
                    firstName: "Please enter a valid first name",
                    lastName: "Please enter a valid last name",
                    email: "Please enter a valid email address",
                    password: "Password must be at least 6 characters long",
                    confirmPassword: {
                        required: "Please confirm your password",
                        equalTo: "Passwords do not match"
                    },
                    phone: "Please enter a valid 10-digit mobile number",
                    location: "Please select a location"
                },
                errorElement: "div",
                errorPlacement: function (error, element) {
                    error.addClass("error");
                    error.insertAfter(element);
                },
                highlight: function (element) {
                    $(element).addClass("is-invalid").removeClass("is-valid");
                },
                unhighlight: function (element) {
                    $(element).addClass("is-valid").removeClass("is-invalid");
                }
            });
        });
    </script>
</body>

</html>
