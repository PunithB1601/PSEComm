<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In</title>
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

        #signin {
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
    </style>
</head>

<body>
    <form id="signin" method="post" action="loginUser">

        <h4 class="text-center">Sign In</h4>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" name="email" id="email">
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" name="password" id="password">
        </div>

        <div class="form-footer">
            <button type="submit" class="btn btn-primary mb-3">Sign In</button>
            <p>
                Don't have an account? <a href="<%=request.getContextPath()+"/Customer/Signup.jsp"%>">Sign Up</a>
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
            $("#signin").validate({
                rules: {
                    email: {
                        required: true,
                        email: true
                    },
                    password: {
                        required: true,
                        minlength: 6
                    }
                },
                messages: {
                    email: "Please enter a valid email address",
                    password: {
                        required: "Please enter your password",
                        minlength: "Password must be at least 6 characters long"
                    }
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
