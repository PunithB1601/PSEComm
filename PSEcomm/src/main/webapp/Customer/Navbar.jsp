<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
   

   li {

            list-style: none;
        }

        a {
            text-decoration: none;
        }

        nav {
            width: 100%;
            max-width: 1800px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 0 auto;
            padding: 5px 10px;
            overflow-x: hidden;
        }

        .brand a {
            font-size: 2rem;
            color: black;
        }

        .menu-list {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 10px;
        }

        .desktop-menu .menu-list-item,
        .mobile-menu-list .menu-list-item {
            color: black;
            padding: 5px 7px;
            font-size: 1.05rem;
            ;
        }

        .desktop-menu .menu-list-item-active,
        .mobile-menu-list .menu-list-item-active {
            background: black;
            color: white;
            border-radius: 8px;
        }

        .desktop-menu {
            display: flex;
        }

        .mobile-menu {
            display: none;
        }

        .mobile-menu-list {
            position: fixed;
            top: 0;
            right: 0;
            background: white;
            width: 60%;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: center;
            transition: all 1s;
            z-index: 999;
            height: 100vh;
            gap: 10px;
        }

        .hide-mobile-menu {
            right: -100%;
        }

        #menu-close-btn {
            position: absolute;
            top: 20px;
            left: 20px;
        }
        @media (max-width:500px) {

            .desktop-menu {
                display: none;
            }

            .mobile-menu {
                display: block;
            }
        }
</style>

<nav>

        <div class="brand">

            <a href="#">Ecommerce</a>

        </div>

        <ul class="menu-list desktop-menu">

           <li><a class="menu-list-item <%= request.getAttribute("menu").toString().equalsIgnoreCase("Home") ? "menu-list-item-active" :"" %>" href="<%= request.getContextPath()+"/Customer/Home.jsp"%>">Home</a></li>
            <li><a class="menu-list-item <%= request.getAttribute("menu").toString().equalsIgnoreCase("Shop") ? "menu-list-item-active" :"" %>" href="<%= request.getContextPath()+"/Customer/Shop.jsp"%>">Shop</a></li>
            <li><a class="menu-list-item <%= request.getAttribute("menu").toString().equalsIgnoreCase("Cart") ? "menu-list-item-active" :"" %>" href="">Cart</a></li>
            <li><a class="menu-list-item <%= request.getAttribute("menu").toString().equalsIgnoreCase("Orders") ? "menu-list-item-active" :"" %>" href="">Orders</a></li>
            <li><a class="menu-list-item <%= request.getAttribute("menu").toString().equalsIgnoreCase("Profile") ? "menu-list-item-active" :"" %>" href="">Profile</a></li>
            <li><a class="menu-list-item" href="">Logout</a></li>
        </ul>

        <div class="mobile-menu">
            <i class="fa-solid fa-bars" id="menu-bar"></i>
            <ul class="mobile-menu-list hide-mobile-menu">
                <i class="fa-solid fa-arrow-right" id="menu-close-btn"></i>
                <li><a class="menu-list-item <%= request.getAttribute("menu").toString().equalsIgnoreCase("Home") ? "menu-list-item-active" :"" %>" href="">Home</a></li>
            <li><a class="menu-list-item <%= request.getAttribute("menu").toString().equalsIgnoreCase("Shop") ? "menu-list-item-active" :"" %>" href="">Shop</a></li>
            <li><a class="menu-list-item <%= request.getAttribute("menu").toString().equalsIgnoreCase("Cart") ? "menu-list-item-active" :"" %>" href="">Cart</a></li>
            <li><a class="menu-list-item <%= request.getAttribute("menu").toString().equalsIgnoreCase("Orders") ? "menu-list-item-active" :"" %>" href="">Orders</a></li>
            <li><a class="menu-list-item <%= request.getAttribute("menu").toString().equalsIgnoreCase("Profile") ? "menu-list-item-active" :"" %>" href="">Profile</a></li>
            <li><a class="menu-list-item" href="">Logout</a></li>
            </ul>
        </div>

    </nav>
    
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js" ></script>
    <script type="text/javascript">
        

            $("#menu-bar").on('click', () => {
                $(".mobile-menu-list").removeClass("hide-mobile-menu")
            })

            $("#menu-close-btn").on('click', () => {
                $(".mobile-menu-list").addClass("hide-mobile-menu")
            })

       
    </script>