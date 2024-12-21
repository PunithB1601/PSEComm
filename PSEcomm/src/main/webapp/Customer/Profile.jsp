<%@page import="com.emp.DTO.Location"%>
<%@page import="java.util.List"%>
<%@page import="com.emp.DAO.locationDAOimp"%>
<%@page import="com.emp.DAO.locationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setAttribute("menu", "Profile");%>
<%@include file="/Customer/CustomerSession.jsp" %>
<%
  if(customer==null)
  {
	  request.setAttribute("failure", "Please Login");
	  RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Customer/Login.jsp");
	  requestDispatcher.forward(request, response);
	  return;
  }
%>
<%
  locationDAO locationDAO = new locationDAOimp();
   List<Location> locations = locationDAO.getlocation();
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Profile</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<%@include file="/Customer/utils/CommonUtils.jsp" %>

<style type="text/css">
       
       .profile-section{
        width: 100%;
        min-height: 80vh;
        display: flex;
        justify-content: center;
        align-items: center;
       }
      

        body {
            width: 100%;
            max-width: 1800px;
            margin: 0 auto;
        }

        #signup {
            width: 450px;
            margin: 0 auto;
            border-radius: 10px;
            border: 1px solid gray;
            padding: 15px;
            box-shadow: 1px 2px 5px graytext !important;
        }

        #signup h4 {
            font-size: 1.6rem;
            color: #7209b7;
            margin-top: 15px;
            margin-bottom: 20px;
        }

        .form-footer {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 20px;
        }

        .form-footer button {
            width: 35%;
            background: #14213d;
            color: white;
        }
        #cancel{
            width: 100%;
            color: white;
            text-decoration: none;
            display: block;
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
        .request-location{
         font-size: 0.6rem;
        }
        .request-location a{
         color: graytext;
        }
        .containt{
            display: flex;
        }
        .containt label{
            width: 130px;
        }
        
    </style>


</head>
<body>
<%@include file="/Customer/Navbar.jsp" %>
 
 <section class="profile-section">
      <form id="signup" method="post" action="<%=request.getContextPath()+"/Customer/UpdateProfile"%>">

        <h4 class="text-center">Update your Profile</h4>

        <div class="form-group containt">
            <label for="fname">User Id</label>
            <input type="text" class="form-control" value="<%=customer.getCid()%>" disabled name="userid" id="fname">
        </div>

        <div class="form-group containt">
            <label for="fname">First Name</label>
            <input type="text" class="form-control" value="<%=customer.getFirstName() %>" name="firstName" id="fname">
        </div>

        <div class="form-group containt">
            <label for="lname">Last Name</label>
            <input type="text" class="form-control" value="<%=customer.getLastName() %>" name="lastName" id="lname">
        </div>

        <div class="form-group containt">
            <label for="email">Email</label>
            <input type="email" class="form-control" value="<%=customer.getEmail()%>" disabled name="email" id="email">
        </div>


        <div class="form-group containt">
            <label for="mobile">Mobile</label>
            <input type="text" class="form-control" value="<%=customer.getPhone() %>" name="phone" id="mobile">
        </div>

        <div class="form-group containt">
            <label for="inputState">Location</label>
            <select name="location" id="inputState"  class="form-control">
            	
                <%
                 for(Location location : locations)
                 {
                	 %>
                	  <option <%=location.getLid() == customer.getLid() ? "selected='selected'":""  %> value="<%=location.getLid()%>" ><%=location.getLocation()+" , "+location.getCity()+" , "+location.getState() %></option>
                	 <%
                 }
                %>
            </select>
          
        </div>
             
 
        <div class="form-footer">
            <button class="btn btn-primary mb-3"><a id="cancel" href="">Cancel</a></button>
            <button type="submit" class="btn btn-primary mb-3">Save</button>
           
        </div>
    </form>
 
 </section>

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