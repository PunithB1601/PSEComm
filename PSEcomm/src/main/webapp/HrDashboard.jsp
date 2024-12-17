<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HR Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            display: flex;
            height: 100vh;
            background-color: #f4f6f9;
        }

        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: white;
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background 0.3s;
        }

        .sidebar a:hover {
            background-color: #34495e;
        }

        .main {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .topbar {
            background-color: #ffffff;
            padding: 15px 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .topbar h1 {
            font-size: 20px;
        }

        .dashboard {
            padding: 20px;
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .card {
            background: white;
            width: 300px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .card h3 {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 24px;
            font-weight: bold;
            color: #3498db;
        }
        .btn{
            padding: 10px 20px; 
            border: none;
             border-radius: 5px; 
             background-color: #3498db;
              color: white;  
              cursor: pointer;

        }
        .btn1{
            padding: 5px 10px;
            border: soild black 2px;
             border-radius: 5px;
            background-color: aliceblue;
            cursor: pointer;
            color:black;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>HR Dashboard</h2>
        <a href="#">Employee Records</a>
        <a href="#">Attendance</a>
        <a href="#">Leave Requests</a>
        <a href="#">Add employee</a>
        <a href="#">Remove employee</a>
    </div>
    <div class="main">
        <div class="topbar">
            <h1>Welcome HR</h1>
            <button class="btn" >Logout</button>
        </div>
        <div class="dashboard">
             <div class="card">
                <h3>Total Employees</h3>
                <p>120</p>
                <button class="btn1">view employees</button>
            </div> 
            <div class="card">
                <h3>Active Projects</h3>
                <p>15</p>
                <button class="btn1">view Projects</button>
            </div>
             <div class="card">
                <h3>Active Products</h3>
                <p>5</p>
                <button class="btn1">view Products</button>
            </div>
        </div>

    </div>

</body>
</html>
    