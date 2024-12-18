<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .sidebar {
            height: 100vh;
            overflow-y: auto;
            background-color: #1abc9c;
        }
        
        .sidebar a {
            color: #ffffff;
            padding: 15px;
            display: block;
            text-decoration: none;
            font-weight: bold;
            margin: 5px 0;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        
        .sidebar a:hover {
            background-color: #16a085;
        }
        
        .content {
            padding: 20px;
            background-color: #f8f9fa;
            min-height: 100vh;
        }
        
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .navbar {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .form-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .btn btn-secondary:hover {
            background: #1abc9c;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold text-primary" href="#">Admin Dashboard</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Welcome, Admin</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-danger" href="#logout">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="d-flex">
        <div class="sidebar p-3">
            <h4 class="text-white">Menu</h4>
            <a href="#dashboard">Dashboard</a>
            <a href="#users">Manage Users</a>
            <a href="#settings">Settings</a>
            <a href="#reports">Reports</a>
            <a href="#logout">Logout</a>
        </div>

        <div class="content flex-grow-1">
            <div class="row mb-4">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header bg-primary text-white">Add New Employee</div>
                        <div class="card-body">
                            <form>
                                <div class="mb-3">
                                    <label for="EmpID" class="form-label">Employees ID</label>
                                    <input type="text" class="form-control" id="EmployeeID" placeholder="Enter  ID">
                                </div>
                                <div class="mb-3">
                                    <label for="Name" class="form-label">Name</label>
                                    <input type="text" class="form-control" id="Name" placeholder="Enter Name">
                                </div>
                                <div class="mb-3">
                                    <label for="Email ID" class="form-label">Email ID</label>
                                    <input type="email" class="form-control" id="Email ID" placeholder="Enter Email ID">
                                </div>
                                <div class="mb-3">
                                    <label for="Phone number" class="form-label">Phone number</label>
                                    <input type="tel" class="form-control" id="Phone number" placeholder="Enter Phone number">

                                </div>
                                <div class="mb-3">
                                    <label for="Designation" class="form-label">Designation</label>
                                    <input type="text" class="form-control" id="Designation" placeholder="Enter Designation">
                                </div>
                                <div class="mb-3">
                                    <label for="Salary" class="form-label">Salary</label>
                                    <input type="number" class="form-control" id="Salary" placeholder="Enter Salary">
                                </div>
                                <div class="mb-3">
                                    <label for="Password" class="form-label">Password</label>
                                    <input type="Password" class="form-control" id="Password" placeholder="Enter Password">
                                </div>
                                <div class="mb-3">
                                    <label for="Confirm Password" class="form-label">Confirm Password</label>
                                    <input type="Password" class="form-control" id="Confirm Password" placeholder="Enter Confirm Password">
                                </div>



                                <div class="form-actions">
                                    <button type="submit" class="btn btn-success">Submit</button>
                                    <a href="EmployeeAdminDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
    