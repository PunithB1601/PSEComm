<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: whitesmoke;/* Teal gradient */
            height: 100vh; /* Full screen height */
            display: flex;
            justify-content: center;
            align-items: center;
            
            color: #ffffff; /* White text for better contrast */
        }
        .card {
            border: none; /* Remove border */
           box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
        }
        .card-header {
            background-color: #004c4c; /* Dark teal header */
            color: #ffffff; /* White text */
        }
        .btn-custom {
            background-color: #ffffff; /* White button */
            color: #004c4c; /* Dark teal text */
            border: 2px solid #004c4c; /* Teal border */
        }
        .btn-custom:hover {
            background-color: #004c4c; /* Teal background on hover */
            color: #ffffff; /* White text on hover */
        }
        .btn-link-custom {
            color: #ffd700; /* Gold color for visibility */
            font-size: 1.1rem; /* Slightly larger font size */
            font-weight: bold; /* Bold text for emphasis */
            text-decoration: none; /* Remove default underline */
            transition: color 0.3s ease, text-shadow 0.3s ease; /* Smooth transitions */
        }
        .btn-link-custom:hover {
            color: #ffffff; /* White color on hover */
            text-shadow: 0 0 5px #ffd700, 0 0 10px #ffd700; /* Glow effect on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-5 col-md-6 col-sm-8">
                <div class="card rounded-4">
                    <div class="card-header text-center rounded-top-4">
                        <h2 class="mb-0">Employee Login</h2>
                    </div>
                    <div class="card-body p-4">
                        <form action="employeeLogin" method="post">
                            <div class="mb-3">
                                <label for="empId" class="form-label fw-bold">Enter Your Employee ID</label>
                                <input type="tel" 
                                       class="form-control form-control-lg" 
                                       id="empId" 
                                       name="empId" 
                                       placeholder="Enter your Employee ID" 
                                       pattern="[0-9]+" 
                                       title="Employee ID must be digits only." 
                                       required>
                            </div>
                            <div class="mb-3">
                                <label for="empPassword" class="form-label fw-bold">Enter Your Password</label>
                                <input type="password" 
                                       class="form-control form-control-lg" 
                                       id="empPassword" 
                                       name="empPassword" 
                                       placeholder="Enter your password" 
                                       pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                                       title="Password must contain at least one uppercase letter, one lowercase letter, one digit, and at least 8 characters." 
                                       required>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-custom btn-lg">Login</button>
                            </div>
                        </form>
                        <div class="text-center mt-3">
                            <a href="forgotPassword.jsp" class="btn-link-custom">
                                <i class="bi bi-key"></i> Forgot Password?
                            </a>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS and Icons -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</body>
</html>
