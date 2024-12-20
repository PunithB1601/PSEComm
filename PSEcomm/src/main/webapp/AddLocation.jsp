<!DOCTYPE html>
<%@page import="com.emp.DTO.Employee"%>
<%@page import="com.emp.DTO.Location"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    
    <title>Location Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            font-family: Arial, sans-serif;
        }

        .navbar {
            background-color: #f8f9fa;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
            margin-left: 15px;
        }

        .d-flex {
            display: flex;
        }

        .sidebar {
            width: 250px;
            height: 100vh;
            background-color: #1abc9c;
            color: white;
            padding: 15px;
            box-sizing: border-box;
        }

        .sidebar h4 {
            margin-top: 0;
        }

        .sidebar a {
            color: #ffffff;
            padding: 10px 15px;
            display: block;
            text-decoration: none;
            font-weight: bold;
            border-radius: 4px;
            margin-bottom: 10px;
        }

        .sidebar a:hover {
            background-color: #16a085;
        }

        .content {
            flex: 1;
            padding: 20px;
            background-color: #f8f9fa;
        }

        .section {
            margin-bottom: 30px;
        }

        .form-label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .form-actions {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .button {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
        }

        button:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            background-color: #6c757d;
            color: white;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }
    </style>
</head>

<body>
    <div class="navbar">
        <div class="navbar-brand" style="color : blue; font-weight : bold;">Admin Dashboard</div>
        <div>
            <%Employee e=(Employee)session.getAttribute("employee"); %>
            <a style="color : #000000A6">Welcome, <%=e.getFname() %></a>
        </div>
    </div>

    <div class="d-flex">
        <div class="sidebar">
            <a href="viewLocations.jsp">View Locations</a>
            <a href="AdminProfile.jsp">Profile</a>
            <a href="employeelogin.jsp">Logout</a>
        </div>

        <div class="content">
           <!--  <div class="section">
                <h3 style="font-size : 20px;">Locations We Deliver To</h3>
                <select id="locationDropdown" class="form-control" style = "padding : 5px;">
                    <option value="Bangalore">Bangalore</option>
                    <option value="Mumbai">Mumbai</option>
                    <option value="Hyderabad">Hyderabad</option>
                    <option value="Chennai">Chennai</option>
                    <option value="Delhi">Delhi</option>
                </select>
            </div> -->

            <div class="section">
                <h3 style="font-size : 20px;">Add Location</h3>
                
                <%String success = (String)request.getAttribute("success");
                  if(success!=null){%>
                  <h4 style="color : green; font-size : 17px; font-weight : bold;"><%=success%></h4>
                  <%} %>
                  
                <%String failure = (String)request.getAttribute("failure");
                  if(failure!=null){%>
                  <h4 style="color : red; font-size : 17px; font-weight : bold;"><%=failure%></h4>
                  <%} %>
                  
                <form action="AddLocation" method="post">
                   <label for="Location" class="form-label" style="font-size : 15px;">Location</label>
                   <input type="text" id="Location" name = "location" class="form-control" placeholder="Enter Location" style = "padding : 5px;">

                   <label for="City" class="form-label" style="font-size : 15px;">City</label>
                   <input type="text" id="City" name = "city" class="form-control" placeholder="Enter City" style = "padding : 5px;">

                   <label for="State" class="form-label" style="font-size : 15px;">State</label>
                   <input type="text" id="State" name = "state"  class="form-control" placeholder="Enter State" style = "padding : 5px;">

                   <div class="form-actions">
                       <input type="submit" class="button" value="Add Location" style="font-size : 15px;">
                       <a href="EmployeeAdminDashboard.jsp" class="btn-secondary" style="font-size : 15px;">Back to Dashboard</a>
                  </div>
               </form>
            </div>
        </div>
    </div>
</body>

</html>
