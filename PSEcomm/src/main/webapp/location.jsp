<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Location Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        
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
        
        button {
            padding: 10px 15px;
            margin-top: 10px;
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
        <div class="content w-100">
            <div class="section">

            </div>
            <br>
            <br>
            <br>
           
            <br>
            <br>

            <div class="section">
                <h3>Add Location</h3>
                 
<%String success=(String)request.getAttribute("success");
if(success!=null){%>
<center><h3 class="success"><%=success %></h3></center>
<%} %>
<%String failure=(String)request.getAttribute("failuer");
if(failure!=null){%>
<center><h3 class="failed"><%=failure %></h3></center>
<%} %>
<form action="addproduct" method="post">
                <div class="mb-3">
                    <label for="Location" class="form-label">Location</label>
                    <input type="text" class="form-control" name="Location" placeholder="Enter Location">
                </div>
                <div class="mb-3">
                    <label for="City" class="form-label">City</label>
                    <input type="text" class="form-control" name="City" placeholder="Enter City">
                </div>
                <div class="mb-3">
                    <label for="State" class="form-label">State</label>
                    <input type="text" class="form-control" name="State" placeholder="Enter State">
                </div>
                <button onclick="addLocation()" class="btn btn-primary">Add Location</button>
                <button  class="btn btn-primary"></button>
            </div>
            </form>
        </div>
    </div>

    <script>
        function addLocation() {
            const location = document.getElementById('location').value;
            const city = document.getElementById('city').value;
            const state = document.getElementById('state').value;

            if (location && city && state) {
                alert(`Location Added:\nLocation: ${location}\nCity: ${city}\nState: ${state}`);
            } else {
                alert('Please fill all fields before adding a location.');
            }
        }
    </script>
</body>

</html>
