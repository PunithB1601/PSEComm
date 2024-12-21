<%@page import="com.productCategory.DTO.ProductCategory"%>
<%@page import="com.productCategory.DAO.productCategoryDDAOImpl"%>
<%@page import="com.productCategory.DAO.productCategoryDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.emp.DTO.Location"%>
<%@page import="com.emp.DAO.locationDAOimp"%>
<%@page import="com.emp.DAO.locationDAO"%>
<%@page import="com.emp.DTO.Product"%>
<%@page import="com.emp.DAO.ProductDAOImp"%>
<%@page import="com.emp.DAO.ProductDAO"%>
<%@page import="com.emp.DAO.EmployeeDAOImp"%>
<%@page import="com.emp.DAO.EmployeeDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.emp.DTO.Employee"%>
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
    body{
    background-color: #F1F0E8;
    }
    
    .d-flex{
    background-color: #3c3d37;
    }
        .sidebar {
            height: 100vh;
            overflow-y: auto;
            background-color: #1abc9c;
            overflow: auto;
        }
        .sidebar a {
            color: #ffffff;
            padding: 12px;
            text-align : center;
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
        a{
            text-decoration: none;
        }
        a:hover{
            opacity: 0.8;
            
        }
        
        .sidebar input:hover {
            background-color: #16a085;
        }
        
        input:hover{
            opacity: 0.8;
            
        }
       
       .view:hover{
         color : red;
       }
       
       .big{
          transition: transform 0.3s ease-in-out;
       }
       
       .big:hover{
          transform: scale(1.07);
         }
       
   
    </style>
    <% 
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>
    
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: white;">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold text-primary" href="#" style="color: black;">Admin Dashboard</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                
                <%Employee e=(Employee)session.getAttribute("employee"); %>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Welcome, <%=e.getFname() %></a>
                    </li>
                   
                </ul>
            </div>
        </div>
    </nav>

    <div class="d-flex" >
        <div class="sidebar p-3" style="background-color:#3C3D37;">
            <a href="#dashboard">Dashboard</a>
            <a href="empList1.jsp">Manage Users</a>
			<a href="ViewProduct.jsp">View Products</a>
            <a href="AdminProfile.jsp">Profile</a>
            <a href="forgotPassword.jsp">ResetPin</a>
         	<form action="logout" method="post">
                <input type="submit" name="logout" value="Logout" class="btn btn-sm ms-3" style="color : white; font-weight : bold; font-size : 16px; left : 0px; padding: 12px; ">
            </form> 
        </div>
<%
EmployeeDAO e1= new EmployeeDAOImp();
List<Employee> employees =e1.getEmployee();
ProductDAO dao = new ProductDAOImp();
List<Product> products = dao.getproducts();


//locationDAO dao2 = new locationDAOimp();
//List<Location> locations =dao2.getlocation();
%>
        <div class="content flex-grow-1">
            <div class="row mb-4" >
               <a href="AddProduct.jsp" > <div class="col-md-3 big" >
                <div class="card text-center text-bg-primary" >
                    <div class="card-body" style="background-color:white; color: black;border-radius: 10px ">
                        <h5 class="card-title">Add Product</h5>
                        <p class="card-text fs-4"><%=products.size() %></p>
                    </div>
                </div></a>
            </div>
            
                <div class="col-md-3">
                    <a href="DeleteProduct.jsp">
                        <div class="card text-center text-bg-success big">
                            <div class="card-body" style="background-color:white; color: black; border-radius: 10px">
                                <h5 class="card-title">Delete Product</h5>
                                <p class="card-text fs-4">0</p>
                            </div>
                        </div></a>
                </div>
                
                <div class="col-md-3">
                    <a href="AddEmployee.jsp"><div class="card text-center text-bg-warning big">
                        <div class="card-body" style="background-color:white; color: black;border-radius: 10px ">
                            <h5 class="card-title">Add Employees</h5>
                            <p class="card-text fs-4"><%=employees.size() %></p>
                        </div>
                    </div></a>
                </div>
                
                <div class="col-md-3">
                   <a href="AddLocation.jsp">
                    <div class="card text-center text-bg-danger big">
                        <div class="card-body" style="background-color:white; color: black; border-radius: 10px">
                            <h5 class="card-title">Add Locations</h5>
                            <%locationDAO ldao = new locationDAOimp();
                               int count = ldao.getCount();%>
                            <p class="card-text fs-4"><%=count%></p>
                        </div>
                    </div>
                   </a>
                </div>
            </div>

            <div class="row">
                <!-- <div class="col-md-6">
                    <div class="card">
                        <div class="card-header bg-primary text-white">Recent Activities</div>
                        <div class="card-body">
                            <ul class="list-group">
                                <li class="list-group-item">User John updated profile</li>
                                <li class="list-group-item">System backup completed</li>
                                <li class="list-group-item">New user registration approved</li>
                            </ul>
                        </div>
                    </div>
                </div> -->
                
                
          <!--     <div class="col-md-6">
                    <div class="card">
                        <div class="card-header bg-primary text-white">Employees</div>
                        <div class="card-body">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Employee Type</th>
                                        <th scope="col">Count</th>
                                        <th scope="col">Details</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Total Employees</td>
                                        <td>150</td>
                                        <td>
                                            <a href="ViewEmp.jsp" style = "font-weight : bold;" class="view">View Employees
                                        </a>
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Managers</td>
                                        <td>10</td>
                                        <td>
                                            <a href="ViewManager.jsp" style = "font-weight : bold;" class="view">View Managers
                                        </a>
                                        </a>
                                          
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Salesmen</td>
                                        <td>50</td>
                                        <td>
                                            <a href="ViewSalesmen.jsp" style = "font-weight : bold;" class="view">View Salesman
                                        </a>
                                            </button>
                                        </a>
                                            
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div> -->

<!-- PRODUCT LIST TABLE -->
              <div class="col-md-6">
                    <!-- <div class="card">
                        <div class="card-header bg-success text-white">System Notifications</div>
                        <div class="card-body">
                            <ul class="list-group">
                                <li class="list-group-item">No critical errors detected</li>
                                <li class="list-group-item">Scheduled maintenance at 12:00 AM</li>
                                <li class="list-group-item">All services running smoothly</li>
                            </ul>
                        </div>
                    </div> -->
                  <div class="card">
                        <div class="card-header bg-success text-white">Product List</div>
                        <div class="card-body">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">PID</th>
                                        <th scope="col">Product Name</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Category</th>
                                    </tr>
                                </thead>
                                <tbody>
                                  <%
                                    List<Product> data = dao.getProductAndCategorys();
								    Iterator<Product> itr = data.iterator();
								    int counter = 0; // Initialize a counter
								    while(itr.hasNext() && counter < 7) { // Limit the loop to 7 products
								        Product p = itr.next();
								        counter++; // Increment the counter
								  %>
								        <tr>
								            <td><%= p.getProduct_Id() %></td>
								            <td><%=p.getProducr_Name() %></td>
								            <td><%= p.getPrice() %></td>
								            <td><%= p.getCategory_Name() %></td> 
								        </tr>
								  <% }%>
                               </tbody>
                            </table>
                        </div>
                    </div>
                </div>
               
               
  <!-- EMPLOYEE TABLE --> 
               <div class="col-md-6">
                    <div class="card">
                        <div class="card-header bg-primary text-white">Employees</div>
                        <div class="card-body">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Employee Type</th>
                                        <th scope="col">Count</th>
                                        <th scope="col">Details</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Total Employees</td>
                                        <td>150</td>
                                        <td>
                                            <a href="ViewEmp.jsp" style = "font-weight : bold;" class="view">View Employees
                                        </a>             
                                        </td>
                                    </tr>
                                                              
                                    <tr>
                                        <td>Managers</td>
                                        <td>10</td>
                                        <td>
                                            <a href="ViewManager.jsp" style = "font-weight : bold;" class="view">View Managers
                                        </a>             
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td>Salesman</td>
                                        <td>20</td>
                                        <td>
                                            <a href="ViewSalesmen.jsp" style = "font-weight : bold;" class="view">View Salesmen
                                        </a>             
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td>Developer</td>
                                        <td>20</td>
                                        <td>
                                            <a href="ViewDevelopers.jsp" style = "font-weight : bold;" class="view">View Developers
                                        </a>             
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td>Accountant</td>
                                        <td>20</td>
                                        <td>
                                            <a href="viewAccountant.jsp" style = "font-weight : bold;" class="view">View Accountants
                                        </a>             
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td>Dispatcher</td>
                                        <td>15</td>
                                        <td>
                                            <a href="ViewDispatcher.jsp" style = "font-weight : bold;" class="view">View Dispatcher
                                        </a>             
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td>Tester</td>
                                        <td>10</td>
                                        <td>
                                            <a href="ViewTester.jsp" style = "font-weight : bold;" class="view">View Testers
                                        </a>             
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div> 
               
                 
            </div>
        </div>
    </div>
</body>
</html>