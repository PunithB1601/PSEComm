<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
        integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        .container {
            max-width: 80rem;
            margin: 0 auto;
            overflow-y: hidden;
            font-family: sans-serif;
            background-color: #efefef5b;
            display: flex;
            justify-content: space-between;
            border: 1px solid black;
            border-radius: 10px;
            padding: 50px;
        }
        .img {
            width: 100%;
        }
        img {
            width: 95%;
            height: 80vh;
            background-size: cover;
            border-radius: 15px;
            box-shadow: 2px 2px 10px gray;
        }
        .product {
            width: 100%;
            display: flex;
            flex-direction: column;
            margin-top: -10px;
            margin-left: 5px;
        }
        .btns {
            display: flex;
        }

        .btn1 {
            background-color: rgba(25, 24, 24, 0.921);
            color: rgb(246, 242, 242);
            border: none;
            padding: 5px;
            width: 8rem;
            font-weight: bold;
            margin-right: 10px;
            border-radius: 10px;
        }
        .btn2 {
            background-color: rgba(4, 75, 253, 0.921);
            color: rgb(255, 254, 254);
            border: none;
            padding: 10px;
            width: 9rem;
            font-weight: bold;
            border-radius: 10px;
        }
        @media (min-width: 480px) and (max-width: 600px) {
            .container {
                display: flex;
                flex-wrap: wrap;
            }
            img {
                height: 50vh;
            }
        }
        @media (min-width: 600px) and (max-width: 1024px) {
            .container {
                flex-wrap: wrap;
                max-width: 80rem;
            }
            .img{
                display: flex;
                justify-content: center;
                align-items: center;
            }
            img {
                height: 50vh;
                width: 60%;   
            }
        }
        @media (max-width: 480px) {
            .container {
                display: flex;
                flex-wrap: wrap;
            }
            img {
                height: 50vh;
                width: 100%;
            }
            .product {
                margin: 0%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="img">
            <img src="mountain.jpg" alt="Product imgage">
        </div>
        <div class="product">
            <div class="product-head">
                <h2 id="name">Product Name</h2>
                <h3 id="price"><i class="fa-solid fa-indian-rupee-sign"></i> Price</h3>
                <h4>Category</h4>
                <p id="desc">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore itaque inventore quaerat
                    illum sit eius architecto neque ipsam nostrum. Cumque labore doloribus hic, vitae reiciendis
                    dignissimos! Consequuntur labore hic nisi!</p>
            </div>
            <div class="btns">
                <button class="btn1"><i class="fa-solid fa-bolt"></i> Buy Now</button>
                <button class="btn2"><i class="fa-solid fa-cart-shopping"></i> Add to cart</button>
            </div>

        </div>

    </div>
</body>

</html>