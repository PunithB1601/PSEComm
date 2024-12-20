<%@page import="com.productCategory.DTO.ProductCategory"%>
<%@page import="java.util.List"%>
<%@page import="com.productCategory.DAO.productCategoryDDAOImpl"%>
<%@page import="com.productCategory.DAO.productCategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setAttribute("menu", "Home"); 
  
  productCategoryDAO productCategoryDAO = new productCategoryDDAOImpl();
  
  List<ProductCategory> categories = productCategoryDAO.getProductCategory();


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<%@include file="/Customer/utils/CommonUtils.jsp" %>

<style type="text/css">


   body{
   
   width: 100%;
   max-width: 1800px;
   margin: 0 auto;
    
   }
    
    

   .info-wrapper {
            width: 80%;
            margin: 0 auto;
            height: 500px;
            background: rgb(198, 107, 107);
            position: relative;
        }

        .swiper {
            width: 100%;
        }

        .swiper-wrapper {
            display: flex;
        }

        .card {
            width: 100%;
            height: 500px;
            border-radius: 10px;
            background: rgb(241, 225, 225);
        }

        /* Custom navigation buttons */
        .swiper-button-next::after,
        .swiper-button-prev::after {
            content: "";
        }

        .swiper-button-next,
        .swiper-button-prev {
            border-radius: 50%;
            border: none;
            color: black;
            width: 30px;
            height: 30px;
            background-color: aliceblue;
            box-shadow: 1px 1px 2px black;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .swiper-button-next {
            right: -1rem;
        }

        .swiper-button-prev {
            left: -1rem;
            display: none;
        }

        .swiper-pagination-bullet {
            background: black;
        }

        .swiper-pagination-bullet-active {
            background: red;
        }

        .custom-pagination {
            bottom: -1rem !important;
        }


        /* category */
        .category-wrapper {

            width: 100%;
            margin: 10px auto;
            padding:20px;
        }
        .category-wrapper h2{
            margin-bottom: 10px;
            font-weight: 400;
            font-size: 1.5rem;
        }

        .category-items{
            display: flex;
            justify-content: flex-start;
            align-items: flex-start;
            flex-wrap:wrap;
        }

        .category-card{
            width: 150px;
            height: 150px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            margin: 10px;
            flex-shrink: 0;
            flex-grow: 0;
            padding: 5px;
            border-radius: 5px;
            box-shadow: 0px 1px 5px #efefef !important;
            transition:0.75s all;
        }
        .category-card:hover{
          box-shadow: 0px 1px 5px gray !important;
          cursor: pointer;
          transform:scale(1.1);
        }
        .category-card img{
            width: 100%;
            height: 100px;
            border-radius: 10px;
        }
        .category-card .category-title{
            font-size: 0.9rem;
            font-weight: 300;
            margin-bottom: 0;
        }
        



   @media (max-width:600px) {

            .info-wrapper {
                width: 95%;
                height: 400px;
            }

            .card {
                height: 400px;
            }

        }
 
</style>
</head>
<body>
<%@include file="/Customer/Navbar.jsp" %>
  
   <section class="body-wrapper">

        <section class="info-wrapper">

            <div class="card_container swiper">
                <div class="swiper-wrapper">
                    <article class="card swiper-slide">

                    </article>
                    <article class="card swiper-slide"></article>
                    <article class="card swiper-slide"></article>
                    <article class="card swiper-slide"></article>
                    <article class="card swiper-slide"></article>
                    <article class="card swiper-slide"></article>
                    <article class="card swiper-slide"></article>
                    <article class="card swiper-slide"></article>
                </div>

            </div>
            <div class="swiper-button-next"><i class="fa-solid fa-angle-right"></i></div>
            <div class="swiper-button-prev"><i class="fa-solid fa-angle-left"></i></div>
            <!-- <div class="swiper-pagination custom-pagination"></div> -->


        </section>

        <!-- category wrapper -->
        <section class="category-wrapper">
            
            <h2>Featured Categories</h2>

            <article  class="category-items">

                <%
                 
                for(ProductCategory pc : categories)
                {
                	%>
                 <a class="category-card" href="<%= request.getContextPath()+"/Customer/Shop.jsp?category="+pc.getCategoryId()%>">

                    <img src="https://cdn.dribbble.com/userupload/4390125/file/original-9df8ad18f4bf7535ce4f18c4116c5cf9.jpg?resize=400x0"
                        alt="">
                    <h2 class="category-title"><%=pc.getName()%></h2>
    
                </a>
                	
                	<%
                }
                
                %>
                
        
            </article>

        </section>


    </section>
    
    <script>
        // Initialize Swiper
        var swiper = new Swiper(".card_container", {
            spaceBetween: 10,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
            breakpoints: {
                200: {
                    slidesPerView: 1,
                    spaceBetween: 10,
                },

            },
            on: {
                reachBeginning: function () {
                    document.querySelector(".swiper-button-prev").style.display = "none";
                },
                reachEnd: function () {
                    // Hide the next button
                    document.querySelector(".swiper-button-next").style.display = "none";
                },
                fromEdge: function () {
                    // Show both buttons when not at the edges
                    document.querySelector(".swiper-button-prev").style.display = "flex";
                    document.querySelector(".swiper-button-next").style.display = "flex";
                },
            },
        });
    </script>


</body>
</html>