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

        #location {
            width: 400px;
            margin: 0 auto;
            border-radius: 10px;
            border: 1px solid gray;
            padding: 10px;
            box-shadow: 1px 2px 5px graytext !important;
        }

        #location h4 {
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

    </style>
</head>

<body>
    <form id="location" method="post" action="<%= request.getContextPath()+"/customer/requestLocation"%>">

        <h4 class="text-center">Request Location</h4>

        <div class="form-group">
            <label for="text">New Location</label>
            <input type="text" class="form-control" name="newLocation"  required="required">
        </div>
        <div class="form-footer">
            <button type="submit" class="btn btn-primary mb-3">Submit Request</button>
        </div>
    </form>
 
</body>
</html>
    