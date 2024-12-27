<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.3/font/bootstrap-icons.min.css"
        integrity="sha512-dPXYcDub/aeb08c63jRq/k6GaKccl256JQy/AnOq7CAnEZ9FzSL9wSbcZkMp4R26vBsMLFYH4kQ67/bbV8XaCQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="./style.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .contact {
            position: relative;
            min-height: 90vh;
            padding: 20px 100px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            background-color: rgb(235, 235, 235);

        }

        .contactcontent {
            max-width: 800px;
            text-align: center;
        }

        .contactcontainer {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 30px;
        }

        .contactinfo {
            width: 50%;
            display: flex;
            flex-direction: column;
        }

        .contactbox {
            position: relative;
            padding: 30px 0;
            display: flex;
        }

        .contacticon {
            min-width: 60px;
            height: 60px;
            background-color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 50%;
            font-size: 22px;

        }

        .textcontact {
            display: flex;
            margin-left: 20px;
            font-size: 16px;
            color: black;
            flex-direction: column;
            font-weight: 300;
        }

        .contact-form {
            width: 45%;
            padding: 40px;
            background-color: white;
            border-radius: 8px;
        }

        .contact-form .inputBox {
            position: relative;
            width: 100%;
            margin: 10px;
        }

        .contact-form .inputBox input {
            width: 100%;
            padding: 5px 0;
            font-size: 16px;
            margin-bottom: 10px;
        }

        @media (max-width:991px) {
            .contact {
                padding: 50px;
            }

            .contactcontainer {
                flex-direction: column;
            }

            .contactcontainer .contactinfo {
                margin-bottom: 40px;
            }

            .contactcontainer .contactinfo {
                width: 100%;
            }

            .contactcontainer .contact-form {
                width: 100%;
            }

        }

        .contactcontent h2 {
            font-size: 40px;
            color: black;
            margin-bottom: 20px;
        }
        footer{
            background-color: #213555;
            max-width: 100%;
            padding: 10px;
        }
        footer p{
            color: white;
            text-align: center;
            margin: 0%;

        }
        footer marquee{
            color: white;
            font-size: large;
            text-decoration: none;
        }
    </style>
</head>

<body>
    <div class="contact">
        <div class="contactcontent">
            <h2>Contact Us</h2>
        </div>
        <div class="contactcontainer">
            <div class="contactinfo">
                <div class="contactbox">
                    <div class="contacticon">
                        <i class="bi bi-geo-alt-fill"></i>
                    </div>
                    <div class="textcontact">
                        <h3 style="font-weight: 600;color: #00bcd4;">Address</h3>
                        <p style="font-weight: bold;">Pentagonspace <br>765, 8th Main Rd, Govindaraja Nagar Ward, MC
                            Layout, Vijayanagar, Bengaluru, Karnataka 560040</p>

                    </div>
                </div>
                <div class="contactbox">
                    <div class="contacticon">
                        <i class="bi bi-telephone-fill"></i>
                    </div>
                    <div class="textcontact">
                        <h3 style="font-weight: 600;color: #00bcd4;">Phone</h3>
                        <p style="font-weight: bold;">+91 9999999999</p>

                    </div>
                </div>
                <div class="contactbox">
                    <div class="contacticon">
                        <i class="bi bi-envelope"></i>
                    </div>
                    <div class="textcontact">
                        <h3 style="font-weight: 600;color: #00bcd4;">Email</h3>
                        <p style="font-weight: bold;">abc@gmail.com</p>

                    </div>
                </div>
            </div>
            <div class="contact-form">
                <form action="">
                    <h2 style="">Send Message</h2>
                    <div class="inputBox">
                        <label style="font-weight: 600;">Full Name</label>
                        <input type="text" class="form-control" placeholder="Enter Name" id="name" required>
                    </div>
                    <div class="inputBox">
                        <label style="font-weight: 600;">Email address</label>
                        <input type="email" class="form-control" id="email" placeholder="Enter email" required>
                    </div>
                    <div class="inputBox">
                        <label style="font-weight: 600;">Phone Number</label>
                        <input type="number" class="form-control" id="number" placeholder="Enter Phone No." required>
                    </div>
                    <div class="inputBox">
                        <label style="font-weight: 600;">How can we Help?</label>
                        <textarea type="text" class="form-control" placeholder="Type your Message.." rows="2"
                            id="message" required></textarea>
                    </div>
                    <div><button id="btn" style="margin-left: 10px;" type="submit"
                            class="btn btn-warning">Submit</button></div>
                </form>
            </div>
        </div>
    </div>
    <footer>
        <p>&copy; 2024 All rights reserved</p>
        <p>Ecommerce website</p>
        <p>Developed by: Pentagonspace Students</p>
        <marquee behavior="" direction="">ShivuRoopesh M, Pradeepkumar S, Abhishek , Sunil Biradar, Shridar</marquee>
        
    </footer>
</body>
</html>